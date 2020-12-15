use std::sync::{Arc, Mutex};
use webview_official::Webview;

/// The plugin interface.
pub trait Plugin {
  /// The JS script to evaluate on init.
  fn init_script(&self) -> Option<String> {
    None
  }
  /// Callback invoked when the webview is created.
  #[allow(unused_variables)]
  fn created(&self, webview: &mut Webview<'_>) {}

  /// Callback invoked when the webview is ready.
  #[allow(unused_variables)]
  fn ready(&self, webview: &mut Webview<'_>) {}

  /// Add invoke_handler API extension commands.
  #[allow(unused_variables)]
  fn extend_api(&self, webview: &mut Webview<'_>, payload: &str) -> Result<bool, String> {
    Err("unknown variant".to_string())
  }
}

thread_local!(static PLUGINS: Arc<Mutex<Vec<Box<dyn Plugin>>>> = Default::default());

/// Registers a plugin.
pub fn register(ext: impl Plugin + 'static) {
  PLUGINS.with(|plugins| {
    let mut exts = plugins.lock().unwrap();
    exts.push(Box::new(ext));
  });
}

fn run_plugin<T: FnMut(&Box<dyn Plugin>)>(mut callback: T) {
  PLUGINS.with(|plugins| {
    let exts = plugins.lock().unwrap();
    for ext in exts.iter() {
      callback(ext);
    }
  });
}

pub(crate) fn init_script() -> String {
  let mut init = String::new();

  run_plugin(|plugin| {
    if let Some(init_script) = plugin.init_script() {
      init.push_str(&format!("(function () {{ {} }})();", init_script));
    }
  });

  init
}

pub(crate) fn created(webview: &mut Webview<'_>) {
  run_plugin(|ext| {
    ext.created(webview);
  });
}

pub(crate) fn ready(webview: &mut Webview<'_>) {
  run_plugin(|ext| {
    ext.ready(webview);
  });
}

pub(crate) fn extend_api(webview: &mut Webview<'_>, arg: &str) -> Result<bool, String> {
  PLUGINS.with(|plugins| {
    let exts = plugins.lock().unwrap();
    for ext in exts.iter() {
      match ext.extend_api(webview, arg) {
        Ok(handled) => {
          if handled {
            return Ok(true);
          }
        }
        Err(e) => {
          if !e.contains("unknown variant") {
            return Err(e);
          }
        }
      }
    }
    Ok(false)
  })
}

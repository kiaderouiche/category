use anyhow::anyhow;
use serde::{Deserialize, Serialize};
use std::fs::File;
use std::io::Write;
use std::path::{Path, PathBuf};
use tauri_api::file::read_string;
use tauri_api::path::{resolve_path, BaseDirectory};

/// Tauri Settings.
#[derive(Default, Deserialize, Serialize)]
pub struct Settings {
  /// Whether the user allows notifications or not.
  #[cfg(notification)]
  pub allow_notification: Option<bool>,
}

/// Gets the path to the settings file
fn get_settings_path() -> tauri_api::Result<PathBuf> {
  resolve_path(".tauri-settings.json", Some(BaseDirectory::App))
}

/// Write the settings to the file system.
pub(crate) fn write_settings(settings: Settings) -> crate::Result<()> {
  let settings_path = get_settings_path()?;
  let settings_folder = Path::new(&settings_path).parent().unwrap();
  if !settings_folder.exists() {
    std::fs::create_dir(settings_folder)?;
  }
  File::create(settings_path)
    .map_err(|e| anyhow!(e))
    .and_then(|mut f| {
      f.write_all(serde_json::to_string(&settings)?.as_bytes())
        .map_err(|err| anyhow!(err))
    })
}

/// Reads the settings from the file system.
pub fn read_settings() -> crate::Result<Settings> {
  let settings_path = get_settings_path()?;
  if settings_path.exists() {
    read_string(settings_path)
      .and_then(|settings| serde_json::from_str(settings.as_str()).map_err(|e| anyhow!(e)))
  } else {
    Ok(Default::default())
  }
}

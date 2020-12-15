use tiny_http::{Header, Response};

/// Returns the HTTP response of the given asset path.
#[allow(clippy::option_env_unwrap)]
pub fn asset_response(path: &str) -> Response<std::io::Cursor<Vec<u8>>> {
  let asset_path = &format!(
    "{}{}",
    option_env!("TAURI_DIST_DIR")
      .expect("tauri apps should be built with the TAURI_DIST_DIR environment variable"),
    path
  );
  let asset = crate::assets::ASSETS
    .get(asset_path)
    .unwrap_or_else(|_| panic!("Could not read asset {}", asset_path))
    .into_owned();
  let mut response = Response::from_data(asset);
  let header;

  if path.ends_with(".svg") {
    header = Header::from_bytes(&b"Content-Type"[..], &b"image/svg+xml"[..])
      .expect("Could not add svg+xml header");
  } else if path.ends_with(".css") {
    header =
      Header::from_bytes(&b"Content-Type"[..], &b"text/css"[..]).expect("Could not add css header");
  } else if path.ends_with(".html") {
    header = Header::from_bytes(&b"Content-Type"[..], &b"text/html"[..])
      .expect("Could not add html header");
  } else if path.ends_with(".js") {
    header = Header::from_bytes(&b"Content-Type"[..], &b"text/javascript"[..])
      .expect("Could not add Javascript header");
  } else {
    header = Header::from_bytes(&b"Content-Type"[..], &b"application/octet-stream"[..])
      .expect("Could not add octet-stream header");
  }

  response.add_header(header);

  response
}

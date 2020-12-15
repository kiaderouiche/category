//! The Tauri API interface.
#![warn(missing_docs, rust_2018_idioms)]
#![cfg_attr(
  all(not(debug_assertions), target_os = "windows"),
  windows_subsystem = "windows"
)]

/// The Command API module allows you to manage child processes.
pub mod command;
/// The Config module allows you to read the configuration from `tauri.conf.json`.
pub mod config;
/// The Dialog API module allows you to show messages and prompt for file paths.
pub mod dialog;
/// The Dir module is a helper for file system directory management.
pub mod dir;
/// The File API module contains helpers to perform file operations.
pub mod file;
/// The HTTP request API.
pub mod http;
/// The file system path operations API.
pub mod path;
/// The RPC module includes utilities to send messages to the JS layer of the webview.
pub mod rpc;
/// TCP ports access API.
pub mod tcp;
/// The semver API.
pub mod version;

/// The CLI args interface.
#[cfg(feature = "cli")]
pub mod cli;
#[cfg(feature = "cli")]
#[macro_use]
extern crate clap;

/// The desktop notifications API module.
#[cfg(feature = "notification")]
pub mod notification;

pub use tauri_utils::*;

/// Alias for a Result with error type anyhow::Error.
pub use anyhow::Result;
use thiserror::Error;

/// The error types.
#[derive(Error, Debug)]
pub enum Error {
  /// The extract archive error.
  #[error("Extract Error:{0}")]
  Extract(String),
  /// The Command (spawn process) error.
  #[error("Command Error:{0}")]
  Command(String),
  /// The file operation error.
  #[error("File Error:{0}")]
  File(String),
  /// The path operation error.
  #[error("Path Error:{0}")]
  Path(String),
  /// The dialog error.
  #[error("Dialog Error:{0}")]
  Dialog(String),
  /// The network error.
  #[error("Network Error:{0}")]
  Network(attohttpc::StatusCode),
}

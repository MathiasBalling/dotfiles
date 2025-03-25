#!/usr/bin/env rust-script
//! This is a regular crate doc comment, but it also contains a partial
//! Cargo manifest.  Note the use of a *fenced* code block, and the
//! `cargo` "language".
//!
//! ```cargo
//! [dependencies]
//! serde = { version = "1", features = ["derive"] }
//! serde_json = "1"
//! ```

use serde_json::{json, Value};
use std::process::Command;

fn main() {
    // Execute the subprocess to fetch keybinds
    let keybinds_request = Command::new("aerospace")
        .args(["config", "--json", "--get", "mode"])
        .output()
        .expect("Failed to execute command");

    // Check if the command was successful
    if !keybinds_request.status.success() {
        eprintln!("Error: Failed to fetch keybinds");
        return;
    }

    // Parse the JSON output
    let stdout = String::from_utf8_lossy(&keybinds_request.stdout);
    let data: Value = match serde_json::from_str(&stdout) {
        Ok(json) => json,
        Err(_) => {
            eprintln!("Error: Failed to parse JSON");
            return;
        }
    };

    let mut results = json!({"items": []});

    // Process the JSON data
    if let Value::Object(modes) = data {
        for (mode, mode_data) in modes {
            if let Some(bindings) = mode_data.get("binding") {
                match bindings {
                    Value::Object(bindings_map) => {
                        for (key, action) in bindings_map {
                            let action_str = action.to_string();
                            results["items"].as_array_mut().unwrap().push(json!({
                                "title": action_str,
                                "subtitle": format!("({}): {}", mode, key),
                                "match": format!("{} {} {}", mode, key, action_str),
                                "arg": [mode, key]
                            }));
                        }
                    }
                    _ => (),
                }
            }
        }
    }

    // Print the JSON output
    println!("{}", serde_json::to_string(&results).unwrap());
}

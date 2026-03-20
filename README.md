# add_to_path_var

A bash function that safely adds a path entry to a colon-delimited path variable (like `PATH`), with guards against duplicates and non-existent paths.

## Usage

Source the script in your shell config, then call the function:

```bash
source add_to_path_var.bash

add_to_path_var <path> <variable_name>
```

### Arguments

- `path` — The file or directory to add.
- `variable_name` — The name of the path variable to update (e.g. `PATH`, `MANPATH`).

### Examples

```bash
# Add a directory to PATH
add_to_path_var /usr/local/bin PATH

# Add to a custom path variable
add_to_path_var /opt/myapp/lib MYAPP_LIB
```

## Behavior

- Skips silently if the path does not exist on the filesystem.
- Skips silently if the path is already present in the variable.
- Prepends the path to the variable when added.

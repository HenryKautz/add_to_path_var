add_to_path_var() {
  local dir="$1"
  local var_name="$2"
  local current_value

  # Check inputs
  if [[ -z "$dir" || -z "$var_name" ]]; then
    echo "Usage: add_to_path_var <directory> <variable_name>"
    return 1
  fi

  # Only add if path exists
  if [ ! -e "$dir" ]; then
     return
  fi
  
  # Get the current value of the variable using indirect expansion
  current_value="${!var_name}"

  # Only add if not already present
  if [[ ":$current_value:" != *":$dir:"* ]]; then
    if [[ -z "$current_value" ]]; then
      # If empty, just assign
      printf -v "$var_name" '%s' "$dir"
    else
      # Prepend by default
      printf -v "$var_name" '%s' "$dir:$current_value"
    fi
  fi
}

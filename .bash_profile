alias xcopy="xclip -selection clipboard"
alias xpaste="xclip -selection clipboard -o"

alias cal="ncal"



copyToClipBoard() {
  
  if [ -z "$1" ]; then
    echo "Usage: copyfile <file_or_directory>"
    return 1
  fi

  
  if [ ! -e "$1" ]; then
    echo "Error: File or directory not found: '$1'"
    return 1
  fi

  
  local fullpath
  fullpath=$(readlink -f "$1")
  echo -n "file://${fullpath}" | xclip -selection clipboard -t text/uri-list

 
  echo "Copied '$fullpath' to clipboard."
}

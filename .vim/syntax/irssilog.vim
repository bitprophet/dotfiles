syn spell notoplevel
syn match Constant "^\d\{2}:\d\{2}\(:\d\{2}\)\?"
syn match Type "  \* [-a-zA-Z0-9_|]*"
syn match Special "<[ @~&+][-a-zA-Z0-9_|]*>"
syn region Constant start="^---" end="$"
syn region Identifier start="-!-" end="$"

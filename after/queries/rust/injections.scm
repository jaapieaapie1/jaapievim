;extends

; `/* sql */` or `// sql` immediately before a string → inject SQL
(
  [(line_comment) (block_comment)] @_tag
  .
  [
    (string_literal (string_content) @injection.content)
    (raw_string_literal (string_content) @injection.content)
  ]
  (#match? @_tag "[Ss][Qq][Ll]")
  (#set! injection.language "sql")
)

; let <name containing "sql"> = "..."   OR   = format!("...")
(let_declaration
  pattern: (identifier) @_name
  value: [
    (string_literal (string_content) @injection.content)
    (raw_string_literal (string_content) @injection.content)
    (macro_invocation
      (token_tree
        .
        [
          (string_literal (string_content) @injection.content)
          (raw_string_literal (string_content) @injection.content)
        ]))
  ]
  (#lua-match? @_name "sql")
  (#set! injection.language "sql"))

; let <name containing "query"> = "..."   OR   = format!("...")
(let_declaration
  pattern: (identifier) @_name
  value: [
    (string_literal (string_content) @injection.content)
    (raw_string_literal (string_content) @injection.content)
    (macro_invocation
      (token_tree
        .
        [
          (string_literal (string_content) @injection.content)
          (raw_string_literal (string_content) @injection.content)
        ]))
  ]
  (#lua-match? @_name "query")
  (#set! injection.language "sql"))

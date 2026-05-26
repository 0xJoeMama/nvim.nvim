(call
  function: (attribute
    object: (identifier) @_sql
    attribute: (identifier) @_execute)
  arguments: (argument_list ((string (string_content) @injection.content)))
  (#eq? @_sql "cursor")
  (#eq? @_execute "execute")
  (#set! injection.language "sql")
)

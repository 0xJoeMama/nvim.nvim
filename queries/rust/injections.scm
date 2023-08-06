(macro_invocation
  macro: (_) @_mac (#any-of? @_mac "leptos::view")
  (token_tree) @html (#offset! @html 0 0 0 0)
)
(macro_invocation
  macro: (_) @_mac (#any-of? @_mac "sqlx::query")
  (token_tree (raw_string_literal) @sql) (#offset! @sql 1 0 0 0)
)
(macro_invocation
  macro: (_) @_mac (#any-of? @_mac "sqlx::query_as")
  (token_tree (raw_string_literal) @sql) (#offset! @sql 1 0 0 0)
)

require("me.util").safe_run("nvim-tree", function(nvim_tree)
  nvim_tree.setup {
    create_in_closed_folder = true,
    disable_netrw = true, --
    hijack_cursor = true,
    open_on_setup = true,
    open_on_setup_file = true, -- TODO: ????
    -- sync_root_with_cwd = true,
    respect_buf_cwd = true,
    reload_on_bufenter = true,
    on_attach = nil, -- must be like this in order to apply mappings through view.mappings.list
    remove_keymaps = true,
    ignore_ft_on_setup = {},
    view = {
      adaptive_size = false,
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = "left",
      preserve_window_proportions = true,
      signcolumn = "no", -- TODO: ?????
      mappings = {
        list = {
          { key = "l", action = "edit" },
          { key = "h", action = "close_node" },
          { key = "<CR>", action = "vsplit" },
          { key = "H", action = "parent_node" },
          { key = "<Tab>", action = "preview" },
          { key = "r", action = "refresh" },
          { key = "a", action = "create" },
          { key = "d", action = "trash" },
          { key = "b", action = "rename" },
          { key = "x", action = "cut" },
          { key = "y", action = "copy" },
          { key = "p", action = "paste" },
          { key = "Y", action = "copy_absolute_path" },
          { key = "f", action = "live_filter" },
          { key = "<Esc>", action = "clear_live_filter" },
          { key = "q", action = "close" },
          { key = "c", action = "collapse_all" },
          { key = "e", action = "expand_all" },
          { key = "g?", action = "toggle_help" },
          { key = "<leader>c", action = "cd" },
          { key = "i", action = "toggle_file_info" },
        },
      },
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      highlight_opened_files = "icon",
      indent_markers = {
        enable = true,
        inline_arrows = false,
      },
      icons = {
        git_placement = "after",
        glyphs = {
          git = {
            ignored = "",
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "CMakeLists.txt", "stylua.toml" },
    },
    diagnostics = {
      enable = true,
      debounce_delay = 100,
    },
    filesystem_watchers = {
      debounce_delay = 100,
    },
    git = {
      ignore = false,
      show_on_dirs = true,
      timeout = 1000,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = true,
      },
      file_popup = {
        open_win_config = {
          border = "rounded",
        },
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = false, -- TODO: ????
        },
      },
    },
    trash = {
      require_confirm = false,
    },
    live_filter = {
      prefix = "Search: ",
    },
  }
end)

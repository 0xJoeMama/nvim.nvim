local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "<CR>", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "H", api.node.navigate.parent, opts("Parent Directory"))
  vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
  vim.keymap.set("n", "r", api.tree.reload, opts("Refresh"))
  vim.keymap.set("n", "a", api.fs.create, opts("Create"))
  vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
  vim.keymap.set("n", "b", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
  vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
  vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
  vim.keymap.set("n", "Y", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
  vim.keymap.set("n", "<Esc>", api.live_filter.clear, opts("Clean Filter"))
  vim.keymap.set("n", "q", api.tree.close, opts("Close"))
  vim.keymap.set("n", "c", api.tree.collapse_all, opts("Collapse"))
  vim.keymap.set("n", "e", api.tree.expand_all, opts("Expand All"))
  vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "<leader>c", api.tree.change_root_to_node, opts("CD"))
  vim.keymap.set("n", "i", api.node.show_info_popup, opts("Info"))
end

require("me.util").setup("nvim-tree") {
  on_attach = on_attach,
  disable_netrw = true,
  hijack_cursor = false,
  sync_root_with_cwd = false,
  respect_buf_cwd = true,
  reload_on_bufenter = false,
  remove_keymaps = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    adaptive_size = false,
    width = 30,
    hide_root_folder = true,
    side = "left",
    preserve_window_proportions = true,
    signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false,
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
        enable = false,
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

require("nvim-tree").setup {
    sync_root_with_cwd = true, -- Change the nvim-tree root directory to the new cwd
    respect_buf_cwd = true, -- Respect the buffer's cwd
}

-- Python
vim.api.nvim_exec([[
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
]], false)

-- C
vim.api.nvim_exec([[
  autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
]], false)

-- CPP 
vim.api.nvim_exec([[
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
]], false)

-- Rust 
vim.api.nvim_exec([[
  autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab
]], false)


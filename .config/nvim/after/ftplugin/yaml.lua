-- Detect docker compose files and set them to the file type that the docker compose language service looks for
local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
if filename:match("*compose*") then
    vim.bo.filetype = "yaml.docker-compose"
end

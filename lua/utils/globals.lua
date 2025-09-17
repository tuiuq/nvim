-- @param moduleName string
function _G.pRequire(moduleName)
  local status, module = pcall(require, moduleName);
  if not status then
    vim.notify(" Can't find: " .. moduleName)
    return nil
  end

  return module
end

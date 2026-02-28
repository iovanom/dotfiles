
local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local function copy_filename_without_extension()

  -- Get the full path of the current buffer
  local filename_full = vim.fn.expand('%:p')

  -- Check if the buffer has a filename.
  if filename_full == '' then
    print("No file to copy.")
    return
  end

  -- Use fnamemodify to get the filename from the path and remove the extension.
  -- :t gets the "tail" (just the filename).
  -- :r gets the "root" (removes the extension).
  local filename_no_ext = vim.fn.fnamemodify(filename_full, ':t:r')

  -- Set the '+' register (system clipboard) to the modified filename.
  vim.fn.setreg('+', filename_no_ext)

  -- Provide a user-friendly message.
  print("Copied '" .. filename_no_ext .. "' to the clipboard.")
end

return {
  dump = dump,
  copy_filename_without_extension = copy_filename_without_extension
}

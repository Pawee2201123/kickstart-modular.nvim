-- Function to compile C++ code
local function compile_cpp()
  -- Check if the buffer's filetype is cpp
  if vim.bo.filetype == 'cpp' then
    local file_name = vim.fn.expand '%:p' -- Full path of the current file
    local base_name = vim.fn.fnamemodify(file_name, ':r') -- Remove the extension
    local compile_command = string.format('g++ -o %s %s', base_name, file_name)

    --save the file
    vim.cmd ':w'
    -- Execute the compile command
    vim.cmd('! ' .. compile_command)
    -- Notify user
    print('Compiled ' .. file_name .. ' to ' .. base_name)
  else
    print 'Not a C++ file'
  end
end
-- Function to execute binary
local function execute_command()
  if vim.bo.filetype == 'cpp' then
    -- Prompt the user for the input file and output file
    local file_name = vim.fn.expand '%:p' -- Full path of the current file
    local executable = vim.fn.fnamemodify(file_name, ':r') -- Remove the extension
    local input_file = 'input.txt'
    local output_file = 'output.txt'

    -- Build the command
    local command = string.format('cat %s | %s > %s', input_file, executable, output_file)

    -- Execute the command
    vim.cmd('!' .. command)

    -- Notify user
    print('Executed: ' .. command)
  else
    print 'Not a C++ file'
  end
end
-- Key mapping
vim.keymap.set('n', '<leader>ec', compile_cpp, { desc = 'compile a cpp file' })
vim.keymap.set('n', '<leader>ee', execute_command, { desc = 'execute a binary from source' })

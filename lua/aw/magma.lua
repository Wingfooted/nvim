-- Function to open a split terminal window and run 'magma'
function OpenMagma()
	-- Open a horizontal split terminal
	vim.cmd("split | terminal")

	-- Get the terminal buffer number
	local term_bufnr = vim.fn.bufnr('%')

	-- Save the buffer number in a global variable
	vim.b.magma_term_bufnr = term_bufnr

	-- Wait for the terminal to be ready
	vim.defer_fn(function()
		-- Send the magma command
		vim.fn.chansend(vim.b.magma_term_bufnr, "magma\n")
	end, 100)
end

-- Function to run the current portion of visually selected code in the magma terminal
function RunInMagma()
	-- Get the current visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the lines of the selected text
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	-- Concatenate the lines into a single string
	local code = table.concat(lines, "\n")

	-- Send the code to the magma terminal
	local term_bufnr = vim.b.magma_term_bufnr
	if term_bufnr and vim.api.nvim_buf_is_valid(term_bufnr) then
		local job_id = vim.fn.getbufvar(term_bufnr, "&job")
		if job_id ~= -1 then
			vim.fn.chansend(job_id, code .. "\n")
		else
			print("Magma terminal job is not valid.")
		end
	else
		print("Magma terminal is not open. Use :Magma to open it.")
	end
end

function TestFunc()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])
	local code = table.concat(lines, "\n")
	vim.api.nvim_out_write(code)
end

function TestPaste()
	local code="print 1 + 1;"
	local term_bufnr = vim.b.term_bufnr
	-- vim.fn.chansend(vim.fn.getbufvar(term_bufnr, "&job"), code .. "\n")
end
-- Map :Magma to the OpenMagma function
vim.api.nvim_create_user_command('Magma', OpenMagma, {})

-- Map <leader>mg to the RunInMagma function for visual mode
vim.api.nvim_set_keymap('v', '<leader>mg', ':lua TestFunc()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>tp', ':lua TestPaste()<CR>', { noremap = true, silent = true })

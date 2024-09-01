return {
        'vimwiki/vimwiki',
        config = function()
            -- Place any vimwiki-specific configuration here
            vim.g.vimwiki_list = {
                {
                    path = '~/vimwiki/',
                    syntax = 'markdown',
                    ext = '.md'
                }
            }
        end
    }

return {
  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
    config = function()
      local mark = require("harpoon.mark");
      local ui = require("harpoon.ui");
      -- local term = require("harpoon.term");
      local tmux = require("harpoon.tmux");

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = 'Harpoon Mark' });
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Harpoon Menu' });

      vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = 'Harpoon 1' });
      vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = 'Harpoon 2' });
      vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = 'Harpoon 3' });
      vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = 'Harpoon 4' });

      vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end, { desc = 'Harpoon Prev' });
      vim.keymap.set("n", "<C-g>", function() ui.nav_next() end, { desc = 'Harpoon Next' });

      vim.keymap.set("n", "<leader>5", function() tmux.gotoTerminal(1) end, { desc = 'Harpoon Term' });
    end
  },
  {
    dir = "/home/yd/Projects/AST.nvim",
    config = function()
      require("AST").setup({
        displayNodeNames = true,
        nodeTypeRequired = {
          typescriptreact = {
            -- Functions
            { "function_declaration", "󰡱 " },
            { "arrow_function", "󰡱 " },
            { "method_definition", "󰡱 " },

            -- Classes and Types
            { "class_declaration", " " },
            { "interface_declaration", " " },
            { "type_alias_declaration", " " },
            { "enum_declaration", " " },

            -- React Components
            { "function_component_declaration", "󰡱 " },
            { "class_component_declaration", " " },

            -- JSX Elements
            { "jsx_element", "󰜈 " },
            { "jsx_self_closing_element", "󰜈 " },

            -- Control Flow
            { "if_statement", " " },
            { "for_statement", " " },
            { "while_statement", " " },
            { "switch_statement", "󰒉 " },

            -- Imports/Exports
            { "import_statement", "󰋺 " },
            { "export_statement", "󰋺 " },

            -- Variable declarations
            { "variable_declaration", "󰀫 " },
            { "lexical_declaration", "󰀫 " },
          }
        }
      })
    end
  }
}

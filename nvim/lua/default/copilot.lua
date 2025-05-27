require("copilot").setup({
  suggestion = { enabled = true },
  panel = { enabled = true },
})
require("copilot_cmp").setup()
require("CopilotChat").setup({
  debug = false,
  window = {
    layout = "float",
    relative = "editor",
    border = "rounded",
    width = 0.9,
    height = 0.9,
    row = 0.2,
    col = 0.2,
  },
  prompts = {
    explain = "Explain this code",
    refactor = "Refactor this code",
    test = "Write a test case for this code",
    doc = "Generate documentation",
  },
  keymaps = {
    accept_diff = "<C-y>",
    reset_chat = "<C-r>",
    complete = "<Tab>",
    submit_prompt = {
      insert = "<CR>",
    },
    close = {
      normal = "<Esc>",
      insert = "<Esc>",
    },
  },
})

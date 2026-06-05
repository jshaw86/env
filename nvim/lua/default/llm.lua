local llamacpp = require('model.providers.llamacpp')

require('model').setup({
  prompts = {
    zephyr = {
      provider = llamacpp,
      options = {
        model = 'zephyr-7b-beta.Q5_K_M.gguf',
        args = {
          '-c', 8192,
          '-ngl', 35
        }
      },
      builder = function(input, context)
        return {
          prompt =
            '<|system|>'
            .. (context.args or 'You are a helpful assistant')
            .. '\n</s>\n<|user|>\n'
            .. input
            .. '</s>\n<|assistant|>',
          stops = { '</s>' }
        }
      end
    }
  }
})

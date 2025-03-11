return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      startInInsertMode = false,
      openTargetWindow = {
        preferredLocation = "right"
      },
      keymaps = {
        replace = { n = '<localleader>r' },
        qflist = { n = '<localleader>q' },
        syncLocations = { n = '<localleader>s' },
        syncLine = { n = '<localleader>l' },
        close = { n = '<localleader>c' },
        historyOpen = { n = '<localleader>t' },
        historyAdd = { n = '<localleader>a' },
        refresh = { n = '<localleader>f' },
        openLocation = { n = '<localleader>o' },
        openNextLocation = { n = '<C-n>' },
        openPrevLocation = { n = '<C-p>' },
        gotoLocation = { n = '<enter>' },
        pickHistoryEntry = { n = '<enter>' },
        abort = { n = '<localleader>b' },
        help = { n = 'g?' },
        toggleShowCommand = { n = '<localleader>p' },
        swapEngine = { n = '<localleader>e' },
        previewLocation = { n = '<localleader>i' },
        swapReplacementInterpreter = { n = '<localleader>x' },
        applyNext = { n = '<C-y>' },
        applyPrev = { n = '<localleader>k' },
      },
    });
  end
}

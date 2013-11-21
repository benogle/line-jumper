LINES_TO_JUMP = 10

getEditSession = ->
  atom.rootView.getActiveView()?.activeEditSession

module.exports =
  activate: (state) ->
    atom.rootView.command 'line-jumper:move-up', =>
      getEditSession()?.moveCursorUp(LINES_TO_JUMP)

    atom.rootView.command 'line-jumper:move-down', =>
      getEditSession()?.moveCursorDown(LINES_TO_JUMP)

    atom.rootView.command 'line-jumper:select-up', =>
      getEditSession()?.selectUp(LINES_TO_JUMP)

    atom.rootView.command 'line-jumper:select-down', =>
      getEditSession()?.selectDown(LINES_TO_JUMP)

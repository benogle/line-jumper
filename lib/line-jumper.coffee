LINES_TO_JUMP = 10

getEditSession = ->
  atom.workspaceView.getActiveView()?.activeEditSession

module.exports =
  activate: (state) ->
    atom.workspaceView.command 'line-jumper:move-up', =>
      getEditSession()?.moveCursorUp(LINES_TO_JUMP)

    atom.workspaceView.command 'line-jumper:move-down', =>
      getEditSession()?.moveCursorDown(LINES_TO_JUMP)

    atom.workspaceView.command 'line-jumper:select-up', =>
      getEditSession()?.selectUp(LINES_TO_JUMP)

    atom.workspaceView.command 'line-jumper:select-down', =>
      getEditSession()?.selectDown(LINES_TO_JUMP)

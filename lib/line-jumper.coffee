LINES_TO_JUMP = 10

getEditor = ->
  atom.workspaceView.getActiveView()?.editor

module.exports =
  activate: (state) ->
    atom.workspaceView.command 'line-jumper:move-up', =>
      getEditor()?.moveCursorUp(LINES_TO_JUMP)

    atom.workspaceView.command 'line-jumper:move-down', =>
      getEditor()?.moveCursorDown(LINES_TO_JUMP)

    atom.workspaceView.command 'line-jumper:select-up', =>
      getEditor()?.selectUp(LINES_TO_JUMP)

    atom.workspaceView.command 'line-jumper:select-down', =>
      getEditor()?.selectDown(LINES_TO_JUMP)

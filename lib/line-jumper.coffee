getEditor = ->
  atom.workspaceView.getActiveView()?.editor

getLinesToJump = ->
  atom.config.getPositiveInt('line-jumper.numberOfLines', 1)

module.exports =
  configDefaults:
    numberOfLines: 10

  activate: ->
    atom.workspaceView.command 'line-jumper:move-up', ->
      getEditor()?.moveCursorUp(getLinesToJump())

    atom.workspaceView.command 'line-jumper:move-down', ->
      getEditor()?.moveCursorDown(getLinesToJump())

    atom.workspaceView.command 'line-jumper:select-up', ->
      getEditor()?.selectUp(getLinesToJump())

    atom.workspaceView.command 'line-jumper:select-down', ->
      getEditor()?.selectDown(getLinesToJump())

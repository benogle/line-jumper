{WorkspaceView} = require 'atom'
LineJumper = require '../lib/line-jumper'

describe "LineJumper", ->
  editor = null
  beforeEach ->
    atom.workspaceView = new WorkspaceView()

    waitsForPromise ->
      atom.packages.activatePackage("line-jumper")

    atom.workspaceView.openSync('sample.js')
    editor = atom.workspaceView.getActiveView().getEditor()

  describe "moving and selecting down", ->
    it "moves down", ->
      atom.workspaceView.trigger 'line-jumper:move-down'
      pos = editor.getCursorBufferPosition()
      expect(pos).toEqual [10,0]

    it "selects down", ->
      atom.workspaceView.trigger 'line-jumper:select-down'
      bufferRange = editor.getSelectedBufferRange()
      expect(bufferRange).toEqual [[0,0],[10,0]]

  describe "moving and selecting up", ->
    beforeEach ->
      pos = editor.setCursorBufferPosition([12,0])

    it "moves up", ->
      atom.workspaceView.trigger 'line-jumper:move-up'

      pos = editor.getCursorBufferPosition()
      expect(pos).toEqual [2,0]

    it "selects down", ->
      atom.workspaceView.trigger 'line-jumper:select-up'

      bufferRange = editor.getSelectedBufferRange()
      expect(bufferRange).toEqual [[2,0],[12,0]]

  describe "when the line-jumper.numberOfLines config is set", ->
    it "jumps by the configured number of lines", ->
      atom.config.set('line-jumper.numberOfLines', 5)
      atom.workspaceView.trigger 'line-jumper:move-down'
      expect(editor.getCursorBufferPosition()).toEqual [5,0]

      atom.config.set('line-jumper.numberOfLines', 2)
      atom.workspaceView.trigger 'line-jumper:move-down'
      expect(editor.getCursorBufferPosition()).toEqual [7,0]

      atom.config.set('line-jumper.numberOfLines', -1)
      atom.workspaceView.trigger 'line-jumper:move-down'
      expect(editor.getCursorBufferPosition()).toEqual [8,0]

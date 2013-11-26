{WorkspaceView} = require 'atom'
LineJumper = require '../lib/line-jumper'

describe "LineJumper", ->
  editor = null
  beforeEach ->
    atom.workspaceView = new WorkspaceView()
    pack = atom.packages.activatePackage("line-jumper", immediate: true)

    atom.workspaceView.openSync('sample.js')
    editor = atom.workspaceView.getActiveView()

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

{RootView} = require 'atom'
LineJumper = require '../lib/line-jumper'

describe "LineJumper", ->
  editor = null
  beforeEach ->
    window.rootView = new RootView()
    pack = atom.activatePackage("line-jumper", immediate: true)

    rootView.openSync('sample.js')
    editor = rootView.getActiveView()

  describe "moving and selecting down", ->
    it "moves down", ->
      rootView.trigger 'line-jumper:move-down'
      pos = editor.getCursorBufferPosition()
      expect(pos).toEqual [10,0]

    it "selects down", ->
      rootView.trigger 'line-jumper:select-down'
      bufferRange = editor.getSelectedBufferRange()
      expect(bufferRange).toEqual [[0,0],[10,0]]

  describe "moving and selecting up", ->
    beforeEach ->
      pos = editor.setCursorBufferPosition([12,0])

    it "moves up", ->
      rootView.trigger 'line-jumper:move-up'

      pos = editor.getCursorBufferPosition()
      expect(pos).toEqual [2,0]

    it "selects down", ->
      rootView.trigger 'line-jumper:select-up'

      bufferRange = editor.getSelectedBufferRange()
      expect(bufferRange).toEqual [[2,0],[12,0]]

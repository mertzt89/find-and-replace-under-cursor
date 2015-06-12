{CompositeDisposable} = require 'atom'
{requirePackages}     = require 'atom-utils'

module.exports = FindAndReplaceUnderCursor =
  subscriptions: null

  activate: (state) ->
    # Not the most ideal solution, but this forces the find-and-replace
    # package to activate.
    if not atom.packages.isPackageActive('find-and-replace')
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'find-and-replace:toggle')
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'find-and-replace:toggle')

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'project-find:search-under-cursor': => @searchUnderCursor(true)
    @subscriptions.add atom.commands.add 'atom-workspace', 'find-and-replace:search-under-cursor': => @searchUnderCursor(false)

  deactivate: ->
    @subscriptions.dispose()

  searchUnderCursor: (project) ->
    requirePackages('find-and-replace').then ([find]) =>
      return if not find
      editor  = atom.workspace.getActivePaneItem()
      pattern = editor?.getSelectedText()
      pattern = editor?.getWordUnderCursor() if pattern is ""
      return if not pattern

      find.createViews()
      find.findPanel.hide()
      find.projectFindPanel.hide()

      if project
        find.projectFindView.findEditor.setText(pattern)
        find.projectFindView.search()
      else
        find.findView.findEditor.setText(pattern)
        find.findView.findNext()

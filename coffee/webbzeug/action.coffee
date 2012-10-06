window.Webbzeug ?= {}
window.Webbzeug.Action = class Action
  width: 3
  constructor: (@app, @x, @y, @index) ->
    @children = []

  availableParameters: ->
    {
      x: Integer,
      y: Integer,
      width: Integer,
      height: Integer
    }

  render: (contexts) ->
    console.log "rendering...", @index, ":", @constructor.name, "x", @x, "y", @y

    @canvas = $('<canvas>').get(0)

    @canvas.width = @app.getWidth()
    @canvas.height = @app.getHeight()

    @context = @canvas.getContext '2d'

  # Children
  deleteChildren:   -> @children = []
  addChild: (child) -> @children.push child
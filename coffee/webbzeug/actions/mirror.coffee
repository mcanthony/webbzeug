window.Webbzeug ?= {}
window.Webbzeug.Actions ?= {}
window.Webbzeug.Actions.Mirror = class MirrorAction extends Webbzeug.Action
  type: 'mirror'
  availableParameters: ->
    {
      direction: { name: "Direction", type: 'enum', values: { vertical: 'Vertical', horizontal: 'Horizontal'}, default: 'horizontal' }  
    }

  render: (contexts) ->
    super()
    if contexts.length == 0
      console.log "Dude a mirror needs an input"
      return false

    # How to copy the image data from one context to another
    imageData = contexts[0].getImageData 0, 0, @app.getWidth(), @app.getHeight()

    if @getParameter('direction') is 'horizontal'
      for y in [0...imageData.height]
        for x in [0...imageData.width / 2]
          srcIndex  = ((y * imageData.width) << 2) + (x << 2)
          destIndex = (((y + 1) * imageData.width - 1) << 2) - (x << 2)

          imageData.data[destIndex] = imageData.data[srcIndex]
          imageData.data[destIndex + 1] = imageData.data[srcIndex + 1]
          imageData.data[destIndex + 2] = imageData.data[srcIndex + 2]
          imageData.data[destIndex + 3] = imageData.data[srcIndex + 3]
    else
      for y in [0...imageData.height / 2]
        for x in [0...imageData.width]
          srcIndex  = ((y * imageData.width) << 2) + (x << 2)
          destIndex = (((imageData.height - y) * imageData.width) << 2) + (x << 2)

          imageData.data[destIndex] = imageData.data[srcIndex]
          imageData.data[destIndex + 1] = imageData.data[srcIndex + 1]
          imageData.data[destIndex + 2] = imageData.data[srcIndex + 2]
          imageData.data[destIndex + 3] = imageData.data[srcIndex + 3]

    @context.putImageData imageData, 0, 0 
    return @context
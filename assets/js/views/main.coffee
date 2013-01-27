class TL.Views.Main extends Backbone.View

  initialize: (options) ->
    @collection = new TL.Collections.VideoObjects()
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @collection.fetch
      url: @url

  addOne: (image) ->
    view = new TL.Views.Video(model: image)
    ($ "#popular ul").append view.render().el
    
  render: ->
    ($ "#popular ul").html("").fadeIn('fast')
    @collection.each(@addOne, @)
    @

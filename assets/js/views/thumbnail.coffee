class TL.Views.VideoThumbnail extends Backbone.View
  tagName: 'li'
  className: 'span3'

  initialize: () ->
    _.bindAll @
    @template = Handlebars.templates['home/thumbnail']
    @render()
    
  render: ->
    console.log @model
    json = @model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    @

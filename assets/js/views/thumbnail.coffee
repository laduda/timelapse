class TL.Views.VideoThumbnail extends Backbone.View
  tagName: 'li'
  className: 'span3 thumbnails'

  initialize: () ->
    _.bindAll @
    @template = Handlebars.templates['home/thumbnail']
    @render()
    
  render: ->
    json = @model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    @

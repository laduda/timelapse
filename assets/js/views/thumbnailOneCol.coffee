class TL.Views.VideoThumbnailOneCol extends Backbone.View
  tagName: 'li'
  className: ''

  initialize: () ->
    _.bindAll @
    @template = Handlebars.templates['home/thumbnail']
    @render()
    
  render: ->
    json = @model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    @

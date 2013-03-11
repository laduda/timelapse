class TL.Views.VideoRelated extends Backbone.View
  tagName: 'li'
  className: 'span3 related'

  initialize: () ->
    _.bindAll @
    @template = Handlebars.templates['home/videoRelated']
    @render()
    
  render: ->
    json = @model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    @
    
class TL.Views.VideoRelated extends Backbone.View
  tagName: 'li'
  className: 'related'

  events:
    'click':'openView'

  initialize: () ->
    _.bindAll @
    @template = Handlebars.templates['home/videoRelated']
    @render()
  

  openView: (event)->
    event.preventDefault()
    console.log @model.id
    @trigger 'clicked', @model
    @$el.html Handlebars.templates['home/main_video'] json

  render: ->
    json = @model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    @
    

class TL.Views.VideoRelated extends Backbone.View
  tagName: 'li'
  className: 'span4'

  initialize: () ->
    _.bindAll @
    @template = Handlebars.templates['home/videoRelated']
    @render()
    
  render: ->
    @$el.html @template @model.attributes
    @
    
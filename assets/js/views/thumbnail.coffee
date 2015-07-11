class TL.Views.VideoThumbnail extends Backbone.View
  tagName: 'li'
  className: 'col-sm-6 col-md-4 col-lg-3'

  initialize: (options={}) ->
    @more = options.more
    _.bindAll @, 'render'
    @template = Handlebars.templates['home/thumbnail']
    @render()
    
  render: ->
    json = @model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    if @more
      @el.className = 'related'
    @

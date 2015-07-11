class TL.Views.VideoThumbnails extends Backbone.View
  tagName: 'ul'
  className: 'thumbnails'

  initialize: (options={}) ->
    _.bindAll @
    @more = options.more
    #@template = Handlebars.templates['home/thumbnail']
    @render()
    @getVideos()
    
  render: ->

    @

  getVideos: ->
    query = new Parse.Query TL.Models.VideoObject
    if @more
      query.equalTo "more", true
    else
      query.equalTo "status", "approved"
    query.limit(32)
    # limit here
    # TODO: structure query so it rejects main video on the server
    query.find
      success: @renderVideos
      error: @showError

  renderVideos: (models) ->
    $relEl = $(".thumbnails")
    _(models).each (model)->
    # do not rednder main video 
    # if model.id != @model.id
      relatedVideo = new TL.Views.VideoThumbnail
        model: model
        more: @more
      $relEl.append relatedVideo.el
    , @
  
  showError: (error)->
    console.log "error", error

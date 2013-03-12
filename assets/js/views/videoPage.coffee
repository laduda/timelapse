class TL.Views.VideoPage extends Backbone.View
  initialize: (options)->
    _.bindAll @
    @id = options.id
    @template = Handlebars.templates['home/videoPage']
    @showLoader()
    @findVideo()
  
  renderRelated: (modelАrr)->
    $relEl = @$ "#related"
    $relEl.empty()
    _(modelАrr).each (model)->
      # do not rednder main video 
      if model.id != @model.id
        relatedVideo = new TL.Views.VideoRelated
          model: model
        relatedVideo.on 'clicked', @renderMainVideo, @
        $relEl.append relatedVideo.el
    , @

  findVideo: ->
    query = new Parse.Query TL.Models.VideoObject
    query.equalTo "status", "approved"
    query.get @options.id,
      success: @render
      error: @showError

  showError: (error)->
    console.log "error", error

  findRelated: ->
    query = new Parse.Query TL.Models.VideoObject
    query.equalTo "country_name", @model.get 'country_name'
    query.equalTo "status", "approved"
    # TODO: structure query so it rejects main video on the server
    query.find
      success: @renderRelated
      error: @showError
  

  renderMainVideo: (model)->
    @model = model
    @mainVideo.render @model
    @findRelated()

  render: (model)->
    @model = model
    @$el.html @template {}
    @mainVideo = new TL.Views.MainVideo
       el: @$ '#mainvideo'
    @renderMainVideo model


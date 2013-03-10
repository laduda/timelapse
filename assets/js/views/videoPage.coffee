class TL.Views.VideoPage extends Backbone.View
  initialize: (options)->
    _.bindAll @
    @id = options.id
    @template = Handlebars.templates['home/videoPage']
    @findVideo()
  
  renderRelated: (modelАrr)->
    $relEl = @$el.find "#related"
    _(modelАrr).each (model)->
      # do not rednder main video 
      if model.id != @model.id
        relatedVideo = new TL.Views.VideoRelated
          model: model
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
    
  render: (model)->
    @model = model
    json = model.toJSON()
    json[json.video_type] = true
    @$el.html @template json
    @findRelated()


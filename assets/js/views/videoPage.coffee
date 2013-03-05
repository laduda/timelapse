class TL.Views.VideoPage extends Backbone.View
  initialize: (options)->
    _.bindAll @
    @template = Handlebars.templates['home/videoPage']
    @findVideo()
  
  renderRelated: (modelАrr)->
    $relEl = @$el.find("#related")
    _(modelАrr).each (model)->
      relatedVideo = new TL.Views.VideoRelated
        model: model
      $relEl.append relatedVideo.el
  
  findVideo: ->
    query = new Parse.Query TL.Models.VideoObject
    query.get @options.id,
      success: @render
      error: @showError

  showError: (error)->
    console.log "error", error

  findRelated: ->
    query = new Parse.Query TL.Models.VideoObject
    query.equalTo("country_name", @model.get('country_name'));
    # query.notEqualTo("id", @model.get('id'));
    query.find
      success: @renderRelated
      error: @showError

  render: (model)->
    @model = model
    @$el.html @template @model.attributes
    @findRelated()


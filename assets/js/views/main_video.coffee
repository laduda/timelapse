class TL.Views.MainVideo extends Backbone.View

  initialize: (args) ->
    _.bindAll @

  render: (model)->
    TL.app.navigate "/video/#{model.get('city_name')}/#{model.id}", {trigger:false}
    json = model.attributes
    json[json.video_type] = true
    @$el.html Handlebars.templates['home/main_video'] json

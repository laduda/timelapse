class TL.Models.VideoObject extends Parse.Object
  className: 'videoObjects'
  required: []
  initialize: ->
    _.bindAll @
  validate: (attributes, options)->
    _(@required).each (key)->
        return "#{key} is requred" if not (/\w/).test(attributes[key])


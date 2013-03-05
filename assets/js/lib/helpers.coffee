Handlebars.registerHelper 'population', (city)->
  getResult = ->
    result = city + 'pop';

  return new Handlebars.SafeString getResult()

Handlebars.registerHelper 'age', (city)->
  
  result = city + 'age';

  return new Handlebars.SafeString result
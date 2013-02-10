module.exports = (app)->
	app.get '/', (req, res)->
		res.render 'index'
	app.use (req, res) ->
	  newUrl = req.protocol + '://' + req.get('Host') + '/#' + req.url
	  res.redirect newUrl
module.exports = (app)->
	app.get '/', (req, res)->
		res.render 'index'
	# handle backbone routes
#	app.all '*', (req, res)->
#		res.render 'index'
class TL.Views.Tutorials extends Backbone.View
	initialize: ->
		_.bindAll(@)
		@render
	render: ->
		console.log 'Hello'
		@$el.html Handlebars.templates['home/tutorials']()
		@
		
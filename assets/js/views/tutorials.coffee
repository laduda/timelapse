class TL.Views.Tutorials extends Backbone.View
	initialize: ->
		_.bindAll(@)
		@render()
	render: ->
		@$el.html Handlebars.templates['home/tutorials']()
		@
		
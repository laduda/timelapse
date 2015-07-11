class TL.Views.About extends Backbone.View
	initialize: ->
		_.bindAll @, 'render'
		@render()
	render: ->
		@$el.html Handlebars.templates['home/about']()
		@

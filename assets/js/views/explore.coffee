class TL.Views.Explore extends Backbone.View
	initialzie: ->
		@render()
	render: ->
		Handlebars.templates['explore/index']()
		@
  
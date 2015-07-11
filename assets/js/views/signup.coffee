class TL.Views.Modals.SignUp extends Backbone.View
	className: 'share-form modal'
#	events:
		
	initialize: ->
		_.bindAll @
		@render()
	render: ->
		@$el.html Handlebars.templates['home/signup_form']()
class TL.Views.Modals.SignUp extends Backbone.View
	className: 'share-form modal hide fade'
#	events:
		
	initialize: ->
		_.bindAll @
		@render()
	render: ->
		@$el.html Handlebars.templates['home/signup_form']()
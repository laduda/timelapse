class TL.Views.Modals.Share extends Backbone.View
	className: 'share-form modal'
	events:
		'click button':'submit'
		'change input[name]':'setObject'
		
	initialize: ->
		_.bindAll @, 'setObject', 'submit', 'hideModal', 'render'
		@model = new TL.Models.VideoObject()
		@render()
		
	setObject: (event)->
		@model.set(event.target.name, event.target.value)
		
	submit: (event)->
		event.preventDefault()
		@model.save({}, {
			error: @showError
			success: @hideModal
		})
		
	showError: (model, error)->
		console.log(model, error)
		
	hideModal: ->
		@$el.modal('hide')

	render: ->
		@$el.html Handlebars.templates['home/share_form']()
		@

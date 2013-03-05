class TL.Views.Modals.Share extends Backbone.View
	className: 'share-form modal hide fade'
	events:
		'click #submit':'submit'
		'change input[name]':'setObject'
		
	initialize: ->
		_.bindAll(@)
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
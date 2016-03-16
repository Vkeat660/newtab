@Posts = new Meteor.Collection('posts');

Schemas.Posts = new SimpleSchema
	header:
		type:String
		max: 20

	footerLine1:
		type: String
		max: 60

	footerLine2:
		type: String
		max: 60

	createdAt:
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type:Date
		optional:true
		autoValue: ->
			if this.isUpdate
				new Date()

	picture:
		type: String
		autoform:
			afFieldInput:
				type: 'fileUpload'
				collection: 'Attachments'

	overlayColor:
		type: String
		autoform:
			type: 'bootstrap-colorpicker'

	overrideFilters:
		type: Boolean
		autoform:
			afFieldInput:
				type: 'boolean-checkbox'

	owner:
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if this.isInsert
				Meteor.userId()
		autoform:
			options: ->
				_.map Meteor.users.find().fetch(), (user)->
					label: user.emails[0].address
					value: user._id

Posts.attachSchema(Schemas.Posts)

Posts.helpers
	author: ->
		user = Meteor.users.findOne(@owner)
		if user?.profile?.firstName? and user?.profile?.lastName
			user.profile.firstName + ' ' + user.profile.lastName
		else
			user?.emails?[0].address

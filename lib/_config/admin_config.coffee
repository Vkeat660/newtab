@AdminConfig =
	name: Config.name
	collections:
		Posts:
			color: 'red'
			icon: 'pencil'
			extraFields: ['owner']
			tableColumns: [
				{ label: 'Title', name: 'title' }
				{ label: 'User', name: 'author()', template: 'adminUserCell' }
			]
	dashboard:
		homeUrl: '/dashboard'
	autoForm:
		omitFields: ['createdAt', 'updatedAt']

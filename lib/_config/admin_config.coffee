@AdminConfig =
	name: Config.name
	collections:
		Posts:
			color: 'red'
			icon: 'pencil'
			extraFields: ['owner']
			tableColumns: [
				{ label: 'Header', name: 'header' }
        { label: 'Footer Line 1', name: 'footerLine1' }
        { label: 'Footer Line 2', name: 'footerLine2' }
				{ label: 'User', name: 'author()', template: 'adminUserCell' }
			]
	dashboard:
		homeUrl: '/dashboard'
	autoForm:
		omitFields: ['createdAt', 'updatedAt']

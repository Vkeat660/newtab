Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'attachments'
      ]
    data: ->
      query = Posts.find({}).fetch()
      randomIndex = Math.floor( Math.random() * query.length );
      posts: [query[randomIndex]]

   
  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'comments'
        subs.subscribe 'attachments'
      ]
    data: ->
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()




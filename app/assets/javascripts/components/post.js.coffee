@PostRow = createReactClass(
  componentDidMount: ->
    console.log 'Component mounted'

  getInitialState: ->
    post = @props.post
    return item:
      id: post.id
      title: post.title
      body: post.body

  updateClick: (id) ->
    _this = this
    $.ajax
      url: 'posts/' + id + '.json'
      type: 'GET'
      success: (item) ->
        _this.setState item: item
        console.log 'it worked!', item
        return
    return

  render: ->
    post = @state.item
    React.createElement('tr', null, 
      React.createElement('td', null, post.title), 
      React.createElement('td', null, post.body), 
      React.createElement('td', null, 
        React.createElement('button', { onClick: @updateClick.bind(this, post.id) }, 'Update coffee')
      )
      React.createElement('td', null, 
        React.createElement('a', { href: Routes.post_path(post.id) }, 'Show')
      )
    )
)


@Posts = createReactClass(
  getInitialState: ->
    { items: [] }

  render: ->
    React.createElement('table', null, 

      React.createElement('thead', null, 
        React.createElement('tr', null, 
          React.createElement('th', null, 'Title'), 
          React.createElement('th', null, 'Body'), 
          React.createElement('th', { colSpan: '3' })
          )
        ), 

      React.createElement('tbody', null,
        @props.posts.map (post, index) ->
          React.createElement(PostRow, { key: index, post: post })
        )
      )
)
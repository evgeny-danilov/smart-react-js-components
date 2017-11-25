window.PostRow = createReactClass({
  componentDidMount() {
    console.log('Component mounted');
  },

  getInitialState() {
    console.log('Component Init State');
    return { item: {
      id: this.props.post.id,
      title: this.props.post.title,
      body: this.props.post.body
    } }
  }, 

  updateClick(id) {
    $.ajax({
      url: "posts/" + id + ".json",
      type: 'GET',
      success: (item) => {
        this.setState({ item: item })
        console.log('it worked!', item);
      }
    });
  },

  render: function() {
    var item = this.state.item
    return (
      <tr>
        <td>{item.title}</td>
        <td>{item.body}</td>
        <td>
          <button onClick={this.updateClick.bind(this, item.id)}>
            Update
          </button>
        </td>
      </tr>
    )
  }
});

window.Posts = createReactClass({
  getInitialState() {
    return { items: [] }
  }, 

  render: function () {
    return (
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Body</th>
          <th colSpan="3"></th>
        </tr>
      </thead>
      <tbody>
        {this.props.posts.map((post, index) => 
          <PostRow key={index} post={post}/>
        )}
      </tbody>
    </table>
    )
  }
});
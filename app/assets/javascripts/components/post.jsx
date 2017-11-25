window.Post = createReactClass({
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
        <button onClick={this.updateClick.bind(this, item.id)}>
          Update
        </button>
      </tr>
    )
  }
})

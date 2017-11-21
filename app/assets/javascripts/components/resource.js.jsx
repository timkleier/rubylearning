var Resource = createReactClass({
  propTypes: {
    title: PropTypes.string,
    description: PropTypes.string,
    host: PropTypes.string,
    url: PropTypes.string,
    imageUrl: PropTypes.string
  },

  render: function() {
    return (
      <div class="content">
        <img class="right floated mini ui image" src={this.props.image_url} />
        <div class="header"><a href={this.props.url} target="_blank">{this.props.title}</a></div>
        <div class="description">{this.props.description}</div>
      </div>
    );
  }
});
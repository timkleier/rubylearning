var Resource = createReactClass({
  propTypes: {
    title: PropTypes.string,
    description: PropTypes.string,
    host: PropTypes.string,
    url: PropTypes.string,
    imageUrl: PropTypes.string,
    experienceLevel: PropTypes.string
  },

  render: function() {
    return (
      <div class="content">
        <img class="right floated mini ui image" src={this.props.image_url} />
        <div class="header"><a href={this.props.url} target="_blank">{this.props.title}</a></div>
        <div class="description">{this.props.description}</div>
        <div class="extra content">
          <span class="right floated">
            <i class="large icons experience_level_indicator">
              <i class="signal icon"></i>
              <i class={'bottom left corner signal icon ' + this.props.experience_level + '_level'}></i>
            </i>
          </span>
        </div>
      </div>
    );
  }
});
var Resource = createReactClass({
  render: function() {
    return (
      <span>
        <div class="content">
          <img class="right floated mini ui image" src={this.props.image_url} />
          <div class="header"><a href={this.props.url} target="_blank">{this.props.title_truncated}</a></div>
          <div class="description">{this.props.description_truncated}</div>
        </div>
        <div class="extra content">
          <span>
            <i class="user icon"></i>
            75 Friends
          </span>
          <span class="right floated">
            <i class="large icons experience_level_indicator">
              <i class="signal icon"></i>
              <i class={'bottom left corner signal icon ' + this.props.experience_level + '_level'}></i>
            </i>
          </span>
        </div>
      </span>
    );
  }
});
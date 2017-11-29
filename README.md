# RubyRailway
Resources and skill development paths for Ruby on Rails developers.

## Setup
You'll need to run the following to get the environment setup:
```
bundle install
rake db:migrate
rake db:seed
```
Then start the server...

### Development Tools
* Rails 5 (w/ ActionCable)
* SQLite (for now)
* [Semantic UI](https://semantic-ui.com/)
* ReactJS
* [MetaInspector](https://github.com/jaimeiniesta/metainspector)

## Usage

### Resource scraping
To grab a resource off the web, simply instantiate a new `Resource` and pass it the url
```
Resource.scrape('http://example.com')
```
It uses MetaInspector to scrape the url and create a new record with all the relevant metadata. Too easy.

### TODO
Get in the [React mindset](https://reactjs.org/docs/thinking-in-react.html) and implement [CRUD React functions](https://github.com/applegrain/creact)


## Project Vision
See the [Google Doc](https://docs.google.com/document/d/1kI4BAxBh_UVWNdYOBGdWOmAWaWUaaEGDxlOt6opz640/edit?usp=sharing)

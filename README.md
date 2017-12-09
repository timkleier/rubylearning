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

### Testing Philosophy
Use the minimalist testing philosophy outlined by Sandi Metz in her [2013 Rails Conf talk](https://www.youtube.com/watch?v=URSWYvyc42M&t=1666s):
* Incoming Query Messages: Assert Result
* Incoming Command Messages: Assert Direct Public Side Effects
* Messages Sent to Self, Outgoing Query Messages: Don't Test
* Outgoing Command Messages: Expect to Send

This testing philosophy preserves responsibility of objects and avoids duplication and (sigh) bloated test suites

### TODO
See Issues


## Project Vision
See the [Google Doc](https://docs.google.com/document/d/1kI4BAxBh_UVWNdYOBGdWOmAWaWUaaEGDxlOt6opz640/edit?usp=sharing)

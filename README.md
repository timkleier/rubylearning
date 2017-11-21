<<<<<<< HEAD
# rubylearning
Learning resources app for Ruby on Rails developer
=======
# Sophia App (name to be refined)
>>>>>>> 6b54d85... another README merge

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

### Description
This app aims to integrate only the best resources for Ruby on Rails development (Phase 1), develop a social platform around it (Phase 2), 
then expand to software development in general (Phase 3), and then extend into all aspects of learning/development in life (Phase 3). 
This is accomplished by cultivating a reputation-based social network in which users suggest and vote for their favorite resources, their reputation in the community adding more weight
to their opinion regarding the quality of the resource. Other social platforms give free reign and equal weight to posts on everything from questions and answers
to cat pictures--our solution largely focuses on posting resources, gathered by both learners and content creators and appropriately categorized
and targeted according, in order to provide the most robust and respected repository of learning resources for any and every field. 

### Phase 1
The initial phase involves the gathering of Ruby on Rails resources. The goal is to have established a solid web presence 
of the best current Ruby on Rails resources. 

Key features include:
* Slick, professional look and feel and intuitive interface/navigation
* A quick-post capability that allows admins to paste a link for a resource and its metadata is automatically filled in (via MetaInspector)
* Ability to categorize those resources (beginner/intermediate/advanced/varied)

Potential strategies/features:
* Find partner(s) to help us develop a top-notch offering

Challenges/Questions
* On Rubymonk.com, for example, the Ruby Primer returns same metadata as home page (i.e. not able to delineate skill levels)

### Phase 2
In this phase we invite committed Ruby community members to vote on the resources in the repository.
We then aim to generate enough momentum with RoR community members engagement to the keep the repository updated frequently.

Key features include:
* Seamless login (Auth0? Github?)
* Ability to upvote/downvote resources

Potential features/strategies:
* Invite key creators to customize their resources
* Resource (link/metadata) validity verification

Challenges/Questions
* Connecting resources to their creators
<<<<<<< HEAD
* Address likehood of bots trying to enter/post
=======
* Address likehood of bots trying to enter/post
>>>>>>> 6b54d85... another README merge

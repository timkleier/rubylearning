# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@ourapp.com', admin: true)

Resource.scrape("http://www.railscasts.com", { skill_level: "intermediate", ruby_or_rails: "rails" })
Resource.scrape('http://gorails.com', { skill_level: "intermediate", ruby_or_rails: "rails" })
Resource.scrape('http://guides.rubyonrails.org/', { skill_level: "intermediate", ruby_or_rails: "rails" })
Resource.scrape('http://codeschool.com', { skill_level: "varied", ruby_or_rails: "both" })
Resource.scrape('http://railstutorial.org/book', { skill_level: "beginner", ruby_or_rails: "rails" })
Resource.scrape('http://rubyweekly.com', { skill_level: "advanced", ruby_or_rails: "ruby" })

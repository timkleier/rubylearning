require 'uri'

class Resource < ApplicationRecord
  attr_accessor :title_truncated, :description_truncated
  
  validates :url, presence: true, uniqueness: true, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/ }
  
  # https://richonrails.com/articles/active-record-enums-in-ruby-on-rails-4-1
  enum experience_level: { beginner: 1, advanced_beginner: 2, competent: 3, proficient: 4, expert: 5 }
  # enum source_type: { website: 1, blog: 2 }
  # enum format_type: { text: 1, video: 2, audio: 3 }
  # enum length: {}
  
  def self.scrape(url)
    begin
      page = MetaInspector.new(url)
    rescue MetaInspector::TimeoutError
      enqueue_for_future_fetch_attempt(url)
    rescue MetaInspector::RequestError, MetaInspector::ParserError
      "There was an error in the request--please check the url"
    else
      resource = Resource.new
      ['title', 'description', 'url'].each do |attribute|
        resource.send("#{attribute}=", page.send(attribute))
      end
      resource.image_url = page.images.best
      resource.save
      resource
    end
  end
  
  # TODO: right tests for this after_find method as well as attributes below
  after_find do |resource|
    self.title_truncated = self.title.truncate(60) if title
    self.description_truncated = self.description.truncate(200) if description
  end
  
  def attributes
    super.merge('title_truncated' => self.title_truncated, 'description_truncated' => self.description_truncated)
  end
  
end

class Resource < ApplicationRecord
  attr_accessor :title_truncated, :description_truncated
  
  validates :url, presence: true, uniqueness: true, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/ }
  
  enum skill_level: { varied: 0, beginner: 1, intermediate: 2, advanced: 3 }
  enum ruby_or_rails: { both: 0, ruby: 1, rails: 2 }
  # enum source_type: { website: 1, blog: 2 }
  # enum format_type: { text: 1, video: 2, audio: 3 }
  # enum length: {}
  
  def self.scrape(url, attributes = {})
    begin
      scraped_url = MetaInspector.new(url)
    rescue MetaInspector::TimeoutError
      enqueue_for_future_fetch_attempt(scraped_url)
    rescue MetaInspector::RequestError, MetaInspector::ParserError
      "There was an error in the request--please check the url"
    else
      self.create_from_url(scraped_url, attributes)
    end
  end
  
  def self.create_from_url(scraped_url, attributes = {})
    begin
      resource = Resource.new
      
      ['title', 'description', 'url'].each do |scraped_attribute|
        resource.send("#{scraped_attribute}=", scraped_url.send(scraped_attribute))
      end
      resource.image_url = scraped_url.images.best
      
      attributes.keys.each do |key|
        resource.send("#{key}=", attributes[key])
      end
      
      resource.save!
    rescue StandardError => e
      e.message
    else
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

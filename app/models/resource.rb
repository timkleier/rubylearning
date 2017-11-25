class Resource < ApplicationRecord
  validates_uniqueness_of :url
  
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
end

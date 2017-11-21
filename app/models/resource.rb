class Resource < ApplicationRecord
  validates_uniqueness_of :title
  
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

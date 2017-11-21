require 'rails_helper'
#<Resource title: nil, description: nil, url: nil, root_url: nil, host: nil, image_url: nil>
RSpec.describe Resource, type: :model do
  #TODO build out tests for scraping a URL -Zach
  it "scrapes provided URL" do
    resource = Resource.create(url: 'https://www.google.com')
    resource = Resource.scrape(resource.url)

    expect(resource.title).to eq("Google")
    expect((resource.image_url.present? and resource.description.present?)).to eq(true)
  end

  it "creates a new resource based on provided info" do
    resource = Resource.create(
      title: 'Real Fake Doors',
      description: 'Tired of doors leading to places? Come on down for some real fake doors!',
      root_url: 'https://www.youtube.com/watch?v=pxbsV8QWGic',
      image_url: 'https://i.ytimg.com/vi/pxbsV8QWGic/hqdefault.jpg'
     )

     expect(resource.valid?).to eq(true)
  end
end

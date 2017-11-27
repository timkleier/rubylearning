require 'rails_helper'
#<Resource title: nil, description: nil, url: nil, root_url: nil, host: nil, image_url: nil>
RSpec.describe Resource, type: :model do
  # Validation tests
  it { should validate_uniqueness_of(:url) }

  it "scrapes provided URL" do
    resource = Resource.create(url: 'https://www.google.com')
    resource = Resource.scrape(resource.url)

    expect(resource.title).to eq("Google")
    expect((resource.image_url.present? and resource.description.present?)).to eq(true)
  end

  # No longer exposing resource/new to users, obsolete for now
  it "creates a new resource based on provided info" do
    resource = Resource.create(
      title: 'Real Fake Doors',
      description: 'Tired of doors leading to places? Come on down for some real fake doors!',
      root_url: 'https://www.youtube.com/watch?v=pxbsV8QWGic',
      image_url: 'https://i.ytimg.com/vi/pxbsV8QWGic/hqdefault.jpg',
      url: 'https://www.youtube.com/watch?v=pxbsV8QWGic'
     )

     expect(resource.valid?).to eq(true)
  end
end

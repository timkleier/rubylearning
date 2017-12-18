require 'rails_helper'
#<Resource title: nil, description: nil, url: nil, root_url: nil, host: nil, image_url: nil>
RSpec.describe Resource, type: :model do

  describe 'scrapes provided URL' do
    resource = Resource.scrape('https://www.google.com', true)
    
    it "when building a resource, returns title and custom description" do
      expect(resource.title).to eq("Google")
    end
    it 'returns an error if an invalid URL' do
      expect(Resource.scrape('https://www.google.c')).to eq('There was an error in the request--please check the url')
    end
  end
  
  describe 'builds record from scraped URL' do
    scraped_url = Resource.scrape('https://www.google.com')
    resource = Resource.build_from_scraped_url(scraped_url, { description: "Custom Description" })
    
    it 'returns a custom description' do
      expect(resource.description).to eq('Custom Description')
    end
    it 'returns a NoMethodError' do
      expect{Resource.build_from_url('https://www.google.c')}.to raise_error(NoMethodError)
    end
  end

end

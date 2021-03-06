require 'rails_helper'

RSpec.describe 'Resources API', type: :request do
  # initialize test data
  let!(:resources) { create_list(:resource, 10) }
  let(:resource_id) { resources.first.id }

  # Test suite for GET api/v1/resources
  describe 'GET /api/v1/resources' do
    # make HTTP get request before each example
    before { get '/api/v1/resources' }

    it 'returns resources' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET api/v1/resources/:id
  describe 'GET /api/v1/resources/:id' do
    before { get "/api/v1/resources/#{resource_id}" }
    context 'when the record exists' do
      it 'returns the resource' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(resource_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:resource_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Resource/)
      end
    end
  end

  # Test suite for POST api/v1/resources
  describe 'POST /api/v1/resources' do
    # valid payload
    let(:valid_attributes) { { url: 'http://www.google.com' } }

    context 'when the request is valid' do
      before { post '/api/v1/resources', params: valid_attributes }

      it 'creates a resource' do
        expect(json['url']).to eq('http://www.google.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/resources', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Url can't be blank/)
      end
    end
  end

  # Test suite for POST api/v1/resources/scrape
  describe 'POST /api/v1/resources/scrape' do
    # valid payload
    let(:valid_attributes) { { url: 'http://www.google.com' } }

    context 'when the request is valid' do
      before { post '/api/v1/resources/scrape', params: valid_attributes }

      it 'scrapes a resource' do
        expect(json['url']).to eq('http://www.google.com/')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/resources', params: { url: 'Testy' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Url is invalid/)
      end
    end
  end

  # Test suite for PUT api/v1/resources/:id
  describe 'PUT /api/v1/resources/:id' do
    let(:valid_attributes) { { url: 'http://www.google.com' } }

    context 'when the record exists' do
      before { put "/api/v1/resources/#{resource_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE api/v1/resources/:id
  describe 'DELETE /api/v1/resources/:id' do
    before { delete "/api/v1/resources/#{resource_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

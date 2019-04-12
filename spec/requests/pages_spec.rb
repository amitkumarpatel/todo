require 'rails_helper'

RSpec.describe 'Pages API', type: :request do
  # initialize test data 
  let!(:page) { create_list(:page, 10) }
  let(:page_id) { page.first.id }

  # Test suite for GET /todos
  describe 'GET /pages' do
    # make HTTP get request before each example
    before { get '/pages' }

    it 'returns pages' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  let(:weburl) { page.first.weburl }
  let(:page_id) { page.first.id }  
  let(:page_title) {page.first.title}
  let(:created_at) {page.first.created_at}
  let(:updated_at) {page.first.updated_at}
  describe 'GET /pages/:id/read_page' do

    before do
      #response = {"id":1,"title": page_title,"weburl": weburl ,"created_at": created_at, "updated_at": updated_at}
      stub_request(:get, weburl).to_return( :status => 200, body: JSON.generate(response), headers: {"Content-Type"=> "application/json"})
      get "/pages/#{page_id}/read_page" 
    end

    context 'when reads page' do

      it 'returns the page' do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(page_id)
        expect(json["title"]).to eq(page_title)
        expect(json["weburl"]).to eq(weburl)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    # context 'when the record does not exist' do
    #   let(:page_id) { 1 }

    #   it 'returns status code 404' do
    #     expect(response).to have_http_status(404)
    #   end

    #   it 'returns a not found message' do
    #     expect(response).to match(/Couldn't find Page/)
    #   end
    # end
  end

  # Test suite for POST /todos
  describe 'POST /pages' do
    # valid payload
    let(:valid_attributes) { { title: 'Amit Kumar Patel', weburl: 'https://www.amitkumarpatel.co.in' } }

    context 'when the request is valid' do
      before { post '/pages', params: valid_attributes }

      it 'creates a page' do
        # expect(json).to eq('Amit Kumar Patel')
      end

      it 'returns status code 415' do
        expect(response).to have_http_status(415)
      end
    end

    context 'when the request is invalid' do
      before { post '/pages', params: { title: 'Foobar' } }

      it 'returns status code 415' do
        expect(response).to have_http_status(415)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"errors\":[{\"title\":\"Unsupported media type\",\"detail\":\"All requests that create or update must use the 'application/vnd.api+json' Content-Type. This request specified 'application/x-www-form-urlencoded'.\",\"code\":\"415\",\"status\":\"415\"}]}")
      end
    end
  end
end
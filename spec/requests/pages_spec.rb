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
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /pages/:id/read_page' do
    before { get "/pages/#{page_id}/read_page" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(page_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:page_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /pages' do
    # valid payload
    let(:valid_attributes) { { title: 'Amit Kumar Patel', weburl: 'https://www.amitkumarpatel.co.in' } }

    context 'when the request is valid' do
      before { post '/pages', params: valid_attributes }

      it 'creates a todo' do
        expect(json['title']).to eq('Amit Kumar Patel')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/pages', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: weburl by can't be blank/)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Api::V1::ContentsController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }

  describe 'GET /contents.json' do
    before do
      Content.create(url: 'test.com')
      get :index, format: :json
    end

    it 'return 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the contents' do
      expect(json['contents']).not_to be_empty
    end
  end

  describe 'POST /contents.json' do
    before do
      post :create, format: :json, :content => {url: 'http://www.google.com'}
    end

    it 'creates a new content' do
      expect(Content.last.url).to eq('http://www.google.com')
    end

  end

end

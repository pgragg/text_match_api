require 'spec_helper'
RSpec.describe ApiController, type: :controller do
require 'rspec/core/rake_task'

  describe 'GET #load_data' do

    it 'returns http success' do
      response = get '/api/v1/load_data'
      expect(response.status).to eq(200)
    end

  end
end

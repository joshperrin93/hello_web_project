require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do

    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET to /names' do
        it'returns 200 with right content' do
            response = get("/names?names=Julia, Mary, Karim")
            expect(response.status).to eq(200)
        end

        it 'returns the list of names provided' do
            response = get("/names?names=Julia, Mary, Karim")
            expect(response.body).to eq 'Julia, Mary, Karim'
        end
    end
end

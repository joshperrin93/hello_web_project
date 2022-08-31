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

    context 'GET to /' do
        it 'returns welcome to my page' do
            response = get('/')
            expect(response.body).to include ('<h1>Welcome to my page</h1>')
        end

        it 'contains a div' do
            response = get('/')
            expect(response.body).to include ('<div>')
        end
    end

    context 'GET to /hello' do
        it 'says Hello!' do
            response = get('/hello?names=Josh')
            expect(response.body).to include ('<h1>Hello, Josh!</h1>')
        end
    end
end

require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

    configure :development do
        register Sinatra::Reloader
    end

    get '/' do
        return erb(:index)
    end

    get '/hello' do
        @names = params[:names]
        return erb(:index_hello)
    end

    post '/submit' do
        name = params[:name]
        message = params[:message]
        return "Thanks #{name}, you sent this message: #{message}"
    end

    get '/names' do
        names = params[:names]
        return "#{names}"
    end

end
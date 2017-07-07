require 'sinatra'
#require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "./contact.db"
)

class Contact < ActiveRecord::Base
end

before do
    @title = 'Hisahiro Tsukamoto Portfolio'
end
after do
end
helpers do
end

get '/' do
    erb :index
end

get '/products' do
    @products = Products.all
    erb :index
end

post '/new' do
    Contact.create({title: params[:title], url: params[:url]})
    redirect '/'
end

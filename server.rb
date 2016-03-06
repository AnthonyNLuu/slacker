require "sinatra"
require 'csv'
require 'uri'
require 'net/http'

get '/' do
  @articles = File.readlines('./views/articles.csv')
  erb :index
end

post '/articles' do
  article = params['title']
  url = params['article_url']
  description = params['description']

  File.open('./views/articles.csv', 'a') do |file|
    file.puts("\"#{article}\",\"#{url}\",\"#{description}\"")
  end

  redirect '/'
end

get '/articles/new' do
  erb :post_form
end

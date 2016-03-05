require "sinatra"


get '/' do
  @articles = File.readlines('./views/articles.csv')
  erb :index
end

post '/articles' do
  article = params['article']

  File.open('./views/articles.csv', 'a') do |file|
    file.puts(article)
  end

  redirect '/'
end

get '/articles/new' do
  erb :post_form
end

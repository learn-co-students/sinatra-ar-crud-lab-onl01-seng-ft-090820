
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new 
  end 

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do 
    @a = Article.create(params)
    redirect  "/articles/#{@a.id}"
    erb :show
  end 

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    # binding.pry
    @b = Article.find(params[:id])
    @b.update(title: params[:title], content: params[:content])
    redirect  "/articles/#{@b.id}"
    erb :show
  end

  delete '/articles/:id' do
    # binding.pry
    @article = Article.find(params[:id])
    @article.delete
    redirect "/articles"
    erb :index
  end 

end

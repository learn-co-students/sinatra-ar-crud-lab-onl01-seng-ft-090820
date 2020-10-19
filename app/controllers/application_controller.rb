
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
    @articles_show = Article.create(params)
    redirect "/articles/#{@articles_show.id}"
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
    @article_patch = Article.find(params[:id])
    @article_patch.update(title: params[:title], content: params[:content])
  
    redirect "/articles/#{@article_patch.id}"
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    
    redirect "/articles"
    erb :index
  end


end


require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    new_article = Article.create(title: params[:title], content: params[:content])
    # binding.pry
    if new_article
      redirect to "/articles/#{new_article.id}"
    end
  end

  get '/articles' do
    @articles = Article.all
    erb :index
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

    @article = Article.find(params[:id])
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    @article 
    redirect to "/articles/#{params[:id]}"

  end

  delete '/articles/:id' do
    dead_article = Article.find(params[:id])
    dead_article.destroy
  end

end

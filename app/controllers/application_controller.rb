
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #READ
  get '/articles' do 
    @articles = Article.all
    erb :index
  end

    #CREATE
    get '/articles/new' do 
      erb :new
    end 

  #READ
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 

  #CREATE
  post '/articles' do 
    @articles_show = Article.create(params)
    redirect to "/articles/#{@articles_show.id}"
  end 

end

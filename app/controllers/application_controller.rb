
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do 
    @articles = Article.all
    erb :index
  end 

  get '/articles/:id' do 
    @articles = Article.create(id: params[:id])
    erb :show
  end 



  get '/articles/new' do 

    erb :new
  end 

  post '/articles' do 
    @articles_show = Article.create(params)
    redirect "/arcitles/#{@articles_show.id}"
    erb :show
  end 

end

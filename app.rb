require 'sinatra'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :name_form
  end

  post '/names' do
  	session[:p1], session[:p2] = params[:p1], params[:p2]
  	redirect '/battle'
  end

  get '/battle' do
	@p1 = session[:p1]
	@p2 = session[:p2]
  	erb :battle
  end
  
run!  if app_file == $0
end

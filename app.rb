require 'sinatra'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :name_form
  end

  post '/names' do
  	$player1, $player2 = Player.new(params[:p1]), Player.new(params[:p2])
  	redirect '/battle'
  end

  get '/battle' do
	@p1 = $player1.name
	@p2 = $player2.name
	@attack = params[:attack]
	$player2.hurt(10) if @attack
	@p2health = $player2.health
  	erb :battle
  end
  
run!  if app_file == $0
end

require 'sinatra'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions


  get '/' do
    erb :name_form
  end

  post '/names' do
  	$game = Game.new(params[:p1], params[:p2])
  	redirect '/battle'
  end

  get '/battle' do
	@p1_name = $game.player1.name
	@p2_name = $game.player2.name
	@attack = params[:attack]
 	#$game.attack($game.player1, $game.player2) if @attack
 	$game.p1_attack if @attack
	@p2health = $game.player2.health
  	erb :battle
  end

run!  if app_file == $0
end

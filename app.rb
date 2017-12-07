require 'sinatra'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions


  get '/' do
    $game = Game.new
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
  $game.attack($player1, $player2) if @attack
	# $player1.attack($player2) if @attack
	@p2health = $player2.health
  	erb :battle
  end

run!  if app_file == $0
end

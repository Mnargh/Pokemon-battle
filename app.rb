require 'sinatra'

class Battle < Sinatra::Base
  get '/' do
    "Test Infrastructure Working!!!"
  end
  

  run! if app_file == $0
end

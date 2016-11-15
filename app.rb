require 'sinatra'
require 'rubygems'
require_relative 'board.rb'
# require_relative 'console_game.rb'
require_relative 'console_human.rb'
require_relative 'console_random_ai.rb'
require_relative 'console_sequential_ai.rb'
require_relative 'unbeatable_ai.rb'

enable :sessions

ai = ""

get '/' do
    session[:board] = Board.new
    erb :home
end

post '/home' do
    name = params[:input_name]
end

get '/rules' do
    erb :rules
end

get '/history' do
    erb :history
end

get '/play_game' do
    erb :play_game, :locals => {:board => session[:board].grid}
end
require 'sinatra'
require 'rubygems'
require_relative 'new_board.rb'
require_relative 'human.rb'
require_relative 'console_random_ai.rb'
require_relative 'console_sequential_ai.rb'
require_relative 'unbeatable_ai.rb'

enable :sessions

ai = ""

get '/' do
    # @title = "Susan Magic Tic Tac Toe"
    session[:board] = Board.new(["","","","","","","","",""])
    erb :home, :layout => :home_layout, :locals => { :board => session[:board].grid }
end

get '/rules' do
    erb :rules
end

get '/player_1_name' do
    erb :player_1_name, :layout => :home_layout, :locals => { :board => session[:board].grid }
end

post '/player_1_name' do
    session[:player_1_name] = params[:player_1_name]
    erb :opponent, :layout => :home_layout, :locals => { :board => session[:board].grid }
    # redirect '/choose_opponent'
end

get '/player_2_name' do
    erb :player_2_name, :layout => :home_layout, :locals => { :board => session[:board].grid }
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
    redirect '/play_game'
end

post '/choose_opponent' do
	player_2 = params[:player_2]

	if player_2 == "human"
		session[:player_2] = Console_human.new("O")

		erb :player_2_name, :layout => :home_layout, :locals => { :board => session[:board].grid }
        redirect 'play_game'

	elsif player_2 == "sequential_ai"
		session[:player_2] = SequentialAI.new("O")
		session[:player_2_name] = "Easy Opponent"

		redirect '/play_game'

	elsif player_2 == "random_ai"
		session[:player_2] = RandomAI.new("O")
		session[:player_2_name] = "Medium Opponent"

		redirect '/play_game'

	else player_2 == "unbeatable_ai"
		session[:player_2] = UnbeatableAI.new("O")
		session[:player_2_name] = "Hard Opponent"

		redirect '/play_game'
	end
end

get '/play_game' do
    session[:player_1_name] = params[:player_1]
    session[:player_1] = Console_human.new("X")
    session[:current_player] = session[:player_1]
    session[:current_player_name] = session[:player_1_name]
    erb :play_game, :layout => :home_layout, :locals => { :board => session[:board].grid, :current_player_name => session[:current_player_name], :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
    #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  

    redirect '/get_move'
end

get '/get_move' do
	move = session[:current_player].get_move(session[:board].grid)
    
	if move == "NO"
        erb :get_move, :layout => :home_layout, :locals => { :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name], :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].grid }
        
    elsif session[:board].valid_input?(move)
            redirect '/make_move?move=' + move.to_s 
        else
        	# redirect '/get_move'
	end
end

get '/get_player_move' do
    move = params[:square].to_i

    if session[:board].valid_input?(move)
        redirect '/make_move?move=' + move.to_s
    else
        redirect '/get_move'
    end
end

get '/make_move' do
	move_spot = params[:move].to_i

	session[:board].update((move_spot - 1), session[:current_player].marker)

	if session[:board].winner?(session[:current_player].marker) == true
		player_1 = session[:player_1_name]
		player_2 = session[:player_2_name]
		winner = session[:current_player_name]

		erb :win, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].grid }
	elsif session[:board].full_board? == true
		player_1 = session[:player_1_name]
		player_2 = session[:player_2_name]
		winner = "Tie"

		erb :tie, :locals => { :board => session[:board].grid }
	else
		if session[:current_player].marker == "X"
			session[:current_player] = session[:player_2]
			session[:current_player_name] = session[:player_1_name]
		else
			session[:current_player] = session[:player_2]
			session[:current_player_name] = session[:player_2_name]
		end

		redirect '/get_move'
	end	
end

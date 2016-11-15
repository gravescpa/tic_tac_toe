require 'sinatra'
require 'rubygems'
require_relative 'board.rb'
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

get '/rules' do
    erb :rules
end

get '/history' do
    erb :history
end

get '/player_1_name' do
    erb :player_1_name
end

post '/player_1_name' do
    session[:player_1_name] = params[:player_1_name]
    redirect '/player_2_name'
end

get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
    redirect '/play_game'
end

get '/play_game' do
    session[:player_1_name] = params[:player_1]
    session[:p1] = Console_human.new("X")
    session[:current_player] = session[:p1]
    session[:current_player_name] = session[:player_1_name]
    erb :play_game, :locals => {:board => session[:board].grid}
    #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
end

get '/get_move' do
	move = session[:current_player]
    # .get_move(session[:board].grid)

	# if move == "NO"
	erb :get_move, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].grid }
	# elsif session[:board].valid_space?(move)
	# 	redirect '/make_move?move=' + move.to_s 
	# else
	# 	redirect '/get_move'
	# end
end

get '/get_player_move' do
    move = params[:square].to_i

    if session[:board].valid_space?(move)
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
			session[:current_player] = session[:p2]
			session[:current_player_name] = session[:player_1_name]
		else
			session[:current_player] = session[:p1]
			session[:current_player_name] = session[:player_2_name]
		end

		redirect '/get_move'
	end	
end



# post '/choose_opponent' do
# 	player_2 = params[:player_2]

# 	if player_2 == "human"
# 		session[:p2] = Console_human.new("O")

# 		erb :opponent_name, :layout => :home_static_layout, :locals => { :board => session[:board].board_positions }

# 	elsif player_2 == "sequential_ai"
# 		session[:p2] = SequentialAI.new("O")
# 		session[:name_player_2] = "Computer"

# 		redirect '/get_move'

# 	elsif player_2 == "random_ai"
# 		session[:p2] = RandomAI.new("O")
# 		session[:name_player_2] = "Computer"

# 		redirect '/get_move'

# 	else player_2 == "unbeatable_ai"
# 		session[:p2] = UnbeatableAI.new("O")
# 		session[:name_player_2] = "Computer"

# 		redirect '/get_move'
# 	end
# end

# get '/get_move' do
# 	move = session[:current_player].get_move(session[:board].grid)

# 	if move == "NO"
# 		erb :get_move, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].board_positions }
# 	elsif session[:board].valid_space?(move)
# 		redirect '/make_move?move=' + move.to_s 
# 	else
# 		# Does line 101 ever happen?
# 		redirect '/get_move'
# 	end
# end
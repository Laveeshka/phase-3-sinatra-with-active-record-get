class ApplicationController < Sinatra::Base

  # add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end
  
  get '/games' do
    # get all the games from the database
    games = Game.all
    # return a JSON response with an array of all the game data
    games.to_json
  end

  # add a dynamic route to handle dynamic requests
  # use the :id syntax to create a dynamic route
  get '/games/:id' do
    game = Game.find(params[:id]) #looks up the game in the database using the value of id in the params hash
    game.to_json(include: :reviews) #sends a JSON formatted response of the game data, we pass the include: option to include data about associated models in our JSON
  end

end

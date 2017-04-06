require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/session'

configure do
  enable :sessions
  # set :session_secret, "whaaa?"
end

get '/' do
  # guess = nil
  # case guess
  #   when nil
  erb :start
      # select a random number to start with
      # show the 'start view'
    #   p rand(100)
    # when correct
    #   stop all
    # when higher
    #   output same number + 50%
    # when lower
    #   output same number - 50%
  # end
end
get '/correct_guess' do
  erb :correct_guess
end


post '/too_high' do
  session[:highs] << session[:guess]
  session[:guess] = (session[:guess] - session[:lows].max)/2 + session[:lows].max
  # session[:guess] = session[:guess]/2
  redirect to('/guess')
end

post '/too_low' do
  session[:lows] << session[:guess]
  session[:guess] = (session[:highs].min - session[:guess])/2 + session[:guess]
  # session[:guess] = ((100 - session[:guess])/2)+session[:guess]
  redirect to('/guess')
end

get '/guess' do
  erb :guess #, :locals
end

post '/new' do
  session[:highs] = [100]
  session[:lows] = [0]
  session[:guess] = rand(100)
  redirect to('/guess')
end
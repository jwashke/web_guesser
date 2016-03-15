require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  "The secret number is #{SECRET_NUMBER}"
end

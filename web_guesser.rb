require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message, color = check_guess(guess)
  message = cheat_mode(message) if cheat
  erb :index, :locals => { :message => message, :color => color }

end

def check_guess(guess)
  guess = guess.to_i
  return "Please guess a number" unless guess
  if guess > SECRET_NUMBER + 5
    ["Your guess of #{guess} is way too high!", "red"]
  elsif guess > SECRET_NUMBER
    ["Your guess of #{guess} is too high!", "salmon"]
  elsif guess < SECRET_NUMBER - 5
    ["Your guess of #{guess} is way too low!", "red"]
  elsif guess < SECRET_NUMBER
    ["Your guess of #{guess} is too low!", "salmon"]
  else
    ["You got it right! The secret number is #{SECRET_NUMBER}", "green"]
  end
end

def cheat_mode(message)
  "#{message} The Secret Number is #{SECRET_NUMBER}"
end

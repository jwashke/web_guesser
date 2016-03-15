require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => { :message => message }

end

def check_guess(guess)
  guess = guess.to_i
  return "Please guess a number" unless guess
  if guess > SECRET_NUMBER + 5
    "Your guess of #{guess} is way too high!"
  elsif guess > SECRET_NUMBER
    "Your guess of #{guess} is too high!"
  elsif guess < SECRET_NUMBER - 5
    "Your guess of #{guess} is way too low!"
  elsif guess < SECRET_NUMBER
    "Your guess of #{guess} is too low!"
  else
    "You got it right! The secret number is #{SECRET_NUMBER}"
  end
end

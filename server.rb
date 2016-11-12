# server.rb
require "sinatra"
require "sinatra/reloader"
require_relative "./lib/calculator"

enable (:session)
get '/' do
  erb(:calculator)
end


get "/add" do
  erb(:add)
end

post "/calculate" do
  calculator=Calculator.new
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation =  params[:operation]
  case operation
  	when "addition"
  		result=calculator.add first, second
  		"The addition of #{first} and #{second} is #{result}"
  	when "substract"
  		result=calculator.substract first, second
  		"The substract of #{first} and #{second} is #{result}"
  	when "multiply"
  		result=calculator.multiply first, second
  		"The multiply of #{first} and #{second} is #{result}"
  	when "divide"
  		result=calculator.divide first, second
  		"The divide of #{first} and #{second} is #{result}"
  end

  #result = Calculator.new.add first, second
  
end
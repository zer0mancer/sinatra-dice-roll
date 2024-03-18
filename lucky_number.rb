require 'sinatra'
require 'puma'
require 'sinatra/reloader'
require 'better_errors'
require 'binding_of_caller'

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/saibadee") do
  return "Sai Bai Dee!"
end

#works even with the space but probably best practice not to use it. 
get("/") do
  return "Route Directory"
end

get('/zebra') do
  "We must add a route for each path we want to support"
end

get('/restart') do
  "No more shutting down the server!!!!"
end


get("/lucky_number/2/6") do
  num1 = rand(0...10)
  num2 = rand(0...19)
  sum = num1 + num2 

  consequence = "You rolled a #{num1} and a #{num2} for a total of #{sum}."

  "
    <h1>2 Dices</h1>
    <p>#{consequence}</p>
  "
end

get("/lucky_number/2/10") do
  dice_1 = rand(1...10)
  dice_2 = rand(1...10)
  total = dice_1 + dice_2
  final = "You rolled a #{dice_1} and a #{dice_2} on the 10-sided die. Your total is #{total}"

  "
  <h1>2 Ten-sided Dies</h1>
  <p>#{final}</p>
  "
end

get('/dices/5/4') do
  first_die = rand(1...4)
  second_die = rand(1...4)
  third_die = rand(1...4)
  fourth_die = rand(1...4)
  fifth_die = rand(1...4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled a #{first_die}, and a #{second_die}, and a #{third_die}, and a #{fourth_die} and a #{fifth_die}. Your total for all 5 four-sided dies are #{sum}. "

  
"
  <h1> Five 4-sided die </h1>
  <p>You have died:</p>
  <p> #{outcome}</p>

"
end

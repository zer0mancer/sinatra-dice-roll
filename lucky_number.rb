require "sinatra"
require "puma"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!("0.0.0.0/0.0.0.0")

get("/saibadee") do
  return "Sai Bai Dee!"
end

get("/") do
  erb(:template)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/restart") do
  "No more shutting down the server!!!!"
end

get("/lucky_number/2/6") do
  num1 = rand(0...10)
  num2 = rand(0...19)
  sum = num1 + num2

  @consequence = "You rolled a #{num1} and a #{num2} for a total of #{sum}."

  erb(:two_six)
end

get("/lucky_number/2/10") do
  dice_1 = rand(1...10)
  dice_2 = rand(1...10)
  total = dice_1 + dice_2
  @final = "You rolled a #{dice_1} and a #{dice_2} on the 10-sided die. Your total is #{total}"

  erb(:two_ten)
end

get("/dices/5/4") do
  first_die = rand(1...4)
  second_die = rand(1...4)
  third_die = rand(1...4)
  fourth_die = rand(1...4)
  fifth_die = rand(1...4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  @outcome = "You rolled a #{first_die}, and a #{second_die}, and a #{third_die}, and a #{fourth_die} and a #{fifth_die}. Your total for all 5 four-sided dies are #{sum}. "

  erb(:five_four)
end

get("/lucky_number") do
  @lucky = rand(1...100)

  erb(:lucky)
end

get("/die/222/7") do

  @rolls = []

  100.times do
    die = rand(1...7)

    @rolls.push(die)
  end

  erb(:one_hundred_seven)
end

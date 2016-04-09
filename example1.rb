def ask_name_and_age
  puts "What's your name?"
  name = gets.chomp

  puts "How old are you?"
  age = gets.chomp.to_i

  return name, age
end

# A variable containing the gender input of the user
def ask_gender
  # Define variable for gender
  gender = ""

  # While loop to determine gender, forces input of V or M
  # And then once received sets to UPCASE! to force capitalization
  while gender != ( "M" || "V" )
    puts "What's your gender? (m/v)"
    gender = gets.chomp
    gender.upcase!
  end

  # Method ask_gender returns the gender input of M or V
  return gender
end

# Creates local variables in this instance for name and age
# Sets these equal to the returned values from ask_name_and_age method
name, age = ask_name_and_age

gender = ask_gender

if gender == "M" && age >= 18
  puts "Good morning SIR #{name}!"
elsif gender == "V" && age >= 18
  puts "Good morning MADAM #{name}!"
else
  puts "Goedemorgen #{name}!"
end

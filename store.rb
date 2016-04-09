# Build a store
#
# Show inventory
# Ask what to buy
# Show prices

# Show inventory
# @cart[0] [1] [2] are cat, dog, unicorn respectively
@cart =         [0, 0, 0]
@total_price =  0.0
@unicorn =      0

puts "Welcome to the wonderful Store"

def show_inventory
  puts "Your current total is #{@total_price} Euro.\n" if @cart[0] || @cart[1] || @cart[2] > 0
  puts "
  We have the following Inventory:

  1)  Cats, 7 Euro each
  2)  Dogs, 15 Euro each
  3)  **The Last Unicorn**, 1000 Euro.

  Make your choice [1-3]:
  "
  # Ask what to buy
  choice = gets.chomp.to_i
  puts "You chose #{choice}."
  case choice
  when 1              # CAT
    # Add cat to string
    @cart[0] += 1
    # Adjust price
    @total_price += 7
    # Print total price and confirm the addition of cat
    puts "We'll put the cat in the cart, shall we?  The new total is #{@total_price} Euro."
  when 2          # DOG
    # Add dog to string
    @cart[1] += 1
    # Adjust price
    @total_price += 15
    # Print total price and confirm the addition of dog
    puts "We'll put the dog in the cart, shall we?"
    pet_total
  when 3           # UNICORN
    @unicorn += 1
    # Unicorn > Test if unicorn is available
    if @unicorn == 1
      # Add unicorn to string
      @cart[2] += 1
      # Adjust price
      @total_price += 1000
      # Print total price and confirm addition of unicorn
      puts "We'll put the unicorn in the cart, shall we?"
    else
      # There are no unicorns left, inform the cusotmer
      puts "Unfortunately you already have the last unicorn there in your cart."
    end
  else
    puts "#{choice}?  We don't have one of those."
  end

  if @total_price > 0
    pet_total
    what_to_do
  else
    puts "Have another look at what we have.  YOU MUST BUY SOMETHING."
    show_inventory
  end
end

def return_inventory
  pet_total
  puts "
  See above for pet costs & totals.  Which would you like to return?

  1) Cat
  2) Dog
  3) Unicorn

  4) Something else
  "
  # Get user input to determine
  refund = gets.chomp.to_i
  case refund
  when 1 # -1 cat from @cart[0] and -7 from @total_price
    # test cats > 0
    if @cart[0] > 0
      @cart[0] -= 1
      @total_price -= 7
      puts "One less cat.  That is #{@cart[0]} cat(s)."
      what_to_do
    else
      puts "You don't have any of thoese in your pet buggy."
      return_inventory
    end
  when 2 # -1 dog from @cart[1] and -15 from @total_price
    if @cart[1] > 0
      @cart[1] -= 1
      @total_price -= 15
      puts "One less dog.  That is #{@cart[1]} dog(s)."
      what_to_do
    else
      puts "You don't have any of thoese in your pet buggy."
      return_inventory
    end
  when 3 # -1 Unicorn from @cart[2] and -1000 from @total_price
    if @cart[2] > 0
      @cart[2] -= 1
      @total_price -= 1000
      puts "Returning the Unicorn?  It is the last one, so it is a bit pricy."
      what_to_do
    else
      puts "You don't have any of thoese in your pet buggy."
      return_inventory
    end
  else
    what_to_do
  end
end

# pay_inventory method is generated through show_inventory
def pay_inventory
  # Provide payment options
  print "How much would you like to pay?\n> "

  payment = gets.chomp.to_i
  @total_price -= payment
  if @total_price > 0
    puts "Thank you for your payment, but you still have #{@total_price} remaining."
    pet_total
    pay_inventory
  elsif @total_price < 0
    puts "Thank you for your purchase.  That will be #{@total_price * -1} Euro in change."
  else
    puts "Thank you for your purchase.  Enjoy your pets!"
  end
end

def pet_total
  puts "
  Currently you have the following:

  #{@cart[0]} cat(s): #{@cart[0] * 7} Euro.  They cost 7 Euro each.
  #{@cart[1]} dog(s): #{@cart[1] * 15} Euro.  They cost 15 Euro each.
  #{@cart[2]} unicorn: #{@cart[2] * 1000} Euro.  It costs 1000 Euro since it is the last.

  Total: #{@total_price} Euro.
  "
end

def what_to_do
  puts "
  What would you like to do?
  1) Pay for your new pets.
  2) Return some of the poor animals to their cage.
  3) Choose more pets to purchase.
  "
  pay = gets.chomp.to_i
  if pay == 1
    pay_inventory
  elsif pay == 2
    puts "What would you like to return?"
    return_inventory
  else
    puts "Keep on browsing then."
    show_inventory
  end
end

show_inventory

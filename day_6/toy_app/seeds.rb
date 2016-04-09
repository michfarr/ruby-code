require './inventory_file'

inventory = []

inventory << { name: "Cats", price: 70.0, quantity: 10, id: 1001 }
inventory << { name: "Dogs", price: 120.0, quantity: 10, id: 1002 }
inventory << { name: "Goats", price: 90.0, quantity: 10, id: 1003 }

write_inventory( inventory )

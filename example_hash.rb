@inventory = {}
@inventory["turtle"] = {"quantity" => 1, "price" => 2}
@inventory["cow"] = {"quantity" => 1, "price" => 2}
@inventory["parrot"] = {"quantity" => 1, "price" => 2}
@inventory["horse"] = {"quantity" => 1, "price" => 2}

@inventory.keys[0]
@inventory.keys[1]
@inventory.keys[2]
@inventory.keys[3]

@inventory.keys[0..inventory.keys.length].each { |i| puts @inventory.keys[i] }

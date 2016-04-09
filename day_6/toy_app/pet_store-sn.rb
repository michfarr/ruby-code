require 'sinatra'
require './inventory_file'

set :port, 4567

get '/' do
  "<h1>Pet Store</h1>"
end

get '/inventory/new' do
  erb :'inventory/new'
end

get '/inventory' do
  @inventory = read_inventory
  erb :'inventory/index'
end

get '/inventory/list' do
  @inventory = read_inventory
  erb :'inventory/list'
end

get '/inventory/:i' do
  @i = params[:i].to_i
  inventory = read_inventory
  @pet = inventory[@i]
  erb :'inventory/show'
end

get '/inventory/:i/edit' do
  @i = params[:i].to_i

  inventory = read_inventory
  @pet = inventory[@i]

  erb :'inventory/edit'
end

get '/inventory/:i/delete' do
  i = params[:i].to_i

  inventory = read_inventory
  inventory.delete_at( i )
  write_inventory( inventory )

  redirect '/inventory'
end

get '/inventory/:i/manage' do
  i = params[:i].to_i

  updated_quantity = { quantity: params[:quantity].to_i }

  inventory = read_inventory
  inventory[:quantity] = updated_quantity
  write_inventory( inventory )

  redirect "/inventory/#{i}"
end

get '/inventory/list' do
  @inventory = read_inventory
  erb :'inventory/list'
end

post '/inventory/:i/update' do
  i = params[:i].to_i

  updated_pet = { name: params[:name], price: params[:price].to_f, quantity: params[:quantity].to_i, id: params[:id].to_i}

  animals = read_inventory
  animals[i] = updated_pet
  write_inventory( updated_pet )

  redirect "/inventory/#{i}"
end

post '/inventory' do
  new_animal = { name: params[:name], price: params[:price].to_f, quantity: params[:quantity].to_i, id: params[:id].to_i }

  animals = read_inventory
  animals << new_animal
  write_inventory( animals )

  i = animals.length - 1

  redirect "/inventory/list"
end

# post '/search' do
#   search = { name: param[:name] }
# end

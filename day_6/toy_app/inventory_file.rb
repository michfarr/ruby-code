require 'json'

def read_inventory
  json = File.read( 'animals.json' )
  array = JSON.parse( json, { :symbolize_names => true } )
end
def write_inventory( inventory )
  File.open( "animals.json", "w" ) do |f|
    json = JSON.pretty_generate( inventory )
    f.write( json )
  end
end

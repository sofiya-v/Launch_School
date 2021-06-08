produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_hash)
  fruit = Hash.new
  produce_hash.each { |k, v| 
    if v == "Fruit"
      fruit[k] = v
    end
}
return fruit
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
puts produce
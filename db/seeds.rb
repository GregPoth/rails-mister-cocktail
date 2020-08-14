require 'open-uri'

puts "destroy the db"
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

moscow = Cocktail.create(name: "Moscow Mule")
mojito = Cocktail.create(name: "Mojito")
puts moscow.name
puts mojito.name


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients['drinks'].each do |ingredient|
   i = Ingredient.create(name: ingredient['strIngredient1'])
   puts i.name
end

Dose.create(description: "4 oz", cocktail_id: 9, ingredient_id: 2)
Dose.create(description: "6 oz", cocktail_id: 1, ingredient_id: 6)
Dose.create(description: "Tralala", cocktail_id: 2, ingredient_id: 4)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

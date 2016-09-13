# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Alcohol.create(name: "Bière", sku: "biere" )
b = Brewery.create(name: "La Plethore", sku: "la-plethore" )
c = Color.create(name: "Ambrée", sku: "ambree" )
f = Fermentation.create(name: "Double", sku: "double" )
k = Kind.create(name: "IPA", sku: "ipa" )
r = Region.create(name: "Aquitaine", sku: "aquitaine" )
s = Specificity.create(name: "Vieillie en fût de chaine", sku: "vieillie-au-fut-de-chaine" )

p = Product.create(name: "La Rouste", sku: "la-rouste", alcohol: a, brewery: b, color: c, fermentation: f, kind: k, region: r, specificity: s, capacity: 75)

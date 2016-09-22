# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Alcohol.create(name: "Bière", sku: "biere" )
b = Brewery.create(name: "La Plethore", sku: "la-plethore", description: "Le top du top!", photo_urls: ["http://www.musculaction.com/images/560-biere-musculation-2.jpg"])
c = Color.create(name: "Ambrée", sku: "ambree" )
f = Fermentation.create(name: "Double", sku: "double" )
k = Kind.create(name: "IPA", sku: "ipa" )
r = Region.create(name: "Aquitaine", sku: "aquitaine" )
s = Specificity.create(name: "Vieillie en fût de chêne", sku: "vieillie-en-fut-de-chaine" )

p = Product.create(name: "La Rouste", sku: "la-rouste", alcohol: a, brewery: b, color: c, fermentation: f, kind: k, region: r, specificity: s, capacity: 75)
p.price = 8
p.save
# urls = [
#   'http://img.clubic.com/08254724-photo-xbox-console.jpg',
#   'http://compass.xbox.com/assets/a5/d3/a5d3e0e4-38fd-42ab-90f4-e7b5112af4d1.png'
# ]
#p.photo_urls = urls # Multi-upload happens here

photo = Cloudinary::Uploader.upload('/home/jonathan/Images/906412_797213306996739_3251835919408566518_o.jpg', :public_id => 'moana')
Attachinary::File.create( attachinariable_type: "Product",
                          attachinariable_id: p.id,
                          scope: "photos",
                          public_id: photo["public_id"],
                          version: photo["version"],
                          width: photo["width"],
                          height: photo["height"],
                          format: photo["format"],
                          resource_type: "image" )

d1 = Deposit.create(name: "Magasin Bordeaux", sku: "bordeaux", address: "Rue Victor Hugo", complement: "", postal_code: 33000, city: "Bordeaux", country: "France", siret: "123456789", capacity: 1500, description: "Le top du top!" )
d2 = Deposit.create(name: "Magasin Mont de Marsan", sku: "montdemarsan", address: "Rue Victor Hugo", complement: "", postal_code: 33000, city: "Bordeaux", country: "France", siret: "123456789", capacity: 1500, description: "Le top du top!" )
d3 = Deposit.create(name: "Magasin Portets", sku: "portets", address: "Rue Victor Hugo", complement: "", postal_code: 33000, city: "Bordeaux", country: "France", siret: "123456789", capacity: 1500, description: "Le top du top!" )

n1 = New.create(title: "La fête de la bière", content: "Venez à la fête de la bière! C'est super!", photo_urls: ["http://www.musculaction.com/images/560-biere-musculation-2.jpg"] )
n1 = New.create(title: "Arrivée de la magnifique Rio Reserva de Struise.", content: "This ale was brewed back in 2008, and in collaboration with brew master Ryohei Sugawa San from Rio Brewing & Co. Our goal was to brew a Belgian dark golden blond quadrupel with an enormous potential of aromas and flavors, and added complexity due to oak barrel aging. Bourbon barels from Kentucky were chosen due to their very special soft roast quality and noble vanilla flavors. Year upon year, different quality controls were executed, and we finally decided to bottle condition this very special ale in May 2012. Another three moths of cold maturing was done at the brewery, so we could be sure about the absolute quality before releasing to our customers.", photo_urls: ["http://1.bp.blogspot.com/-Ay6H8GCw24c/UEpLuT3SLVI/AAAAAAAAAQI/4oAYS0JX0ho/s1600/005.JPG"] )



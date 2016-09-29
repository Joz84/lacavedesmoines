require 'json'
require 'csv'

def convert_to_sku(name)
  ActiveSupport::Inflector.transliterate(name.to_s).to_s.downcase.gsub(/[^0-9A-Za-z]/, '')
end
Alcohol.create( name: "Bière",     sku: "biere" )
Alcohol.create( name: "Vin",       sku: "vin" )
Alcohol.create( name: "Champagne", sku: "champagnee" )
Alcohol.create( name: "Crémant",   sku: "cremant" )

filepath = "db/db_products.json"
serialized_products = File.read(filepath)
products = JSON.parse(serialized_products)
products.each do |p|
  Brewery.create(       name: p["brewery_sku"],       sku: convert_to_sku(p["brewery_sku"]) )
  Color.create(         name: p["color_sku"],         sku: convert_to_sku(p["color_sku"]) )
  Fermentation.create(  name: p["fermentation_sku"],  sku: convert_to_sku(p["fermentation_sku"]) )
  Kind.create(          name: p["kind_sku"],          sku: convert_to_sku(p["kind_sku"]) )
  Region.create(        name: p["region_sku"],        sku: convert_to_sku(p["region_sku"]) )
  Specificity.create(   name: p["specificity_sku"],   sku: convert_to_sku(p["specificity_sku"]) )
  product = Product.new( name:         p["name"] ,
                            sku:          p["sku"],
                            capacity:     p["capacity"],
                            degree:       p["degree"].to_f,
                            alcohol:      Alcohol.find_by(      sku: p["alcohol_sku"] ),
                            brewery:      Brewery.find_by(      sku: convert_to_sku(p["brewery_sku"]) ),
                            color:        Color.find_by(        sku: convert_to_sku(p["color_sku"]) ),
                            fermentation: Fermentation.find_by( sku: convert_to_sku(p["fermentation_sku"]) ),
                            kind:         Kind.find_by(         sku: convert_to_sku(p["kind_sku"]) ),
                            region:       Region.find_by(       sku: convert_to_sku(p["region_sku"]) ),
                            specificity:  Specificity.find_by(  sku: convert_to_sku(p["specificity_sku"]) ))
  product.price = p["price"].to_f
  puts "#{product.name} : #{product.valid?}"
  unless product.valid?
    puts "###############"
    puts "#{product.name} : #{product.valid?}"
    puts product.errors.messages
    puts "###############"
  end
  product.save
  Attachinary::File.create( attachinariable_type: product.class.to_s,
                            attachinariable_id: product.id,
                            scope: "photos",
                            public_id: p["public_id"],
                            version: p["version"],
                            width: p["width"],
                            height: p["height"],
                            format: p["format"],
                            resource_type: "image" )
end

d1 = Deposit.create(  name: "La Cave des Moines de Bordeaux",
                      sku: "bordeaux",
                      address: "57, Cours Victor Hugo",
                      postal_code: 33000,
                      city: "Bordeaux",
                      country: "France",
                      siret: "123456789",
                      capacity: 1500,
                      description1: "Notre cave à Bordeaux est connue pour son cadre rustique et son hospitalité. Ici on ne met pas l'argent dans la décoration... on fait les plus petits prix pour les meilleurs produits !",
                      description2: "Appelez directement la Cave de Bordeaux au 09 81 02 42 42"
                      )
d2 = Deposit.create(  name: "Le Bar-Cave des Moines de Mont de Marsan",
                      sku: "montdemarsan",
                      address: "2610 Avenue du Maréchal Juin",
                      postal_code: 40000,
                      city: "Mont-de-Marsan",
                      country: "France",
                      siret: "123456789",
                      capacity: 1500,
                      description1: "Notre cave à Mont-de-Marsan est un Bar-Cave, vous pouvez venir déguster et emporter des merveilles ! Pourquoi pas assister en même temps à un concert...",
                      description2: "Appelez directement la Cave de Mont-de-Marsan au 05.58.44.22.56"
                      )
d3 = Deposit.create(  name: "La Cave des Moines de Portets",
                      sku: "portets",
                      address: "96 Route des Graves RN113",
                      postal_code: 33640,
                      city: "Bordeaux",
                      country: "France",
                      siret: "123456789",
                      capacity: 1500,
                      description1: "La cave de Portets est notre dépôt, vous pourrez y faire des trouvailles fantastiques dans nos 1500 références... amis passionnés, bienvenue !",
                      description2: "Appelez directement la Cave de Portets au 06 59 85 54 40"
                      )

########################################### Upload on attachinary #####################################################

# urls = []
# filepath = 'db/photo_urls.csv'
# CSV.foreach(filepath) do |row|
#   urls << "#{row[0]}"
# end

# #urls = ["/home/jonathan/Images/biere-7PK-blonde-33cl.jpg", "/home/jonathan/Images/biere-westmalle-trappist-dubbel.jpg"]
# db = {products: []}
# urls.each do |url|
#   p url
#   sku = url.split("/")[-1][0..-5]
#   capacity = sku.split("-")[-1][0..-3]
#   if capacity == "33"
#     capacity = capacity.to_i
#     name = sku.split("-")[1..-2].join(" ")
#   else
#     capacity = 75
#     name = sku.split("-")[1..-1].join(" ")
#   end

#   photo = Cloudinary::Uploader.upload(url, public_id: sku)
#   db[:products] << {
#     sku: sku.downcase,
#     name: name,
#     alcohol_sku: sku.split("-")[0],
#     brewery_sku: "",
#     color_sku: "",
#     fermentation_sku: "",
#     kind_sku: "",
#     region_sku: "",
#     specificity_sku: "",
#     capacity: capacity,
#     degree: "",
#     price: "",
#     public_id: photo["public_id"],
#     version: photo["version"],
#     width: photo["width"],
#     height: photo["height"],
#     format: photo["format"]
#   }
# end

# File.open("db/db_products.json", 'w') do |file|
#   file.write(JSON.generate(db[:products]))
# end

########################################### Tests #####################################################

# def associate_photo(instance, photo_url)
#   photo = Cloudinary::Uploader.upload(photo_url, :public_id => instance.sku)
#   Attachinary::File.create( attachinariable_type: instance.class.to_s, attachinariable_id: instance.id, scope: "photos", public_id: photo["public_id"], version: photo["version"], width: photo["width"], height: photo["height"], format: photo["format"], resource_type: "image" )
# end



# biere = Alcohol.create(name: "Bière", sku: "biere" )
# vin = Alcohol.create(name: "Vin", sku: "vin" )

# b = Brewery.create(name: "La Plethore", sku: "la-plethore", description: "Le top du top!", photo_urls: ["http://www.musculaction.com/images/560-biere-musculation-2.jpg"])

# ambree = Color.create(name: "Ambrée", sku: "ambree" )

# f = Fermentation.create(name: "Double", sku: "double" )
# k = Kind.create(name: "IPA", sku: "ipa" )
# r = Region.create(name: "Aquitaine", sku: "aquitaine" )
# # s = Specificity.create(name: "Vieillie en fût de chêne", sku: "vieillie-en-fut-de-chaine" )

# p = Product.create(name: "La Rouste", sku: "la-rouste", alcohol: a1, brewery: b, color: c, fermentation: f, kind: k, region: r, specificity: s, capacity: 75)
# # p.price = 8
# p.save
#
#n1 = New.create(title: "La fête de la bière", content: "Venez à la fête de la bière! C'est super!", photo_urls: ["http://www.musculaction.com/images/560-biere-musculation-2.jpg"] )
#n1 = New.create(title: "Arrivée de la magnifique Rio Reserva de Struise.", content: "This ale was brewed back in 2008, and in collaboration with brew master Ryohei Sugawa San from Rio Brewing & Co. Our goal was to brew a Belgian dark golden blond quadrupel with an enormous potential of aromas and flavors, and added complexity due to oak barrel aging. Bourbon barels from Kentucky were chosen due to their very special soft roast quality and noble vanilla flavors. Year upon year, different quality controls were executed, and we finally decided to bottle condition this very special ale in May 2012. Another three moths of cold maturing was done at the brewery, so we could be sure about the absolute quality before releasing to our customers.", photo_urls: ["http://1.bp.blogspot.com/-Ay6H8GCw24c/UEpLuT3SLVI/AAAAAAAAAQI/4oAYS0JX0ho/s1600/005.JPG"] )



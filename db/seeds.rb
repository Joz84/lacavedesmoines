require 'json'
require 'csv'

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


# d1 = Deposit.create(name: "Magasin Bordeaux", sku: "bordeaux", address: "Rue Victor Hugo", complement: "", postal_code: 33000, city: "Bordeaux", country: "France", siret: "123456789", capacity: 1500, description: "Le top du top!" )
# d2 = Deposit.create(name: "Magasin Mont de Marsan", sku: "montdemarsan", address: "Rue Victor Hugo", complement: "", postal_code: 33000, city: "Bordeaux", country: "France", siret: "123456789", capacity: 1500, description: "Le top du top!" )
# d3 = Deposit.create(name: "Magasin Portets", sku: "portets", address: "Rue Victor Hugo", complement: "", postal_code: 33000, city: "Bordeaux", country: "France", siret: "123456789", capacity: 1500, description: "Le top du top!" )

# n1 = New.create(title: "La fête de la bière", content: "Venez à la fête de la bière! C'est super!", photo_urls: ["http://www.musculaction.com/images/560-biere-musculation-2.jpg"] )
# n1 = New.create(title: "Arrivée de la magnifique Rio Reserva de Struise.", content: "This ale was brewed back in 2008, and in collaboration with brew master Ryohei Sugawa San from Rio Brewing & Co. Our goal was to brew a Belgian dark golden blond quadrupel with an enormous potential of aromas and flavors, and added complexity due to oak barrel aging. Bourbon barels from Kentucky were chosen due to their very special soft roast quality and noble vanilla flavors. Year upon year, different quality controls were executed, and we finally decided to bottle condition this very special ale in May 2012. Another three moths of cold maturing was done at the brewery, so we could be sure about the absolute quality before releasing to our customers.", photo_urls: ["http://1.bp.blogspot.com/-Ay6H8GCw24c/UEpLuT3SLVI/AAAAAAAAAQI/4oAYS0JX0ho/s1600/005.JPG"] )
#url = "/home/jonathan/Images/906412_797213306996739_3251835919408566518_o.jpg"


urls = []
filepath = 'db/photo_urls.csv'
CSV.foreach(filepath) do |row|
  urls << "#{row[0]}"
end

#urls = ["/home/jonathan/Images/biere-7PK-blonde-33cl.jpg", "/home/jonathan/Images/biere-westmalle-trappist-dubbel.jpg"]
db = {products: []}
urls.each do |url|
  p url
  sku = url.split("/")[-1][0..-5]
  capacity = sku.split("-")[-1][0..-3]
  if capacity == "33"
    capacity = capacity.to_i
    name = sku.split("-")[1..-2].join(" ")
  else
    capacity = 75
    name = sku.split("-")[1..-1].join(" ")
  end

  photo = Cloudinary::Uploader.upload(url, public_id: sku)
  db[:products] << {
    sku: sku.downcase,
    name: name,
    alcohol_sku: sku.split("-")[0],
    brewery_sku: "",
    color_sku: "",
    fermentation_sku: "",
    kind_sku: "",
    region_sku: "",
    specificity_sku: "",
    capacity: capacity,
    price: "",
    public_id: photo["public_id"],
    version: photo["version"],
    width: photo["width"],
    height: photo["height"],
    format: photo["format"]
  }
end

File.open("db/db_products.json", 'w') do |file|
  file.write(JSON.generate(db[:products]))
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'
require 'net/http'
require 'openssl'
puts "Getting rid of old books"
Book.destroy_all
# User.destroy_all
# OrderReview.destroy_all
# Order.destroy_all
# BookCopy.destroy_all
# Message.destroy_all
puts "Here we go!!!"

# User.create!(email: "andy@gmail.com", password: "123456", first_name: "Andrew", last_name: "Grant", display_name: "Andy")
# User.create!(email: "Katya@gmail.com", password: "123456", first_name: "katya", last_name: "Sitko", display_name: "Kat")
# User.create!(email: "philly@gmail.com", password: "123456", first_name: "Phillip", last_name: "York", display_name: "Philly")


def new_book(search, category = nil)
  uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{search}&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk")
  results = URI.open(uri).read
  user = JSON.parse(results)

  # response = Net::HTTP.get(uri)
  # book = JSON.parse(response)
  book = user["items"][0]
  # 1.times do |i|
    # books["items"].each do |book|
    if category
      defined_category = category
    else
      defined_category = book["volumeInfo"]["categories"].nil? ? nil : book["volumeInfo"]["categories"][0]
    end


      Book.create!(
        title: book["volumeInfo"]["title"],
        author: book["volumeInfo"]["authors"].nil? ? nil : book["volumeInfo"]["authors"][0],
        description: book["volumeInfo"]["description"],
        pages: book["volumeInfo"]["pageCount"],
        year: book["volumeInfo"]["publishedDate"],
        publisher: book["volumeInfo"]["publisher"],
        isbn: book["volumeInfo"]["industryIdentifiers"].nil? ? nil : book["volumeInfo"]["industryIdentifiers"][0]["identifier"], #tenery operater
        category: defined_category,
        language: book["volumeInfo"]["language"],
        photo_url: "https://books.google.com/books/content?id=#{book['id']}&printsec=frontcover&img=1&zoom=1&source=gbs_api")
end

new_book("If+on+a+Winter's+Night+a+Traveller", "Classic")
new_book("In+The+End,+It+Was+All+About+Love", "Non-fiction")
new_book("brave+new+world+huxley", "Sci-fi")
new_book("Ubik", "Sci-fi")
new_book("The+Silence+of+the+Girls", "Greek mythology")
new_book("Deeper+Than+The+Ocean", "Horror")
new_book("The+Third+Policeman", "Dark Comedy")
new_book("Raise+High+the+Roof+Beam,+Carpenters+and+Seymour", "Short stories")
new_book("Leaves+of+Grass", "Poetry")
new_book("The+Man+in+the+High+Castle", "Dystopian")
new_book("The+Lion,+The+Witch+and+the+Wardrobe", "Childrens")
new_book("catch+22", "War story ")
new_book("Cosmicomics", "Sci-fi")
new_book("All+Souls+day", "Fiction")
new_book("The+Picture+of+Dorian+Gray", "Classic")
new_book("All+Down+Darkness+Wide:+A+Memoir", "Non-fiction")
new_book("Dubliners", "Short stories")
new_book("Listen+to+the+Land+Speak+:+A+Journey+into+the+wisdom+of+what+lies+beneath+us", "Non-fiction")

new_book("We+Have+Always+Been+Here", "Horror")
new_book("Sign+Here", "Horror")

new_book("Helter+Skelter", "True crime")
new_book("The+Great+Gatsby", "Classic")
new_book("Stories+of+Your+Life+and+Others", "Fiction")
new_book("Island+of+a+Thousand+Mirrors")
new_book("The+Shining", "Horror")
new_book("The+Years+with+Laura+Diaz")
new_book("For+Esme+with+Love+and+Squalor", "Short stories")
new_book("The+Haunting+of+Hill+House", "Horror")
new_book("The+Island+that+dared", "Travel")
new_book("The+Green+mile", "Horror")
new_book("The+Death+of+Artemio+Cruz", "Classic")
new_book("Origins+How+Earth's+History+Shaped+Human+History", "Non-fiction")

# def user_profile
#   user_2 = User.create!(email: "sara@hotmail.com", password: "123456", first_name: "Sara", last_name: "Pulido", display_name: "Sara Pulido")
#   photo2 = URI.open('app/assets/images/logo-s.png')
#   user_2.photo.attach(io: photo2, filename: 'logo-s', content_type: 'image/jpg')
#   user_2.save!
# end

# puts "Users created"


# response = Net::HTTP.get(uri)
# books = JSON.parse(response)

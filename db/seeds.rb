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
puts "Here we go!!!"

User.create!(email: "andy@hotmail.com", password: "123456", first_name: "Andrew", last_name: "Grant", display_name: "Andy")

def new_book(search)
  uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{search}&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk")
  results = URI.open(uri).read
  user = JSON.parse(results)

  # response = Net::HTTP.get(uri)
  # book = JSON.parse(response)
  book = user["items"][0]
  # 1.times do |i|
    # books["items"].each do |book|
      Book.create!(
        title: book["volumeInfo"]["title"],
        author: book["volumeInfo"]["authors"].nil? ? nil : book["volumeInfo"]["authors"][0],
        description: book["volumeInfo"]["description"],
        pages: book["volumeInfo"]["pageCount"],
        year: book["volumeInfo"]["publishedDate"],
        publisher: book["volumeInfo"]["publisher"],
        isbn: book["volumeInfo"]["industryIdentifiers"].nil? ? nil : book["volumeInfo"]["industryIdentifiers"][0]["identifier"], #tenery operater
        category: book["volumeInfo"]["categories"].nil? ? nil : book["volumeInfo"]["categories"][0],
        language: book["volumeInfo"]["language"],
        photo_url: "https://books.google.com/books/content?id=#{book['id']}&printsec=frontcover&img=1&zoom=1&source=gbs_api")
end

new_book("If+on+a+Winter's+Night+a+Traveller")
new_book("In+The+End,+It+Was+All+About+Love")
new_book("brave+new+world")
new_book("ubik")
new_book("Nineteen+Eighty+Four")
new_book("The+Third+Policeman")
new_book("Raise+High+the+Roof+Beam,+Carpenters+and+Seymour")
new_book("Leaves+of+Grass")
new_book("The+Stranger")
new_book("The+Lion,+The+Witch+and+the+Wardrobe")

# book ["volumeInfo"]["averageRating"]
# response = Net::HTTP.get(uri)
# books = JSON.parse(response)

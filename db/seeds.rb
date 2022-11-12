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

Book.destroy_all
puts "Here we go!!!"

uri = URI("https://www.googleapis.com/books/v1/volumes?q=dracula+inauthor:stroker&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk")
# response = Net::HTTP.get(uri)
# books = JSON.parse(response)
response = Net::HTTP.get(uri)
books = JSON.parse(response)
5.times do |i|

  books["items"].each do |book|
    Book.create(
      title: book["volumeInfo"]["title"],
      author: book["volumeInfo"]["authors"].strip,
      description: book["volumeInfo"]["description"],
      pages: book["volumeInfo"]["pageCount"],
      year: book["volumeInfo"]["publishedDate"],
      publisher: book["volumeInfo"]["publisher"],
      isbn: book["volumeInfo"]["industryIdentifiers"].nil? ? nil : book["volumeInfo"]["industryIdentifiers"][0]["identifier"], #tenery operater
      category: book["volumeInfo"]["categories"],
      language: book["volumeInfo"]["language"]
    )
  end
end

# book ["volumeInfo"]["averageRating"]

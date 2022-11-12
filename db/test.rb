require 'json'
require 'open-uri'
require 'net/http'
require 'openssl'

puts "Here we go!!!"


uri = URI("https://www.googleapis.com/books/v1/volumes?q=1984&orwell&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk")
# response = Net::HTTP.get(uri)
# books = JSON.parse(response)


10.times do |i|
  puts "Getting you some books"

  books["items"].each do |book|
    response = Net::HTTP.get(uri)
books = JSON.parse(response)
    Book.create(
      title:  book ["volumeInfo"]["title"],
      authors: book ["volumeInfo"]["authors"],
      description: book ["volumeInfo"]["description"],
    )
  end
end
puts "Books created"


# books["items"].each do |book|
#   # p book ["volumeInfo"]["authors"]
#   #p book ["volumeInfo"]["categories"]
#   p book ["volumeInfo"]["title"]
#   #p book ["volumeInfo"]["description"]
#   # p book ["volumeInfo"]["pageCount"]
#   # p book ["volumeInfo"]["publisher"]
#   # p book ["volumeInfo"]["publishedDate"]
#   #p book ["volumeInfo"]["averageRating"]

#   isbn_array = book["volumeInfo"]["industryIdentifiers"]

#   if isbn_array.nil?
#     nil
#   else
#    isbn_code = isbn_array[0]["identifier"]
#    p isbn_code
#   end
#   end

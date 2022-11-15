

#   isbn_array = book["volumeInfo"]["industryIdentifiers"]

#   if isbn_array.nil?
#     nil
#   else
#    isbn_code = isbn_array[0]["identifier"]
#    p isbn_code
#   end
#   end


# <div class="container">
#   <%= form_with url: root_path, method: :get, class: "d-flex" do %>
#   <%= text_field_tag :query,
#     params[:query],
#     class: "form-control",
#     placeholder: "Find a book"
#   %>
#   <%= submit_tag "Search", class: "btn btn-primary" %>
# <% end %>
# </div>


# div class="container">
# <% @books.each do |book| %>
#   <div class="book-container">
#     <h4><%= book.title %></h4>
#     <p><%= book.author %></p>
#     <p><%= book.description %></p>
#     <p>Isbn:<%= book.isbn %></p>
#     <p>Category:<%= book.category %></p>

#   </div>
#    <% end %>
# </div>

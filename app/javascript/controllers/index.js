// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BsModalController from "./bs_modal_controller"
application.register("bs-modal", BsModalController)

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import FilterBooksController from "./filter_books_controller"
application.register("filter-books", FilterBooksController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InsertInListController from "./insert_in_list_controller"
application.register("insert-in-list", InsertInListController)

import ScrollController from "./scroll_controller"
application.register("scroll", ScrollController)

import SearchBooksController from "./search_books_controller"
application.register("search-books", SearchBooksController)

import UpdateMyBookCardController from "./update_my_book_card_controller"
application.register("update-my-book-card", UpdateMyBookCardController)

if @order_review.persisted?
  json.form render(partial: "order_reviews/form", formats: :html, locals: {order_review: OrderReview.new, order: Order.find(params[:order_id])})
  json.inserted_item render(partial: "user_profiles/user_reviews", formats: :html, locals: {order_review: @order_review})
else
  json.form render(partial: "order_reviews/form", formats: :html, locals: {order_review: @order_review, order: @order_review.order  })
end

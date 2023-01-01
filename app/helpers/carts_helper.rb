# frozen_string_literal: true

module CartsHelper
  def total_bill(cart)
    sum = 0
    cart.cart_items.each { |cart_item| sum += cart_item.game.price * cart_item.quantity }
    sum
  end
end

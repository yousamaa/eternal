# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name type phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name type phone_number])
  end

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id])
    return @current_cart unless @current_cart.nil?

    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end
end

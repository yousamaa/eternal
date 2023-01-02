# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_cart
  before_action :set_cart_user

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name type phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name type phone_number])
  end

  def set_current_cart
    if session[:cart_id]
        @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

  def set_cart_user
    @current_cart.user = current_user unless current_user.nil?
    @current_cart.save
  end
end

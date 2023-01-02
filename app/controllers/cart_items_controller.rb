class CartItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[create destroy]

  def create
    chosen_game = Game.find(params[:game_id])
    
    if !@current_cart.games.include?(chosen_game)
      @cart_item = CartItem.new
      @cart_item.cart = @current_cart
      @cart_item.game = chosen_game

      @cart_item.save
    
      flash[:notice] = 'Item was added in the cart succesfully'
    else
      flash[:alert] = 'Item was already added in the cart'
    end
    redirect_to '/games'
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])

    if @cart_item.destroy
      flash[:notice] = 'Cart Item deleted successfully!'
    else
      flash[:alert] = 'Cart Item not deleted!.'
    end

    redirect_to cart_path(@current_cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :game_id, :cart_id)
  end
end

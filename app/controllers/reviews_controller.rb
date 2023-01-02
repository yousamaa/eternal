class ReviewsController < ApplicationController
  before_action :set_game
  before_action :set_review, except: %i[create]

  def create
    @review = @game.reviews.build(review_params)
    @review.user = current_user

    if @game.save
      flash[:notice] = 'Review created successfully!'
    else
      flash[:alert] = 'Review not created!'
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review has been updated!'
    else
      flash[:alert] = 'Review was not updated!'
    end
    redirect_to game_path(@game)
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:game_id, :rating, :comment)
  end

  def set_game
    @game = Game.find_by(id: params[:game_id])
  end

  def set_review
    @review = @game.reviews.find_by(id: params[:id])
  end
end

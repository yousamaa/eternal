# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit destroy]

  layout "home"

  def index
    if params[:q].present?
      @games = Game.where("name ILIKE ?", "%#{params[:q]}%")  
    else
      @games = Game.all
    end
  end

  def show; end

  def new
    @game = Game.new
  end

  def edit; end

  def create
    @game = current_user.games.build(game_params)

    if @game.save
      flash[:notice] = 'Game was successfully created.'
      redirect_to '/developers/games/add'
    else
      flash[:alert] = 'Game was not created.'
      render :new
    end
  end

  def search 
    index
    render :index
  end

  # def list
  #   search_on_games
  # end

  # def search_on_games
  #   term = params[:q]
  #   @games.select{ |game|
  #     text_search_match?(game.name, term)
  #   }
  # end

  #  def text_search_match?(value, term)
  #   value.to_s.downcase.include?(term.to_s.downcase) unless value.blank? || term.blank?
  # end

  def update

    @game = params[:game]
    @game = Game.find(@game[:id])
    if @game.update(game_params)
      flash[:notice] = 'Game was successfully updated.'
      redirect_to '/developers/games/' + @game[:id].to_s + '/edit'
    else
      flash[:alert] = 'Game was not updated.'
      render :edit
    end
  end

  def destroy
    if @game.destroy
      flash[:notice] = 'Game was successfully destroyed.'
      render :index
    else
      flash[:alert] = 'Game was not destroyed.'
      render :show
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit!
  end
end

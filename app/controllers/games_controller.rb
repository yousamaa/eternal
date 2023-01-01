# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit destroy]

  

  def index
    @games = Game.all
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
      redirect_to '/developers/add_game'
    else
      flash[:alert] = 'Game was not created.'
      render :new
    end
  end

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

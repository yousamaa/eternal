# frozen_string_literal: true

class DevelopersController < ApplicationController

  layout 'developers/dashboard'

  before_action :set_game, only: [:game, :edit_games]
  before_action :set_developer_games, only: [:show_games]
  
  def show; end

  def add_game; end

  def show_games; end

  def game; end

  def edit_games; end

  private

  def set_game
  @games = Game.find(params[:id]) 
  @game = Game.find(params[:id])
  end

  def set_developer_games
    @games = current_user.games
  end
end

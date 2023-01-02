# frozen_string_literal: true

class AdminsController < ApplicationController
  layout 'admins/dashboard'

  before_action :set_game, only: [:game, :edit_games]
  before_action :set_admin_games, only: [:show_games]
  
  def show; end



  def show_games; end

  def game; end


  private

  def set_game
    @games = Game.find(params[:id])
    @game = Game.find(params[:id])
  end

  def set_admin_games
    @games = current_user.games
  end
end

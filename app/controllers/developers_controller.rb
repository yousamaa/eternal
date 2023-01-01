# frozen_string_literal: true

class DevelopersController < ApplicationController

  layout 'developers/dashboard'

  def show; end

  def add_game; end

  def show_games
    @games = current_user.games
  end
end

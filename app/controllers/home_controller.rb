# frozen_string_literal: true

class HomeController < ApplicationController
  layout "home"
  skip_before_action :authenticate_user!, only: [:index]
  def index; end
end

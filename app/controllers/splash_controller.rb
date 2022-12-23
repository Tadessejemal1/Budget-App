class SplashController < ApplicationController
  def index
    redirect_to categories_path if current_user.present?
  end
end

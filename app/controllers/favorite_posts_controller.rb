class FavoritePostsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@posts = current_user.favorites.all
  end
end

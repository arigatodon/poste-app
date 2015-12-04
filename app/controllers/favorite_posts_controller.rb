class FavoritePostsController < ApplicationController
  def index
  	@posts = current_user.favorites.all
  end
end

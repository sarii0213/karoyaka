class UsersController < ApplicationController
  def show
    @user = current_user
    @quote = current_user.favorite_quotes.sample
  end
end

class Quotes::FavoritesController < ApplicationController
  before_action :set_quote

  def create
    current_user.favorite(@quote)
    redirect_to quotes_path
  end

  def destroy
    current_user.unfavorite(@quote)
    redirect_to quotes_path
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end
end

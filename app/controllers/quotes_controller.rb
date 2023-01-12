class QuotesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:favorites]
      @quotes = current_user.favorite_quotes
    else
      @quotes = Quote.all
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end
end

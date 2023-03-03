class QuotesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @quotes = if params[:favorites]
                current_user.favorite_quotes.page(params[:page])
              else
                Quote.all.page(params[:page])
              end
  end

  def show
    @quote = Quote.find(params[:id])
  end
end

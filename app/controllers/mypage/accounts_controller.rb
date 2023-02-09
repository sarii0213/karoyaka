class Mypage::AccountsController < ApplicationController
  def show
    @user = current_user
    @days = current_user.items.distinct_days
    @day_what = if current_user.items.present? && current_user.items.last.created_at.day == Time.now.day
                  @days
                else
                  @days + 1
                end
    @quote = current_user.favorite_quotes.sample
  end
end

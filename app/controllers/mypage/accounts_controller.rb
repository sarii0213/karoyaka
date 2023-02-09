module Mypage
  class AccountsController < ApplicationController
    def show
      @user = current_user
      set_days
      @quote = current_user.favorite_quotes.sample
    end

    private

    def set_days
      @days = current_user.items.distinct_days
      @day_what = if current_user.items.present? && current_user.items.last.created_at.day == Time.zone.now.day
                    @days
                  else
                    @days + 1
                  end
    end
  end
end

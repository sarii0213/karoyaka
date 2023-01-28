class AchievementsController < ApplicationController
  def show
    @days = current_user.items.distinct_days
    @to_let_go_items_num = current_user.to_let_go_items.count
    @done_letting_go_items_num = current_user.done_letting_go_items.count
    @category_ranking = current_user.done_letting_go_items.joins(:category)
                                    .group('categories.name').order(count_all: :desc).limit(3).count
    @reason_ranking = current_user.done_letting_go_items.joins(:reason)
                                  .group('reasons.name').order(count_all: :desc).limit(3).count
    @way_ranking = current_user.done_letting_go_items.joins(:letting_go_way)
                               .group('letting_go_ways.name').order(count_all: :desc).limit(3).count
  end
end

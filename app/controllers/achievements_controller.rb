class AchievementsController < ApplicationController
  def show
    set_days
    set_items_num
    set_category_ranking
    set_reason_ranking
    set_way_ranking
  end

  private

  def set_days
    @days = current_user.items.distinct_days
    @day_what = if current_user.items.present? && current_user.items.last.created_at.day == Time.now.day
                  @days
                else
                  @days + 1
                end
  end

  def set_items_num
    @to_let_go_items_num = current_user.to_let_go_items.count
    @done_letting_go_items_num = current_user.done_letting_go_items.count
  end

  def set_category_ranking
    @category_ranking = current_user.done_letting_go_items.joins(:category)
                                    .group('categories.name').order(count_all: :desc).limit(3).count
  end

  def set_reason_ranking
    @reason_ranking = current_user.done_letting_go_items.joins(:reason)
                                  .group('reasons.name').order(count_all: :desc).limit(3).count
  end

  def set_way_ranking
    @way_ranking = current_user.done_letting_go_items.joins(:letting_go_way)
                               .group('letting_go_ways.name').order(count_all: :desc).limit(3).count
  end
end

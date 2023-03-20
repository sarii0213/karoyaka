# == Schema Information
#
# Table name: letting_go_ways
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  selectable  :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_letting_go_ways_on_name  (name) UNIQUE
#
class LettingGoWay < ApplicationRecord
  include Selectable

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :category_way_optimalities, dependent: :destroy
  has_many :reason_way_optimalities, dependent: :destroy

  def self.optimal(category_id, reason_id)
    category_scores = CategoryWayOptimality.scores(category_id)
    reason_scores = ReasonWayOptimality.scores(reason_id)
    scores = [category_scores, reason_scores].transpose.map { |ary| ary.inject(:*) }
    way_ids = []
    3.times do |_|
      way_ids.push(scores.index(scores.max) + 1)
      scores[scores.index(scores.max)] = 0
    end
    where(id: way_ids)
  end

  def self.category_optimal(category_id)
    joins(:category_way_optimalities).merge(CategoryWayOptimality.where(category_id:).order(score: :desc)).limit(3)
  end

  def self.reason_optimal(reason_id)
    joins(:reason_way_optimalities).merge(ReasonWayOptimality.where(reason_id:).order(score: :desc)).limit(3)
  end
end

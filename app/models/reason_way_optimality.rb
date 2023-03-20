# == Schema Information
#
# Table name: reason_way_optimalities
#
#  id                :bigint           not null, primary key
#  score             :decimal(3, 2)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  letting_go_way_id :bigint           not null
#  reason_id         :bigint           not null
#
# Indexes
#
#  index_reason_way_optimalities_on_letting_go_way_id  (letting_go_way_id)
#  index_reason_way_optimalities_on_reason_id          (reason_id)
#  reason_way_id_uniqueness                            (reason_id,letting_go_way_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (letting_go_way_id => letting_go_ways.id)
#  fk_rails_...  (reason_id => reasons.id)
#
class ReasonWayOptimality < ApplicationRecord
  validates :reason_id, uniqueness: { scope: :letting_go_way_id }

  belongs_to :reason
  belongs_to :letting_go_way

  def self.scores(reason_id)
    where(reason_id:).map(&:score)
  end
end

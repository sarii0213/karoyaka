# == Schema Information
#
# Table name: letting_go_ways
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_letting_go_ways_on_name  (name) UNIQUE
#
class LettingGoWay < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

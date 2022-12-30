# == Schema Information
#
# Table name: reasons
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_reasons_on_name  (name) UNIQUE
#
class Reason < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :name, uniqueness: true

  has_many :to_let_go_lists
end

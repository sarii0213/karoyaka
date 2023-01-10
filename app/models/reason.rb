# == Schema Information
#
# Table name: reasons
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
#  index_reasons_on_name  (name) UNIQUE
#
class Reason < ApplicationRecord
  include Selectable

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :to_let_go_items, dependent: :destroy
end

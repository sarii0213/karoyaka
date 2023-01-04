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
require 'rails_helper'

RSpec.describe LettingGoWay, type: :model do
  subject { build(:letting_go_way) }
  it { is_expected.to be_valid }
end

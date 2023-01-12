# == Schema Information
#
# Table name: items
#
#  id                :bigint           not null, primary key
#  name              :string(255)
#  type              :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint           not null
#  letting_go_way_id :bigint
#  reason_id         :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_items_on_category_id        (category_id)
#  index_items_on_letting_go_way_id  (letting_go_way_id)
#  index_items_on_reason_id          (reason_id)
#  index_items_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (letting_go_way_id => letting_go_ways.id)
#  fk_rails_...  (reason_id => reasons.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Item do
  subject { build(:item) }

  it { is_expected.to be_valid }
end

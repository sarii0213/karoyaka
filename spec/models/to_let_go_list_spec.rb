# == Schema Information
#
# Table name: to_let_go_lists
#
#  id          :bigint           not null, primary key
#  item        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  reason_id   :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_to_let_go_lists_on_category_id  (category_id)
#  index_to_let_go_lists_on_reason_id    (reason_id)
#  index_to_let_go_lists_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (reason_id => reasons.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe ToLetGoList, type: :model do
  subject { build(:to_let_go_list) }
  it { is_expected.to be_valid }
end
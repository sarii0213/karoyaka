# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quote_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_quote_id              (quote_id)
#  index_favorites_on_quote_id_and_user_id  (quote_id,user_id) UNIQUE
#  index_favorites_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (quote_id => quotes.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject { build(:favorite) }
  it { is_expected.to be_valid }
end

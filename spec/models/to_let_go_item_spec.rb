require 'rails_helper'

RSpec.describe ToLetGoItem, type: :model do
  subject { build(:to_let_go_item) }
  it { is_expected.to be_valid }
end

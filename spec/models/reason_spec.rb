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
require 'rails_helper'

RSpec.describe Reason, type: :model do
  subject { build(:reason) }
  it { is_expected.to be_valid }
end

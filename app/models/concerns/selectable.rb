require 'active_support'

module Selectable
  extend ActiveSupport::Concern

  included do
    scope :selectable, -> { where(selectable: true) }
  end
end

# frozen_string_literal: true

# typed: true

# a single whiskey rating record
class Whiskey < ApplicationRecord
  extend T::Sig

  include ::WhiskeysConcern

  belongs_to :user
end

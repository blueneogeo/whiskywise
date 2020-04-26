# frozen_string_literal: true

# typed: true

# a single whiskey rating record
class Whiskey < ApplicationRecord
  extend T::Sig

  belongs_to :user
end

# typed: strict
# frozen_string_literal: true

# a user of our application who represents an account
class User < ApplicationRecord
  has_secure_password
end

# frozen_string_literal: true

# typed: true

# the root application presenter, extended by other presenters
class WhiskeysPresenter < ApplicationPresenter
  extend T::Sig

  sig { params(controller: WhiskeysController).void }
  def initialize(controller)
    super(controller)
    # so we know this is more specific than the inherited ApplicationController:
    @controller = controller
  end

  # get the users who rated a given whiskey
  sig { params(whiskey: Whiskey).returns(User::ActiveRecord_Relation) }
  def get_users(whiskey)
    User.where(id: whiskey.user.id)
  end
end

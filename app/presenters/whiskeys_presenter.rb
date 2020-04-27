# frozen_string_literal: true

# typed: strict

# the root application presenter, extended by other presenters
class WhiskeysPresenter < ApplicationPresenter
  extend T::Sig

  sig { params(controller: WhiskeysController).void }
  def initialize(controller)
    super(controller)
    # so we know this is more specific than the inherited ApplicationController:
    @controller = controller
  end
end

# frozen_string_literal: true

# typed: true

# the root application presenter, extended by other presenters
class ApplicationPresenter
  extend T::Sig

  sig { params(controller: ApplicationController).void }
  def initialize(controller)
    @controller = controller
  end

  def current_user
    @controller.current_user
  end

  def logged_in?
    @controller.logged_in?
  end
end

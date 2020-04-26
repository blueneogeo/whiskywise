# frozen_string_literal: true

# typed: true

# present the application, usually extended by individual controller views
class ApplicationPresenter
  sig { params(controller: ApplicationController).void }
  def initialize(controller)
    @controller = T.let(controller, ApplicationController)
  end

  def current_user
    @controller.current_user
  end

  def logged_in?
    @controller.logged_in?
  end
end

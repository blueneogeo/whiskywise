# typed: strong
# This is an autogenerated file for Rails helpers.
# Please rerun rake rails_rbi:helpers to regenerate.
module ApplicationHelper
  include Kernel
  include ActionView::Helpers
end

module PageHelper
  include Kernel
  include ActionView::Helpers
end

module ActionController::Helpers
  sig { returns(T.all(ApplicationHelper, PageHelper)) }
  def helpers; end
end
# typed: true
# frozen_string_literal: true

# static page controller
class PageController < ApplicationController
  def initialize
    super
    @users = T.let(%w[Roy Lukasz Christian], T::Array[String])
    @year = T.let(Time.now.year, Integer)
    @author = T.let('Christian', String)
    @selfy = T.let(self, PageController)
  end

  # sig { returns(T.nilable(User)) }
  def index
    user_or_nil = User.find_by(name: 'test')
    @first_name = user_or_nil.first_name unless user_or_nil.nil?
  end

  def about; end
end

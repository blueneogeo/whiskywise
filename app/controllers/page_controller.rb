# typed: true
# frozen_string_literal: true

# static page controller
class PageController < ApplicationController
  extend T::Sig

  def initialize
    super
    @users = T.let(%w[Roy Lukasz Christian], T::Array[String])
    @year = T.let(Time.now.year, Integer)
    @author = T.let('Christian', String)
    @selfy = T.let(self, PageController)
  end

  def index; end

  def about; end
end

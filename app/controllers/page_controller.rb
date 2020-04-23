# frozen_string_literal: true

# static page controller
class PageController < ApplicationController

  def initialize
    super
    @users = %w[Roy Lukasz Christian]
    @year = Time.now.year
    @author = 'Christian'
  end

  def index; end

  def about; end
end

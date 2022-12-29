class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def top; end

  def about; end

  def privacy; end

  def term; end
end

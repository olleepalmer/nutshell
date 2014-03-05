class PagesController < ApplicationController

  def home
    @categories = Category.includes(:posts).load
  end

  def about
  end

end

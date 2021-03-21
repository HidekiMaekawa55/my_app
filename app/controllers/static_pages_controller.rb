class StaticPagesController < ApplicationController
  def home
    @manuscripts = Manuscript.limit(5).order("created_at DESC")
  end

  def about
  end

  def manager
  end
end

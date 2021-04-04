class StaticPagesController < ApplicationController
  def home
    @manuscripts = Manuscript.limit(6).order("created_at DESC")
    @events = Event.limit(6).order("created_at DESC")
  end

  def about
  end

  def manager
  end
end

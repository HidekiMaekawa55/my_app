class StaticPagesController < ApplicationController
  def home
    @manuscripts = Manuscript.limit_order(6, 'created_at')
    @events = Event.limit_order(6, 'created_at')
  end

  def about
  end

  def manager
  end
end

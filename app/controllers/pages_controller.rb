class PagesController < ApplicationController
  
  def index
    if !signed_in?
      render 'landing'
    end
    @hits = Hit.all
    #@reviewable_hits = Hit.first.reviewable_hits
  end
  
  
  def about
  end
  
  def contact
  end
  
end

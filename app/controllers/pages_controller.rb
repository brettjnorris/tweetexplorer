class PagesController < ApplicationController
  def index
  end
  
  def fetch
    if current_user
      RecordTweetsJob.perform_later(current_user.id)
      flash[:notice] = "Fetching tweets in the background"
    end
    

    redirect_to root_path 
  end
end

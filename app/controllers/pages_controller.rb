class PagesController < ApplicationController
  def index
  end
  
  def fetch
    RecordTweetsJob.perform_later(current_user.id) if current_user

    redirect_to root_path 
  end
end

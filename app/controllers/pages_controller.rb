class PagesController < ApplicationController
  def index
  end
  
  def fetch
    if current_user
      current_user.recent_tweets.each do |tweet|
        activity = Activity.record_tweet(tweet)
      end
    end

    redirect_to root_path 
  end
end

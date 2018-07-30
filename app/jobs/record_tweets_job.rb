class RecordTweetsJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)

    user.recent_tweets.each do |tweet|
      activity = Activity.record_tweet(tweet)
    end
  end
end

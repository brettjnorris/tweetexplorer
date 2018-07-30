class Activity < ApplicationRecord
  def self.record_tweet(tweet)
    status_url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"

    activity = Activity.find_or_initialize_by({ 
      provider: "Twitter",
      object_type: "tweet",
      message_id: tweet.id.to_s,
    })

    return if activity.persisted?

    activity.author_id = tweet.user.id
    activity.author_name = tweet.user.screen_name
    activity.message = tweet.text
    activity.link = status_url
    activity.sent = !tweet.retweet? and !tweet.favorited?
    activity.posted_at = tweet.created_at
    activity.created_at = Time.now

    activity.source_json = tweet.to_h

    activity.save
  end
end

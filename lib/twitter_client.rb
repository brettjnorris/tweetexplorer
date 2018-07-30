class TwitterClient
  @@client ||= Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_KEY"]
    config.consumer_secret     = ENV["TWITTER_SECRET"]
  end

  def self.user_timeline_since(user, date = 30.days.ago)
    options = {count: 50, include_rts: true}
    tweets = []

    loop do
      new_tweets = @@client.user_timeline(user, options)

      options[:max_id] = new_tweets.last.id
      
      tweets += new_tweets.select do |tweet|
        tweet.created_at > date
      end.compact

      break unless tweets.count % options[:count] == 0
    end

    tweets
  end
end
class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet_id)
    tweet = Tweet.find_by_id(tweet_id)

    return "Tweet not found! Exiting the job" if tweet.blank?

    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
# Scheduled Tweets

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 orderedList:0 -->
<!-- /TOC -->

## Issues Resolved outside training episodes


### *500 internal error with tweet profile image*

   When you authorize your Twitter account for the first time and do not have a profile picture, there will be a 500 internal error during redirection. This issue is primarily because the code is running into the issue accessing a profile picture that is nil in the database, please add the following to avoid this error

  ```ruby
    <%-unless @twitter_account&.image.blank?%>
      <%= image_tag twitter_account.image, class: "rounded-circle" %>
    <%else%>
      <%=image_tag "http://placehold.jp/150x150.png", class: "rounded-circle"%>
    <%end%>

  ```

### *Twitter API permissions to get proper auth information & gain access more functions of API*

   When you connect your tweeter account for the first time, you'll face a scenario where email, user name, and all the details in the auth response will be empty & tweeting will fail. This use case is due to Twitter permission issues.

  Assuming that you already created a project & app to gain secrets by default, you'll have Essential permissions on your Twitter developer account, and you'd need to gain elevated permissions. 

  #### Proccess of getting elevated permissions

  1. Firstly, we need to apply for elevated access.
  2. Go here: https://developer.twitter.com/en/portal/products/essential
  3. Explain what your purpose of using Twitter API usage is. You can give a standard explanation that we are using the APIs for Oauth 2.0 authorization purposes, enabling social media features in the platform.
  4. Please continue to answer other questions for most of them which related to Twitter data usage where we say No for most of the questions
  5. Once we reach the end of the steps, accept the agreements & click next. This process should typically get all the permissions
  6. Wait for a couple of minutes, restart your server
  7. Disconnect & connect your Twitter account. This time, you should pull auth information like username, picture, email, e.t.c.

### *Recommended & Efficient way of handling job arguments*

  When we schedule a job from the training videos, we send a tweet object. 

  Essentially, this format is undesirable as the object or arguments will be visible in the sidekiq system. There is a good chance that the objects will change between job creation & execution as per the schedule. Still, the job won't notice object changes as it will operate on its copy. This format may be desired behavior depending on the use case, but passing objects ids is always an excellent approach, giving the latest version. I have modified how the job will be receiving the object information & added additional logic to handle avoiding. 
  ```ruby
  TweetJob.set(wait_until: publish_at).perform_later(id)
  ```
  Modfications in the job:
  ```ruby
  def perform(tweet_id)
    tweet = Tweet.find_by_id(tweet_id)

    return "Tweet not found! Exiting the job" if tweet.blank?

    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
  ```
  ```ruby
  ActiveJob::DeserializationError: Error while trying to deserialize arguments
  ```
  You'll get this error in sidekiq logs if we are passing a tweet object that is not present in the system.
  
### *Addition of sidekiq web for better visibility of jobs execution in the system*

Please visit http://localhost:3000/sidekiq, where you'll find a Sidkiq web interface that shows jobs in the queue. Enabled this additionally

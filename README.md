# Scheduled Tweets

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 orderedList:0 -->
<!-- /TOC -->

## Issues Resolved outside training episodes


### *500 internal error with tweet profile image*

  When you authorise your twitter account for the first time and you do not have profile picture, during redirection, there will be a 500 internal error. This has been resolved. This is primarily because, code is running into the issue accessing a profile picture that is nil in the database

    ```ruby
    <%-unless @twitter_account&.image.blank?%>
      <%= image_tag twitter_account.image, class: "rounded-circle" %>
    <%else%>
      <%=image_tag "http://placehold.jp/150x150.png", class: "rounded-circle"%>
    <%end%>

    ```

### *Twitter API permissions to get proper auth information & gain access more functions of API*

  When you connect your tweeter account for the first time, you'll face a scenario where email, user name and all the details in the auth response will be empty & tweeting will fail. This is due to twitter permission issues

  By default you'll have Essential permissions and you'd need to gain elevated permissions. This is assuming tha that you already created a project & app to gain secrets

    #### Proccess of getting elevated permissions

    1. Firstly, we need to apply for elevated access
    2. Go here: https://developer.twitter.com/en/portal/products/essential
    3. Explain what is your purpose of using twitter API usage. You can give a standard explaination that we are using the API's for Oauth 2.0 authorisation purposes enabling social media features in the platform.
    4. Please continue answer other questions for most of the which related to twitter data usage where we say No for most of the questions
    5. Once we reach end of the steps, accept the agreements & click next. This should typically get all the permissions
    6. Wait for a couple of minutes, restart your server
    7. Disconnect & connect your twitter account, this time, you should be able to pull a auth information like username, picture, email e.t.c.

### *Tweeter Auth call modifications*

  From the training videos, connct to twitter link is writtein this format

  ```ruby
    <%=link_to "Connect your twitter account", '/auth/twitter', class: 'btn btn-primary'%>
  ```

  The above will throw and error as Oauth has the changed this for security reasons. This needs to be updated to the following:

  ```ruby
    <%=button_to "Connect your twitter account", "/auth/twitter", method: :post, class: "btn btn-primary"%>
  ```

  Updated this whereever it is neccessary as we use this button in tweets, twitter accounts page, schedule a tweets page

### *Recommended & Efficient way of handling job arguments*

  From the traning videos, when we are scheduling a job we are sending a tweet object. 

  Essentially, this is considered as bad practice as the object or arguments will be exposed in the sidekiq system and there is a good chance object might have changed in the database but job won't notice it as it will operate on the copy it has. This may be desired behaviour depending on the use-case but passing object id's is a always a good approach to go which gives always the latest version. I have modified the how job will be recieving the object information & added a additional logic to handle avoiding 

  ```ruby
  ActiveJob::DeserializationError: Error while trying to deserialize arguments
  ```
  You'll get this error in sidekiq logs uif we are passing a tweet object that is not present in the system. 
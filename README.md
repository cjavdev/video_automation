# README

This is a project to help automate some steps of the Video Production process.

It was built in public and you can [watch
videos](https://www.youtube.com/playlist?list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95)
about how each piece was built:

- [Data modeling with ActiveRecord for Video Automation tool](https://www.youtube.com/watch?v=n_5z4FDBbqI&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=1)
- [ActionView basics - list and edit custom video descriptions](https://www.youtube.com/watch?v=JispE3mZtXg&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=2)
- [Render custom descriptions with ERB](https://www.youtube.com/watch?v=Br6nk3gFjDE&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=3)
- [YouTube API Authentication with Rails](https://www.youtube.com/watch?v=KDkLQAcsCXg&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=4)
- [List YouTube videos with the Data API and Ruby](https://www.youtube.com/watch?v=hVfyqmN6ILE&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=5)
- [Update Videos with the YouTube API](https://www.youtube.com/watch?v=ae-azSl5-EI&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=6)
- [Tagging videos with the YouTube API](https://www.youtube.com/watch?v=zDx41b54UWs&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=7)
- [Convert SVG to PNG with JavaScript](https://www.youtube.com/watch?v=-oXRpzLyz6Q&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=8)
- [Upload YouTube thumbnail with the YouTube Data API and Rails](https://www.youtube.com/watch?v=r5PIzDmRups&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=9)
- [Adding a Categories feature](https://www.youtube.com/watch?v=WJXLwQGwqDI&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=10)
- [Dynamically render SVG with Rails](https://www.youtube.com/watch?v=Ij7l-yOWaso&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=11)
- [How to deploy a Rails 6 application to Heroku](https://www.youtube.com/watch?v=3wmMtHz2zpY&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=12)
- [Devise authentication with Rails 6](https://www.youtube.com/watch?v=zl6iJLlmUog&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=13)
- [Limit access to data to authorized users Rails 6](https://www.youtube.com/watch?v=LU1g0pTMXhk&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=14)
- [Record a video with JavaScript in a Ruby on Rails app](https://www.youtube.com/watch?v=fqgnOEjakDg&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=15)
- [Upload a video to YouTube with the YouTube Data API](https://www.youtube.com/watch?v=I5EvTSytDIM&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=16)
- [Setting up Background Jobs in Ruby on Rails](https://www.youtube.com/watch?v=5Z21WARO7P8&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=17)
- [Running Rails background jobs on Heroku with Resque and Redis](https://www.youtube.com/watch?v=seC6MnKvbnI&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=18)
- [Refresh YouTube API OAuth Tokens with Ruby](https://www.youtube.com/watch?v=KCsw_eTVpIM&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=19)
- [Take a photo and remove greenscreen with JavaScript](https://www.youtube.com/watch?v=6cwsNpvp6vo&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=20)
- [Add bitmoji sticker to canvas with JavaScript using the bitmoji kit](https://www.youtube.com/watch?v=DQKIcWvXNLk&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=21)
- [Drag image on HTML Canvas with JavaScript](https://www.youtube.com/watch?v=6dpxrBTESvQ&list=PLS6F722u-R6ILDUeteD-A_q6Ja4SH8v95&index=22)


You'll need to setup some credentials to get the integrations working:

```sh
EDITOR=vi rails credentials:edit
```

Then fill in these details.

```yml
youtube:
  client_id: <your-youtube-client-id>
  client_secret: <your-youtube-client-secret>

bitmoji:
  client_id: <your-bitmoji-client-id>

# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: <generate some long random string and put it here>
```

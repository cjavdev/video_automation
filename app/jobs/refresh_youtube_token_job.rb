class RefreshYoutubeTokenJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Let's refresh the token"
  end
end

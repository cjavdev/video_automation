# template = DescriptionTemplate.create(
#   name: 'Test template',
#   template: 'test'
# )
#
# tony = Presenter.create(
#   name: 'Tony Stark',
#   twitter_handle: 'tonystark',
#   linked_in: 'https://linkedin.com/u/tony',
#   role: 'Super hero',
# )
#
# steve = Presenter.create(
#   name: 'Steve',
#   twitter_handle: 'steve',
#   linked_in: 'https://linkedin.com/u/steve',
#   role: 'Minecrafter',
# )
#
# video = Video.create!(
#   youtube_id: 'Y47kSCiQCN0',
#   title: 'Test video',
#   tags: ['a', 'b', 'c'],
#   chapter_markers: '00:00 start',
#   description_template: template,
#   presenters: [tony, steve]
# )

require 'google/api_client/client_secrets'
require 'byebug'

byebug
creds = YoutubeSession.last.credentials
byebug

p 1+1

Signet::OAuth2::Client.new(JSON.parse(creds))
p 1+1

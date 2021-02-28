template_content = <<~XXX
<%= summary %>

### Presenters

<% presenters.each do |presenter| %>
<%= presenter.name %> <%= presenter.role %> <%= presenter.twitter_url %>
<% end %>

<%= '### Table of contents' if !chapter_markers.blank? %>

<%= chapter_markers %>

<%= '### Resources' if video_resources.any? %>

<% video_resources.each do |r| %>
<%= r.title %>: <%= r.url %>
<% end %>
XXX

template = DescriptionTemplate.create!(
  name: 'Default',
  template: template_content
)
cj = Presenter.create!(
  name: 'CJ Avilla',
  twitter_handle: 'cjav_dev',
  linked_in: 'https://www.linkedin.com/in/cjavilla/',
  role: 'Developer Advocate',
)
category = Category.create!(name: "Default")

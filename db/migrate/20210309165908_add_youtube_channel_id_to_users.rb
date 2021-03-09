class AddYoutubeChannelIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :youtube_channel_id, :string, null: true
  end
end

class RemoveSubtitleFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :subtitle
  end
end

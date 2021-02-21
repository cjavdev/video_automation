class AddSubtitleToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :subtitle, :string
  end
end

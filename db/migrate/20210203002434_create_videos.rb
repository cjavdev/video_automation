class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :youtube_id, null: false
      t.string :title, null: false
      t.string :tags, array: true, default: []
      t.text :chapter_markers

      t.timestamps
    end
    add_index :videos, :youtube_id, unique: true
  end
end

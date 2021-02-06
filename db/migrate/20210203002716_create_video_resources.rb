class CreateVideoResources < ActiveRecord::Migration[6.1]
  def change
    create_table :video_resources do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end

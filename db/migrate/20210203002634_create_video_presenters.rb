class CreateVideoPresenters < ActiveRecord::Migration[6.1]
  def change
    create_table :video_presenters do |t|
      t.references :video, null: false, foreign_key: true
      t.references :presenter, null: false, foreign_key: true

      t.timestamps
    end
    add_index :video_presenters, [:video_id, :presenter_id], unique: true
  end
end

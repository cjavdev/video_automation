class AddCategoryIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :category, null: false, foreign_key: true
  end
end

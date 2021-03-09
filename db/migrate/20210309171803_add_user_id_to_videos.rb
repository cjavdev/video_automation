class AddUserIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :user, null: false, foreign_key: true
  end
end

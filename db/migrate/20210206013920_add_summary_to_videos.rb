class AddSummaryToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :summary, :text
  end
end

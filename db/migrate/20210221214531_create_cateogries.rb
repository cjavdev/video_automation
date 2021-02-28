class CreateCateogries < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :title_color, null: false, default: '#F72585'
      t.string :subtitle_color, null: false, default: '#C2F7EB'

      t.timestamps
    end
  end
end

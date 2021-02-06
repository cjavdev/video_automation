class AddNameToDescriptionTemplates < ActiveRecord::Migration[6.1]
  def change
    add_column :description_templates, :name, :string, null: false
  end
end

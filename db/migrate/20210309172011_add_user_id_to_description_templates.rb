class AddUserIdToDescriptionTemplates < ActiveRecord::Migration[6.1]
  def change
    add_reference :description_templates, :user, null: false, foreign_key: true
  end
end

class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.text :description, null: false, default: ""
      t.string :url, null: false

      t.timestamps
    end
  end
end

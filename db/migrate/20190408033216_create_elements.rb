class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :title
      t.text :content
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end

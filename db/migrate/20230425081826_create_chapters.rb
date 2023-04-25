class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :slug, index: { unique: true }
      t.text :content
      t.integer :order
      t.references :story
      t.timestamps
    end
  end
end

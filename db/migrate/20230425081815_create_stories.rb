class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :slug, index: { unique: true }
      t.text :description
      t.string :source
      t.string :status
      t.string :posting_date
      t.string :visibility
      t.references :author
      t.references :category
      t.timestamps
    end
  end
end

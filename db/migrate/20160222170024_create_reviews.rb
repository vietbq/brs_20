class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.string :title
      t.string :content
      t.integer :rate

      t.timestamps null: false
    end
  end
end

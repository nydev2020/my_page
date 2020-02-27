class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment,    null: false
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.integer :good
      t.integer :bad
      t.timestamps
    end
  end
end

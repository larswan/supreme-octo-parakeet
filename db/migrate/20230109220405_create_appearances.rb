class CreateAppearances < ActiveRecord::Migration[6.1]
  def change
    create_table :appearances do |t|
      t.references :episode, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end

class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :content
      t.boolean :checked

      t.timestamps
    end
  end
end

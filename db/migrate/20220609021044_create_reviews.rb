class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id
      t.integer :smartphone_id
      t.string :smartphone_name
      t.integer :manufacturer_name
      t.text :kuchikomi
      t.float :star
      t.float :evaluation
      t.float :holding
      t.float :battery
      t.float :camera
      t.float :response

      t.timestamps
    end
  end
end

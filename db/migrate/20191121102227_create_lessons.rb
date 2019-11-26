class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :total_score

      t.timestamps
    end
  end
end

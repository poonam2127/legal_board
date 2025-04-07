class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.string :category
      t.integer :status
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

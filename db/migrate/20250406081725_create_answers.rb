class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.text :response_text
      t.decimal :proposed_fee
      t.boolean :paid, default: false
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

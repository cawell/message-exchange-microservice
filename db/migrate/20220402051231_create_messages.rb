class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.string :content
      t.string :username
      t.string :color
      t.string :effect
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

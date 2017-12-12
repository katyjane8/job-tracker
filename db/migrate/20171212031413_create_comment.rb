class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :jobs, foreign_key: true

      t.timestamp
    end
  end
end

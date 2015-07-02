class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :instructions
      t.string :query

      t.timestamps null: false
    end
  end
end

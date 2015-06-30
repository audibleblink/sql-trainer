class AddOrderToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :order, :integer
  end
end

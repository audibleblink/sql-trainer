class AddMetadataToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :metadata, :json
  end
end

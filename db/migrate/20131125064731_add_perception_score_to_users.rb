class AddPerceptionScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :perception_score, :integer
  end
end

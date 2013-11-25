class AddScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rc_score, :integer
  end
end

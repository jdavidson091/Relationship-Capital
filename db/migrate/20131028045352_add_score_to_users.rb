class AddScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rc_score, :integer
    add_index  :users, :rc_score
  end
end

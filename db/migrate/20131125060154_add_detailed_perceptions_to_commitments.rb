class AddDetailedPerceptionsToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :perception_active_comment, :string
    add_column :commitments, :perception_active_score, :integer
    add_column :commitments, :perception_supervisor_comment, :string
    add_column :commitments, :perception_supervisor_score, :integer

  end
end

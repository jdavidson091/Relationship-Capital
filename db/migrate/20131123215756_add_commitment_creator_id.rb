class AddCommitmentCreatorId < ActiveRecord::Migration
  def change
    add_column :commitments, :creator_id, :integer
  end
end

class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :active_user_id
      t.integer :overseer_user_id
      t.string :description
      t.datetime :date_made
      t.datetime :date_end
      t.string :status
      t.integer :score_weight

      t.timestamps
    end
  end
end

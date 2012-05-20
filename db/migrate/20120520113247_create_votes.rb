class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count
      t.references :party
      t.references :constituency

      t.timestamps
    end
  end
end

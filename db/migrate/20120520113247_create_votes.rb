class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
		t.boolean :will_vote
		t.references :party
		t.references :constituency

		t.timestamps
    end
  end
end

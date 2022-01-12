class AddConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections, id: :uuid do |t|
      t.references :follower, foreign_key: { to_table: :users }, type: :uuid
      t.references :following, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end

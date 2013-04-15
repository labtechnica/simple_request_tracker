class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_me_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.references :profile
      t.integer :status

      t.timestamps
    end
    add_index :users, :profile_id

    user = User.new(name: 'Simple Tracker', email: 'simpletracker@gmail.com', profile_id: 1, password: 'stadmin', password_confirmation: 'stadmin')
    user.save!
    user.status = :Active
    user.save!
  end
end

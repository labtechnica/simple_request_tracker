class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
    end

    Profile.create(name: 'Administrator')
		Profile.create(name: 'System User')
		Profile.create(name: 'Guest')
  end
end

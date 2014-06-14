class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :refinery_wine_groups_wine_group_item_id
      t.string :award
      t.integer :refinery_member_id
      t.string :final

      t.timestamps
    end
  end
end

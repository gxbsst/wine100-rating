class Award < ActiveRecord::Base
  attr_accessible :award, :final, :refinery_wine_groups_wine_group_item_id, :refinery_member_id
  belongs_to :member, :class_name => 'User', :foreign_key => 'refinery_member_id'
  belongs_to :wine_group_item, :class_name => 'Refinery::WineGroups::WineGroupItem'
end

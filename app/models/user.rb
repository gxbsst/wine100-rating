class User < ::Refinery::Members::Member
  has_many :awards, :class_name => 'Award', :foreign_key => 'refinery_member_id'
  def leader?
    self.role == 'leader'
  end
end
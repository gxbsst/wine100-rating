module Refinery
  module Wines
    class Wine < Refinery::Core::BaseModel
      self.table_name = 'refinery_wines'

      attr_accessible :name_zh, :name_en, :region_en, :region_zh, :vingate, :sugar, :grape_vairety, :description, :position

      acts_as_indexed :fields => [:name_zh, :name_en, :region_en, :region_zh, :vingate, :sugar, :grape_vairety, :description]

      validates :name_zh, :presence => true, :uniqueness => true

      has_one :award, :class_name => '::Award', :foreign_key => 'wine_id'

      def award_value
        return 0 unless self.award
        self.award.award
      end

      def final_award_value
        return 0 unless self.award
        self.award.final || 0
      end

      def name
        "#{vingate} #{name_en}  #{vingate} #{name_zh}"
      end

    end
  end
end

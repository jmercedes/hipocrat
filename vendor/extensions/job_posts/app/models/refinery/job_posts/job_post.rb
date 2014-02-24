module Refinery
  module JobPosts
    class JobPost < Refinery::Core::BaseModel
      self.table_name = 'refinery_job_posts'

      attr_accessible :position, :description, :opening_date, :closing_date, :position

      validates :position, :presence => true, :uniqueness => true
    end
  end
end

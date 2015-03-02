class Request < ActiveRecord::Base
  attr_accessible :course_id, :schedule_id, :state_id
  belongs_to :schedule
  belongs_to :state
  belongs_to :course
end

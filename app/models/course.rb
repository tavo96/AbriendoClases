class Course < ActiveRecord::Base
attr_accessible :name, :requirements, :recommended_requirements
end

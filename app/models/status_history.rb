class StatusHistory < ActiveRecord::Base

  validates_presence_of :status_id, :task_id
end

class StatusHistory < ActiveRecord::Base
  attr_accessible :status_id, :task_id

  validates_presence_of :status_id, :task_id
end

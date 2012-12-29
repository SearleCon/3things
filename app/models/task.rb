class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :status

  before_validation :set_default_status, :on => :create
  before_update :make_history

  attr_accessible  :description, :title, :status_id, :user_id
  validates_presence_of :status_id, :description, :title, :user_id

  private
  def set_default_status
    self.status = Status.find_by_name(:Todo)
  end

  def make_history
    StatusHistory.create(:status_id => self.status_id_was, :task_id => self)  if self.status_id_changed?
  end

end

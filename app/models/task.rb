class Task < ActiveRecord::Base

  lookup :status

  belongs_to :user, :touch => true
  belongs_to :status, :touch => true

  before_validation :set_default_status, :on => :create
  before_update :make_history
  after_destroy :clear_history

  validates_presence_of :status_id, :description, :title, :user_id


  private
  def set_default_status
    self.status = Status.where(:name => :Todo).first
  end

  def make_history
    StatusHistory.create(:status_id => self.status_id_was, :task_id => self.id)  if self.status_id_changed?
  end

  def clear_history
    StatusHistory.destroy_all(:task_id => self.id )
  end

end

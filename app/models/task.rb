class Task < ActiveRecord::Base

  lookup :status

  belongs_to :user, :touch => true

  before_validation :set_default_status, :on => :create
  before_save :format_attributes
  before_update :make_history
  after_destroy :clear_history

  validates_presence_of :status_id, :description, :title, :user_id


  private
  def format_attributes
    self.title = self.title.to_s.titleize
    self.description.capitalize!
  end

  def set_default_status
    self.status = Status.where(:name => :Todo).first unless self.status
  end

  def make_history
    StatusHistory.create(:status_id => self.status_id_was, :task_id => self.id)  if self.status_id_changed?
  end

  def clear_history
    StatusHistory.destroy_all(:task_id => self.id )
  end

end

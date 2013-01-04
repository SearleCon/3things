
class Task < ActiveRecord::Base
  #include LookUp

  #def self.lookup(name)
  #  name.to_s.camelize.constantize.all.each do |record|
  #    singleton_class.send :define_method, record.name.downcase.pluralize do
  #      field = name.to_s.downcase.concat('_id')
  #      where(field.to_sym => record.id )
  #    end
  #  end
  #end

  lookup :status

  belongs_to :user, :touch => true
  belongs_to :status, :touch => true

  before_validation :set_default_status, :on => :create
  before_update :make_history

  #attr_accessible  :description, :title, :status_id, :user_id
  validates_presence_of :status_id, :description, :title, :user_id

  ###add scopes for the different statuses
  #def self.singleton_class
  #  class << self
  #    self
  #  end
  #end
  #
  #Status.all.each do |status|
  # singleton_class.send :define_method, status.name.downcase.pluralize do
  #   where(:status_id => status.id)
  # end
  #
  # define_method "#{status.name.downcase.to_s}?" do
  #   status_id == status.id
  # end
  #end

  private
  def set_default_status
    self.status = Status.find_by_name(:Todo)
  end

  def make_history
    StatusHistory.create!(:status_id => self.status_id_was, :task_id => self.id)  if self.status_id_changed?
  end

end

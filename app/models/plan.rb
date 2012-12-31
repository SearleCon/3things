class Plan < ActiveRecord::Base
  has_many :subscriptions

  default_scope where(:active => true)

  validates :duration, :name, :price, :presence => true
  validates :active, :is_free, :inclusion => {:in => [true, false]}
  validates_numericality_of :price, :duration

end
# == Schema Information
#
# Table name: plans
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  duration   :integer
#  price      :decimal(, )
#  active     :boolean
#  is_free    :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


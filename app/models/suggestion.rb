class Suggestion < ActiveRecord::Base
  attr_accessible :subject, :suggestion

  validates_presence_of :subject, :suggestion

end
# == Schema Information
#
# Table name: suggestions
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  suggestion :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


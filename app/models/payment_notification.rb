class PaymentNotification < ActiveRecord::Base
  serialize :params

  attr_accessible :params, :status, :transaction_id, :user_id
end
# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer         not null, primary key
#  params         :text
#  user_id        :integer
#  transaction_id :integer
#  status         :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#


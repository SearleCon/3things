require 'spec_helper'

describe Plan do

 it "has a valid factory" do
   FactoryGirl.create(:plan).should be_valid
 end

 it 'is invalid without a name' do
   FactoryGirl.build(:plan, name: nil).should_not be_valid
 end

 it 'is invalid without a duration' do
   FactoryGirl.build(:plan, duration: nil).should_not be_valid
 end

 it 'is invalid without a price' do
   FactoryGirl.build(:plan, price: nil).should_not be_valid
 end

 it 'is invalid without an active_flag' do
   FactoryGirl.build(:plan, active: nil).should_not be_valid
 end

 it 'is invalid without an is_free_flag' do
   FactoryGirl.build(:plan, is_free: nil).should_not be_valid
 end

 it 'is invalid if price is not a number' do
   FactoryGirl.build(:plan, price: 'test').should_not be_valid
 end

 it 'is invalid if duration is not a number' do
   FactoryGirl.build(:plan, price: 'test').should_not be_valid
 end


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


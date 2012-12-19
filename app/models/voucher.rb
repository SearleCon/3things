class Voucher < ActiveRecord::Base

  attr_accessible :redeemed_by
  attr_readonly :unique_code, :valid_until, :number_of_days
  attr_accessor :prefix, :suffix, :validity_period, :free_days


  before_create :generate_unique_code, :set_valid_until, :set_free_days


  def self.redeem(voucher_code, user_id)
   voucher = self.find_by_unique_code(voucher_code)
   voucher.redeemed_by = user_id
   voucher.save
  end

  def self.redeemable?(voucher_code)
   Voucher.exists?(unique_code: voucher_code)
  end

  private
  def generate_unique_code
   code = SecureRandom.hex 4
   code.prepend(self.prefix)
   code.concat(self.suffix)
   self.unique_code = code
  end

  def set_valid_until
    self.valid_until=Time.now + self.validity_period.months
  end

  def set_free_days
    self.number_of_days = self.free_days
  end

end

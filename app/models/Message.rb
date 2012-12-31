class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates :name, :email, :subject, :body, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true

  def initialize(args={})
    args.each_pair do |n,v|
      self.send("#{n}=",v)
    end
  end

  def persisted?
    false
  end

end

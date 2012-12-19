RSpec.configure do |config|
  config.before do
    # disable all the observers
    ActiveRecord::Base.observers.disable :all

    # find out which observers this spec needs
    observers = example.metadata[:observer] || example.metadata[:observers]

    # turn on observers as needed
    if observers
      ActiveRecord::Base.observers.enable *observers
    end
  end
end
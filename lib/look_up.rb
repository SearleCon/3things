module LookUp
  extend ActiveSupport::Concern

  module ClassMethods
    def lookup(name)
      name.to_s.camelize.constantize.all.each do |record|
        define_singleton_method record.name.downcase.pluralize do
          field = name.to_s.downcase.concat('_id')
          where(field.to_sym => record.id )
        end
        define_method "#{record.name.downcase}?" do
          send(name.to_s.downcase.concat('_id')) == record.id
        end
      end
    end
  end



end
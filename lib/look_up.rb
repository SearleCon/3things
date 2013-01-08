module LookUp
  extend ActiveSupport::Concern



  module ClassMethods
    def lookup(table)

      model = table.to_s.camelize.constantize
      foreign_key = table.to_s.downcase.concat('_id')

      # getter
      define_method table.to_s do
        model.find(read_attribute(foreign_key.to_sym))
      end

      # setter that accepts :value, 'value' or Value object
      define_method "#{table.to_s}=" do |value|
        id = value.is_a?(model) ? value.id : model.find_by_name(value.to_s).id
        write_attribute(foreign_key, id)
      end

      # returns collection of lookup values as an array eg. ['pending', 'active', 'archived']
      define_singleton_method table.to_s.downcase.pluralize do
        unless @values.try(:count) == model.count
         @values = model.all.collect(&:name)
        end
        @values
      end


      model.all.each do |record|
        # returns collection of each lookup object eg Model.todos
        define_singleton_method record.name.downcase.pluralize do
          where(foreign_key.to_sym => record.id )
        end
        # adds boolean methods to check whether an object is of lookup type eg. @instance.pending?
        define_method "#{record.name.downcase}?" do
          send(foreign_key.to_sym) == record.id
        end
      end
    end
  end

end
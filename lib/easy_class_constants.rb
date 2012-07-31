require "easy_class_constants/version"

module EasyClassConstants
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
  
  module ClassMethods
    def readable_constant(name, value)
      name = name.to_s.upcase
      self.send(:class_variable_set, "@@#{name}", value)
      self.send(:cattr_reader, name)
    end

    def writable_constant(name, value)
      name = name.to_s.upcase
      self.send(:class_variable_set, "@@#{name}", value)
      self.send(:cattr_writer, name)
    end

    def accessible_constant(name, value)
      name = name.to_s.upcase
      self.send(:class_variable_set, "@@#{name}", value)
      self.send(:cattr_accessor, name)
    end

    def hash_indexed_by_readable_constants(hash_variable_name, hash_contents)
      hash_variable_name = hash_variable_name.to_s.upcase
      self.send(:class_variable_set, "@@#{hash_variable_name}", ActiveSupport::OrderedHash.new)
      self.send(:cattr_reader, hash_variable_name)
      hash_contents.each do |*args|
        args.flatten!
        constant_name = args[0].to_s.upcase

        if args.size > 2
          hash_index = args[1]
          hash_value = args[2]
          variable_value = hash_index
        else
          hash_index = args[0]
          hash_value = args[1]
          variable_value = hash_value
        end


        puts "WARNING: in .hash_indexed_by_readable_constants. Constant is already defined: #{constant_name}" if (self.send(:class_variable_get, "@@#{constant_name}").present? rescue false)
        self.send(:class_variable_set, "@@#{constant_name}", variable_value)
        self.send(:class_variable_get, "@@#{hash_variable_name}")[hash_index] = hash_value
        self.send(:cattr_reader, constant_name)
      end
    end
  end
end
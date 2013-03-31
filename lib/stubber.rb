class Object
  def self.instance_stub(method, result, &block)
    # Store the existing method
    new_name = "_custom_stubbed_#{method}"
    alias_method new_name, method

    define_method method do |*args|
      result
    end

    if block
      yield
      # Restore the old method outside of the block
      alias_method method, new_name
    end
  end

  def instance_stub(method_name, result, &block)
    old_method = method(method_name)
    #new_name = "_custom_stubbed_#{method}"
    define_singleton_method method_name do |*args|
      result
    end
    if block
      yield
      define_singleton_method method_name, old_method
    end
  end
end

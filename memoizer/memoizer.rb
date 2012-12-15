module Memoizer
  def memoize(method_name)
    alias_method "original_#{method_name}", method_name
    cache ||= {}
    cache[method_name] ||= {}
    define_method(method_name) do |*args|
      if cache[method_name].has_key?(args)
        cache[method_name][args]
      else
        cache[method_name][args] = self.send("original_#{method_name}", *args)
      end
    end
  end
end
# Required for Ruby < 2.4
if !{}.respond_to? :transform_values
  class Hash
    def transform_values
      self.each { |k, v| self[k] = yield v }
    end
  end
end

# Required for Ruby < 2.5
if !{}.respond_to? :transform_keys
  class Hash
    def transform_keys
      self.map { |k, v| [(yield k), v] }.to_h
    end
  end
end
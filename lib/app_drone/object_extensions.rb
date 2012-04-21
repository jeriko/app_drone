class Class
  def descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

class String
  def blank?
    self == ''
  end
end

class Symbol
  def to_app_drone_class
    ('AppDrone::' + self.to_s.classify).constantize
  end
end

class Integer
  def seconds
    self
  end
  alias_method :second, :seconds

  def minutes
    60 * seconds
  end
  alias_method :minute, :minutes

  def hours
    60 * minutes
  end
  alias_method :hour, :hours

  def days
    24 * hours
  end
  alias_method :day, :days
end
class Integer
  def seconds
    self
  end
  alias second seconds

  def minutes
    60 * seconds
  end
  alias minute minutes

  def hours
    60 * minutes
  end
  alias hour hours

  def days
    24 * hours
  end
  alias day days
end

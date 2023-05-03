require 'json'

class Storage
  def fetch
    raise NotImplementedError
  end

  def store(_item)
    raise NotImplementedError
  end

  def serialize(_item)
    raise NotImplementedError
  end

  def deserialize(_item)
    raise NotImplementedError
  end
end
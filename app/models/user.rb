class User < ActiveRecord::Base
  def to_param
    self.internet_id
  end
end

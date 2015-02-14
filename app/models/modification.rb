class Modification < ActiveRecord::Base
  def initialize(args=nil)
    raise "Cannot directly instantiate an AbstractUser" if self.class == Modification
    super
  end
end

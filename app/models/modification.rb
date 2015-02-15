class Modification < ActiveRecord::Base
  belongs_to :vehicle

  validates :vehicles, presence: true

  def initialize(args=nil)
    raise "Cannot directly instantiate an AbstractUser" if self.class == Modification
    super
  end
end

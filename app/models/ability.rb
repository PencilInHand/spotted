class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    add_image_abilities
    add_modification_abilities
    add_time_card_abilities
    add_user_abilities
    add_vehicle_abilities
  end

  private

  # TODO(millidavids): actually figure out the abilities that others will have
  def add_image_abilities
  end

  def add_modification_abilities
  end

  def add_time_card_abilities
  end

  def add_user_abilities
  end

  def add_vehicle_abilities
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    add_image_abilities
    add_modification_abilities
    add_time_card_abilities
    add_user_abilities
    add_vehicle_abilities
  end

  private

  # TODO(millidavids): actually figure out the abilities that others will have
  def add_image_abilities
    can :crud, Image, Image.belonging_to_user(@user.id) do |image|
      image.user.id == @user.id
    end
    can :read, Image
  end

  def add_modification_abilities
    can :crud, Modification, Modification.belonging_to_user(@user.id) do |modification|
      modification.user.id == @user.id
    end
    can :read, Modification
  end

  def add_time_card_abilities
    can :crud, TimeCard, TimeCard.belonging_to_user(@user.id) do |time_card|
      time_card.user.id == @user.id
    end
    can :read, TimeCard
  end

  def add_user_abilities
    can :crud, User, id: @user.id
    can :read, User
  end

  def add_vehicle_abilities
    can :crud, Vehicle, Vehicle.belonging_to_user(@user.id) do |vehicle|
      vehicle.user_id == @user.id
    end
    can :read, Vehicle
  end
end

require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }

  describe 'image' do
    context 'when the image belongs to the user' do
      let(:vehicle) { create(:vehicle, user: user) }
      let(:image) { create(:image, vehicle: vehicle) }
      describe 'create' do
        subject { ability.can?(:create, build(:image, {vehicle: vehicle})) }
      end
      describe 'read' do
      end
      describe 'update' do
      end
      describe 'destroy' do
      end
    end
    context 'when the image does not belong to the user' do
    end
  end
end
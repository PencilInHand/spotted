require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }

  describe 'image' do
    context 'when the image belongs to the user' do
      let(:vehicle) { create(:vehicle, user: user) }
      let(:image) { create(:image, vehicle: vehicle) }

      describe 'create' do
        subject { ability.can?(:create, build(:image, vehicle: vehicle)) }
        it { is_expected.to eq(true) }
      end

      describe 'read' do
        subject { ability.can?(:read, image) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, image) }
        it { is_expected.to eq(true) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, image) }
        it { is_expected.to eq(true) }
      end
    end

    context 'when the image does not belong to the user' do
      let(:vehicle) { create(:vehicle) }
      let(:image) { create(:image, vehicle: vehicle) }

      describe 'create' do
        subject { ability.can?(:create, build(:image, vehicle: vehicle)) }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, image) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, image) }
        it { is_expected.to eq(false) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, image) }
        it { is_expected.to eq(false) }
      end
    end
  end

  describe 'time_card' do
    context 'when the time_card belongs to the user' do
      let(:vehicle) { create(:vehicle, user: user) }
      let(:time_card) { create(:time_card, vehicle: vehicle) }

      describe 'create' do
        subject { ability.can?(:create, build(:time_card, vehicle: vehicle)) }
        it { is_expected.to eq(true) }
      end

      describe 'read' do
        subject { ability.can?(:read, time_card) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, time_card) }
        it { is_expected.to eq(true) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, time_card) }
        it { is_expected.to eq(true) }
      end
    end

    context 'when the time_card does not belong to the user' do
      let(:vehicle) { create(:vehicle) }
      let(:time_card) { create(:time_card, vehicle: vehicle) }

      describe 'create' do
        subject { ability.can?(:create, build(:time_card, vehicle: vehicle)) }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, time_card) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, time_card) }
        it { is_expected.to eq(false) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, time_card) }
        it { is_expected.to eq(false) }
      end
    end
  end

  describe 'aesthetic_modification' do
    context 'when the aesthetic_modification belongs to the user' do
      let(:vehicle) { create(:vehicle, user: user) }
      let(:aesthetic_modification) { create(:aesthetic_modification, vehicle: vehicle) }

      describe 'create' do
        subject { ability.can?(:create, build(:aesthetic_modification, vehicle: vehicle)) }
        it { is_expected.to eq(true) }
      end

      describe 'read' do
        subject { ability.can?(:read, aesthetic_modification) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, aesthetic_modification) }
        it { is_expected.to eq(true) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, aesthetic_modification) }
        it { is_expected.to eq(true) }
      end
    end

    context 'when the aesthetic_modification does not belong to the user' do
      let(:vehicle) { create(:vehicle) }
      let(:aesthetic_modification) { create(:aesthetic_modification, vehicle: vehicle) }

      describe 'create' do
        subject { 
          ability.can?(:create, build(:aesthetic_modification, vehicle: vehicle)) 
        }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, aesthetic_modification) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, aesthetic_modification) }
        it { is_expected.to eq(false) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, aesthetic_modification) }
        it { is_expected.to eq(false) }
      end
    end
  end

  describe 'performance_modification' do
    context 'when the performance_modification belongs to the user' do
      let(:vehicle) { create(:vehicle, user: user) }
      let(:performance_modification) { 
        create(:performance_modification, vehicle: vehicle) 
      }

      describe 'create' do
        subject { 
          ability.can?(:create, build(:performance_modification, vehicle: vehicle)) 
        }
        it { is_expected.to eq(true) }
      end

      describe 'read' do
        subject { ability.can?(:read, performance_modification) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, performance_modification) }
        it { is_expected.to eq(true) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, performance_modification) }
        it { is_expected.to eq(true) }
      end
    end

    context 'when the performance_modification does not belong to the user' do
      let(:vehicle) { create(:vehicle) }
      let(:performance_modification) { 
        create(:performance_modification, vehicle: vehicle) 
      }

      describe 'create' do
        subject { 
          ability.can?(:create, build(:performance_modification, vehicle: vehicle)) 
        }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, performance_modification) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, performance_modification) }
        it { is_expected.to eq(false) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, performance_modification) }
        it { is_expected.to eq(false) }
      end
    end
  end

  describe 'vehicle' do
    context 'when the vehicle belongs to the user' do
      let(:vehicle) { create(:vehicle, user: user) }

      describe 'create' do
        subject { ability.can?(:create, build(:vehicle, user: user)) }
        it { is_expected.to eq(true) }
      end

      describe 'read' do
        subject { ability.can?(:read, vehicle) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, vehicle) }
        it { is_expected.to eq(true) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, vehicle) }
        it { is_expected.to eq(true) }
      end
    end

    context 'when the vehicle does not belong to the user' do
      let(:vehicle) { create(:vehicle) }

      describe 'create' do
        subject { ability.can?(:create, build(:vehicle)) }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, vehicle) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, vehicle) }
        it { is_expected.to eq(false) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, vehicle) }
        it { is_expected.to eq(false) }
      end
    end
  end

  describe 'user' do
    context 'when the user is him/herself' do
      describe 'create' do
        subject { ability.can?(:create, build(:user)) }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, user) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, user) }
        it { is_expected.to eq(true) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, user) }
        it { is_expected.to eq(true) }
      end
    end

    context 'when the user is not him/herself' do
      let(:user2) { create(:user) }

      describe 'create' do
        subject { ability.can?(:create, build(:user)) }
        it { is_expected.to eq(false) }
      end

      describe 'read' do
        subject { ability.can?(:read, user2) }
        it { is_expected.to eq(true) }
      end

      describe 'update' do
        subject { ability.can?(:update, user2) }
        it { is_expected.to eq(false) }
      end

      describe 'destroy' do
        subject { ability.can?(:destroy, user2) }
        it { is_expected.to eq(false) }
      end
    end
  end
end
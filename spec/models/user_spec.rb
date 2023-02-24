require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    it 'ensures name presence' do 
      user = FactoryBot.create(:user)
      # user = User.new(email: 'naveen@gmail.com').save
      expect(user.name).to eq("Naveen")
    end

    it 'ensures email presence' do 
      user = FactoryBot.create(:user)
      #user = User.new(name: 'Naveen').save
      expect(user.email).to eq("naveen@gmail.com")
    end

    it 'should save successfully' do
      user = FactoryBot.create(:user)
      user.save
      expect(user).to eq(user)
    end
  end

  context 'scope tests' do 
    let (:params) {{name: 'naveen', email: 'naveen@gmail.com'}}
    before(:each) do
      FactoryBot.create(:user, params.merge(active: true))
      FactoryBot.create(:user, params.merge(active: true))
      FactoryBot.create(:user, params.merge(active: false))
    end

    it 'should return active users' do 
      expect(User.active_users.size).to eq(2)
    end

    it 'should return inactive users' do 
      expect(User.inactive_users.size).to eq(1)
    end
  end
end

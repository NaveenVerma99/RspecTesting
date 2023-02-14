require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    it 'ensures name presence' do 
      user = User.new(email: 'naveen@gmail.com').save
      expect(user).to eq(false)

    end

    it 'ensures email presence' do 
      user = User.new(name: 'Naveen').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'Naveen', email: 'naveen@gmail.com').save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do 
    let (:params) {{name: 'naveen', email: 'naveen@gmail.com'}}
    before(:each) do
      User.new(params.merge(active: true)).save
      User.new(params.merge(active: true)).save
      User.new(params.merge(active: false)).save 
    end

    it 'should return active users' do 
      expect(User.active_users.size).to eq(2)
    end

    it 'should return inactive users' do 
      expect(User.inactive_users.size).to eq(1)
    end
  end
end

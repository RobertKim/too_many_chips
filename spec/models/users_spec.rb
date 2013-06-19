require 'spec_helper'
describe User do 
  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }

  it { should have_many(:events).class_name("Event")}

  it { should ensure_length_of(:name).is_at_least(2).with_short_message(/must have at least 2 letters/)}
  it { should validate_uniqueness_of(:email) }
  it { should ensure_length_of(:password).is_at_least(6).with_short_message(/must have at least 6 characters/)}

  describe 'self.from_omniauth(auth)' do
    it "should..." do
    end
  end

  describe "registration_emails!" do
    it "should...." do
    end
  end

  describe "send_email"  do
    it "should...." do
    end
  end

end

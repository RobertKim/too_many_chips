require_relative "../spec_helper"


describe AssignedItem do

  let(:assigned_item)  { build(:assigned_item) }
  let(:assigned_item3) { build(:assigned_item, quantity_provided: 3) }
  let(:event_item)     { create(:event_item) }

  it { should belong_to :event_item }

  it { should allow_mass_assignment_of :guest_name }
  it { should allow_mass_assignment_of :guest_email }
  it { should allow_mass_assignment_of :quantity_provided }
  it { should allow_mass_assignment_of :url }
  it { should allow_mass_assignment_of :event_item_id }

  it { should validate_numericality_of :quantity_provided}
  it { should_not allow_value(-1).for :quantity_provided }
  it { should_not allow_value("string").for :quantity_provided }
  it { should validate_presence_of :quantity_provided }

  it { should_not allow_value("wrong").for :guest_email }

  it "should cause an event_item's quant needed to change after it saves" do
    quant_before = event_item.quantity_needed
    assert assigned_item.save
    event_item.quantity_still_needed.should == 0
  end

  describe "find_all_user_items" do
    assigned_item.find_all_user_items.should == 2
  end

end

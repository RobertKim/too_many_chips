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

  it "should update its events quantity needed after save" do
    quant_before = event_item.quantity_needed
    assert assigned_item.save
    event_item.quantity_needed.should < quant_before
  end

end

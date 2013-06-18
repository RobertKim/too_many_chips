require_relative "../spec_helper"


describe EventItem do
  let(:event_item) { build.(:event_item, quantity_needed: 4) }
  let(:assigned_item1) { build.(:assigned_item, quantity_provided: 5) }
  let(:assigned_itemString) { build.(:assigned_item. quantity_provided: "132") }

  it { should allow_mass_assignment_of :event_id }
  it { should allow_mass_assignment_of :description }
  it { should allow_mass_assignment_of :item_id }
  it { should allow_mass_assignment_of :quantity_needed }

  it { should ensure_length_of(:description).is_at_most(140)}

  it { should validate_presence_of :quantity_needed }
  it { should_not allow_value(  nil).for :quantity_needed }
  it { should validate_numericality_of :quantity_needed }

  it { should belong_to :event }
  it { should belong_to :item }
  it { should have_many :assigned_items }

  describe "needed?" do
    it "should true if quantity_needed is > 0"
  end

  describe "validate_quantity" do
    it "should should update quantity_needed to 0 if the current QN is < 0"

    it "should not update quantity_needed if the current QN is >= 0"
  end

  describe "update_quant_needed" do
    it "should take in only positive integers"
    it "should update quantity_needed with the difference between current quant and quantity." do
      event_item.assigned_items << assigned_item1
      event_item.update_quant_needed(5)
      event_item.quantity_needed.should == 0
    end
  end
end

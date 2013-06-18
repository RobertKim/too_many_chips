require_relative "../spec_helper"


describe EventItem do
  let(:event_item)            { build(:event_item, quantity_needed: 4) }
  let(:assigned_item)         { build(:assigned_item) }
  let(:assigned_item1)        { build(:assigned_item, quantity_provided: 2) }
  let(:assigned_item2)        { build(:assigned_item, quantity_provided: 5) }


  it { should allow_mass_assignment_of :event_id }
  it { should allow_mass_assignment_of :description }
  it { should allow_mass_assignment_of :item_id }
  it { should allow_mass_assignment_of :quantity_needed }

  it { should ensure_length_of(:description).is_at_most(140)}

  it { should validate_presence_of :quantity_needed }
  it { should_not allow_value(nil).for :quantity_needed }
  it { should_not allow_value("four").for :quantity_needed }
  it { should validate_numericality_of :quantity_needed }

  it { should belong_to :event }
  it { should belong_to :item }
  it { should have_many :assigned_items }

  describe "needed?" do
    it "should true if quantity_needed is > 0" do
      event_item.needed?.should == true
    end
    it "should return false if quantity_needed < 1" do
      event_item.quantity_needed = 0
      event_item.needed?.should == false
    end
  end

  describe "quantity_assigned" do
    before(:each) do
      event_item.assigned_items << assigned_item
      event_item.assigned_items << assigned_item1
      event_item.assigned_items << assigned_item2
    end

    it "should find all assigned items" do
      event_item.assigned_items.length.should == 3
    end
    it "should return the sum of quantity_provided by all assigned_items" do
      event_item.quantity_assigned.should == 9
    end
  end

  describe "quantity_still_needed" do
    it "should return the difference between quantity_needed and quantity_assigned" do
      event_item.quantity_still_needed.should == (event_item.quantity_needed - event_item.quantity_assigned)
    end
  end
end

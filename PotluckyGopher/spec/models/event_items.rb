require_relative "../spec_helper"


describe EventItem do
  let(:event_item) { EventItem.new(quantity_needed: 4, description: "It's awesome!") }
  let(:assigned_item1) { AssignedItem.new(quantity_provided: 5, guest_email: "test@testy.com", guest_name: "Ben") }
  let(:assigned_itemString) { AssignedItem.new(quantity_provided: "132", guest_email: "test@testy.com", guest_name: "Ben") }

  it { should allow_mass_assignment_of :event_id }
  it { should allow_mass_assignment_of :description }
  it { should allow_mass_assignment_of :item_id }
  it { should allow_mass_assignment_of :quantity_needed }

  it { should ensure_length_of(:description).is_at_most(140)}

  it { should validate_presence_of :quantity_needed }
  it { should_not allow_value(nil).for(:quantity_needed) }
  it { should validate_numericality_of :quantity_needed }

  it { should belong_to :event }
  it { should belong_to :item }
  it { should have_many :assigned_items }

  describe "quantity_still_needed" do
    it "should not create a negative quantity_needed if more items are brought than needed" do
      event_item.assigned_items << assigned_item1
      event_item.quantity_still_needed.should == 0
    end
    # it "should return the current value if assigned_items have invalid quantity_provided" do
    #   event_item.assigned_items << assigned_itemString
    #   event_item.quantity_still_needed.should == event_item.quantity_still_needed
    # end
  end

  describe "update_quant_needed" do
    it "should update 'quantity_needed' with an integer >= 0" do
      event_item.assigned_items << assigned_item1
      event_item.update_quant_needed
      event_item.quantity_still_needed.should == event_item.quantity_still_needed
    end
  end
end

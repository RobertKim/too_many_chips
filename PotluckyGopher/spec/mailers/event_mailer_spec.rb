require "spec_helper"

describe EventMailer do
  describe "new_user" do
    let(:mail) { EventMailer.new_user }

    it "renders the headers" do
      mail.subject.should eq("New user")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "new_event" do
    let(:mail) { EventMailer.new_event }

    it "renders the headers" do
      mail.subject.should eq("New event")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "guest_invite" do
    let(:mail) { EventMailer.guest_invite }

    it "renders the headers" do
      mail.subject.should eq("Guest invite")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end

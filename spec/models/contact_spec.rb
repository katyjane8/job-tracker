require 'rails_helper'
# contact = Contact.new(name: "Katy", position: "CTO",
# email: "katy@pivitol.com", company: company)

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without full name" do
        contact = Contact.new(position: "CTO",
        email: "katy@gamergame.com")

        expect(contact).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "belongs to company" do
      contact = Contact.new(name: "Katy", position: "CTO",
      email: "katy@pivitol.com")
      expect(contact).to respond_to(:company)
    end
  end
end

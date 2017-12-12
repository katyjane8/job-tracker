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

      it "is invalid without a position" do
        contact = Contact.new(name: "Katy", email: "katy@pivitol.com")
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(name: "Katy", position: "CTO")
        expect(contact).to be_invalid
      end

      context "valid attributes" do
        it "is valid with a name, position, and email" do
          company = Company.new(name: "Pivitol Labs")
          contact = Contact.create!(name: "Katy", position: "CTO",
          email: "katy@pivitol.com", company: company)
          expect(contact).to be_valid
        end
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

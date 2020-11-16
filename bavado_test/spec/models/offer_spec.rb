require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe ".match_offers" do
    let(:company) { create(:company, name: "Quicko inv") }
    let(:company_1) { create(:company, name: "Quicko lanze") }
    let(:offer_1) { create(:offer, company: company) }
    let(:offer_2) {nil}
    let(:department_1) { create(:department, name: "dept_1")}
    let(:department_2) { create(:department, name: "dept_2")}
    let(:department_3) { create(:department, name: "dept_3")}
    let(:offer_department_1) { create(:offer_department, department: department_1, offer: offer)}

    let(:offer_department_2) { create(:offer_department, department: department_2, offer: offer)}
    let(:offer_department_3) { create(:offer_department, department: department_3, offer: offer)}
    let(:user) { create(:user, company: company)}
    let(:user_1) { create(:user, company: company_1)}

    before do
      company.reload
      company_1.reload
      user.reload
      offer_1.reload
    end

    context "perfect match" do
      it "should return a perfect match" do
        expect(Offer.match_offers(user.id, [department_1.id, department_2.id], "Quicko", "asc")).to eq([offer_1])
      end
    end

    context "match multiple" do
      let(:offer_2) { create(:offer, :with_departments, company: company) }
      before do
        offer_2.reload
      end

      it "should return a perfect match and good match" do
        expect(Offer.match_offers([user.id], [department_1.id, department_2.id], "Quicko", "asc")).to eq([offer_1, offer_2])
      end
    end

    context "match multiple for multple users" do
      let(:offer_2) { create(:offer, :with_departments, company: company_1) }
      before do
        offer_2.reload
      end

      it "should return a perfect match and good match" do
        expect(Offer.match_offers([user.id, user_1.id], [department_1.id, department_2.id], "Quicko", "asc")).to eq([offer_1, offer_2])
      end

      it "should return a perfect match and good match in correct order" do
        expect(Offer.match_offers([user.id, user_1.id], [department_1.id, department_2.id], "Quicko", "asc")).not_to eq([offer_2, offer_1])
      end
    end
  end
end

RSpec.describe Lead, type: :model  do 
  context "Verifies information on the leads" do 
    let (:lead){
      Lead.new(
      full_name_of_contact: "Gerald",
      company_name: "business",
      email: 1,
      phone: "2133311",
      project_name: "",
      project_description: "",
      department_in_charge_of_elevators: ""
      )
    }
    it " gets full name of contact" do 
      lead.full_name_of_contact = "Gerald"  
      expect(lead.full_name_of_contact).to  eq "Gerald"
    end
    it " grabs the customer" do 
      lead.company_name = "business"  
      expect(lead.company_name).to  eq "business"
    end
    it "verifies the first name of contact starts with an J" do
    lead = Lead.new
    expect(lead.letter).to eq ["j"]
    end
  end
end
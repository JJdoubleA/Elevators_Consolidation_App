require './app/models/elevator.rb'


RSpec.describe Elevator, type: :model  do 
    context "Verifying that elevator attribute match" do 
         
            let (:elevator){
              Elevator.new(
              model: "hybrid",
              status: "business",
              
              )
            }
    it " grabs the model of the elevator" do
    elevator.model = "hybrid"
    expect(elevator.model).to eq "hybrid"
    end
  
    it " grabs the status of the elevator" do
        elevator.status = "business"
        expect(elevator.status).to eq "business"
    end
end
end 

require './spec/rails_helper.rb'
require './lib/firstletter.rb'

RSpec.describe Firstletter, '#name' do
      context "Find customers in our database faster" do 
        it "finds the contacts whose first name starts with an F" do
        
        firstletter = Firstletter.new
        1.times{firstletter.letter}
        expect(firstletter.letter).to eq ['j']
    end
  end
end


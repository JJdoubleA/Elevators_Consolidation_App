require './spec/rails_helper.rb'
require './lib/elevatormedia.rb'

    RSpec.describe Elevatormedia, '#installation' do
      context "when someone requires the pricing" do
        it "adds the prices of the installation fees" do

        elevatormedia = Elevatormedia.new
        
        20.times {elevatormedia.price(elevatormedia.total)}
        expect(elevatormedia.installation).to eq 241735
        
    end
  end
end
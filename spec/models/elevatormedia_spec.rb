require './lib/elevatormedia/streamer.rb'
require './spec/rails_helper.rb'

  RSpec.describe Elevatormedia::Streamer, type: :model do
    context " Gets a request for data on country population" do 
        it "it shows the number of people" do

          #streamer = Streamer.new
          expect(Elevatormedia::Streamer.getContent).to be_instance_of(String)
          expect(Elevatormedia::Streamer.getContent).to start_with('<div>').and end_with('</div>')
    end
  end
end

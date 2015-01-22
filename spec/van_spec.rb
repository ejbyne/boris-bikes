require 'van'

describe Van do

  it_behaves_like "a bike container"
  
  let(:van) { Van.new(:capacity => 15) }

  it "should allow setting an initial capacity on initialising" do
    expect(van.capacity).to eq(15)
  end

end

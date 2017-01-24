require 'item'

describe Item do

  subject( :item ){ described_class.new( name, sell_in, quality ) }
  let( :name ){ double :name }
  let( :sell_in ){ double :sell_in }
  let( :quality ){ double :quality }

  it "should pass the argument name to name" do
    expect( item.name ).to eq name
  end

  it "should pass the argument sell_in to sell_in" do
    expect( item.sell_in ).to eq sell_in
  end

  it "should pass the argument quality to quality" do
    expect( item.quality ).to eq quality
  end

  context "#to_s" do
    it "should display name, sell_in, quality" do
      expect( item.to_s ).to eq "#{name}, #{sell_in}, #{quality}"
    end
  end

end

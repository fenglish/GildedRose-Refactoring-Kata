require 'item'

describe Item do

  subject( :item ){ described_class.new( name, sell_in, quality ) }
  let( :name ){ double :name }
  let( :sell_in ){ double :sell_in }
  let( :quality ){ double :quality }

  context "#to_s" do
    it "should display name, sell_in, quality" do
      expect( item.to_s ).to eq "#{name}, #{sell_in}, #{quality}"
    end
  end

end

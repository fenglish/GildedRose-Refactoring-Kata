require 'item'

describe Item do

  subject( :item ){ described_class.new( name, sell_in, quality ) }
  let( :name ){ double :name }
  let( :sell_in ){ double :sell_in }
  let( :quality ){ double :quality }


end

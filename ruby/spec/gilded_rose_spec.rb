require 'gilded_rose'

describe GildedRose do

  subject( :gilded_rose ){ described_class.new( [items] ) }
  let( :items ){ double :item_klass }

end

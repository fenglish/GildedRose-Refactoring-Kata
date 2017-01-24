require 'item'
require 'gilded_rose'

describe GildedRose do
  # Once the sell by date has passed, Quality degrades twice as fast
  it "should degrades item's quality twice as fast, once the sell by date has passed" do
    items = [ Item.new("Normal item", 0, 5) ]
    GildedRose.new( items ).update_quality()
    expect( items[0].quality ).to eq 3
  end
  
  # The Quality of an item is never negative
  it "should not degrades item's quality more than 0" do
    items = [ Item.new("Normal item", 0, 0) ]
    GildedRose.new( items ).update_quality()
    expect( items[0].quality ).to eq 0
  end

  # “Aged Brie” actually increases in Quality the older it gets
  # The Quality of an item is never more than 50
  # “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
  # “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
  #
  # We have recently signed a supplier of conjured items. This requires an update to our system:
  # “Conjured” items degrade in Quality twice as fast as normal items
end

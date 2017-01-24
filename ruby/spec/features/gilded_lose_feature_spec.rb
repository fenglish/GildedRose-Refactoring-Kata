require 'item'
require 'gilded_rose'

describe GildedRose, "features" do

  context "Normal items" do
    # Once the sell by date has passed, Quality degrades twice as fast
    it "should degrades item's quality twice as fast, once the sell by date has passed" do
      items = [ Item.new("Normal item", 0, 5) ]
      GildedRose.new( items ).update_quality()
      expect( items[0].quality ).to eq 3
      expect( items[0].sell_in ).to eq -1
    end
    # The Quality of an item is never negative
    it "should not degrade item's quality more than 0" do
      items = [ Item.new("Normal item", 5, 0) ]
      GildedRose.new( items ).update_quality()
      expect( items[0].quality ).to eq 0
      expect( items[0].sell_in ).to eq 4
    end
  end

  context "Aged Brie" do
    # “Aged Brie” actually increases in Quality the older it gets
    it "should increase Aged Brie's quality older it gets" do
      items = [ Item.new("Aged Brie", 5, 5) ]
      GildedRose.new( items ).update_quality()
      expect( items[0].quality ).to eq 6
      expect( items[0].sell_in ).to eq 4
    end
    # The Quality of an item is never more than 50
    it "should not increase the quality more than 50" do
      items = [ Item.new("Aged Brie", 5, 50) ]
      GildedRose.new( items ).update_quality()
      expect( items[0].quality ).to eq 50
      expect( items[0].sell_in ).to eq 4
    end
  end

  context "Sulfuras" do
    # “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
    it "should not change Sulfuras' quality and sell_in" do
      items = [ Item.new("Sulfuras, Hand of Ragnaros", 5, 5) ]
      GildedRose.new( items ).update_quality()
      expect( items[0].sell_in ).to eq 5
      expect( items[0].quality ).to eq 5
    end
  end
  
  # context "Backstage passes" do
  #   # “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches;
  #   # Quality increases by 2 when there are 10 days or less
  #   # and by 3 when there are 5 days or less but Quality drops to 0 after the concert
  #   context "when there are 10 days or less" do
  #     it "should increase quality by 2 when there are 10 days or less" do
  #       items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5) ]
  #       GildedRose.new( items ).update_quality()
  #       expect( items[0].quality ).to eq 7
  #       expect( items[0].sell_in ).to eq 9
  #     end
  #     # The Quality of an item is never more than 50
  #     it "should not increase the quality more than 50" do
  #       items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50) ]
  #       GildedRose.new( items ).update_quality()
  #       expect( items[0].quality ).to eq 50
  #       expect( items[0].sell_in ).to eq 9
  #     end
  #   end
  #
  #   context "when there are 5 days or less" do
  #     it "should increase quality by 3" do
  #       items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5) ]
  #       GildedRose.new( items ).update_quality()
  #       expect( items[0].quality ).to eq 8
  #       expect( items[0].sell_in ).to eq 4
  #     end
  #     # The Quality of an item is never more than 50
  #     it "should not increase the quality more than 50" do
  #       items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50) ]
  #       GildedRose.new( items ).update_quality()
  #       expect( items[0].quality ).to eq 50
  #       expect( items[0].sell_in ).to eq 4
  #     end
  #   end
  #   context "after the concert" do
  #     it "should drop quality to 0" do
  #       items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5) ]
  #       GildedRose.new( items ).update_quality()
  #       expect( items[0].quality ).to eq 0
  #       expect( items[0].sell_in ).to eq -1
  #     end
  #   end
  #
  # end

  # We have recently signed a supplier of conjured items. This requires an update to our system:
  # “Conjured” items degrade in Quality twice as fast as normal items
end

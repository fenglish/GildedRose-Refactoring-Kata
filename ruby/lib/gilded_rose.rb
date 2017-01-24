class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Backstage passes to a TAFKAL80ETC concert" then
        if item.sell_in == 0
          item.quality = 0
        elsif item.sell_in <= 5
          item.quality += 3 if quality_over_50?(item)
        elsif item.sell_in <= 10
          item.quality += 2 if quality_over_50?(item)
        else
          item.quality -= 1
        end
        item.sell_in -= 1
      when "Sulfuras, Hand of Ragnaros" then
        # “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
      when "Aged Brie" then
        item.quality += 1 if quality_over_50?(item)
        item.sell_in -= 1
      else
        item.quality -= 1 if item.quality > 0 && item.sell_in > 0
        item.quality -= 2 if item.quality > 0 && item.sell_in == 0
        item.sell_in -= 1
      end
    end
  end

  private

  def quality_over_50?(item)
    item.quality < 50
  end

  # def update_quality()
  #   @items.each do |item|
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end

end

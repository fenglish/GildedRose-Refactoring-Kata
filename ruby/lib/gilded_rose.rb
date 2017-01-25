class GildedRose

  def initialize(items)
    @items = items
    @item = nil
  end

  def update_quality()
    @items.each do |item|
      @item = item
      take_different_process_by_name
      decrease_sell_in
    end
  end

  private

  def take_different_process_by_name
    case @item.name
    when "Backstage passes to a TAFKAL80ETC concert" then process_for_backstage_passes
    when "Sulfuras, Hand of Ragnaros"                then process_for_sulfuras
    when "Aged Brie"                                 then process_for_aged_brie
    else process_for_normal_item end
  end

  def decrease_sell_in
    @item.sell_in -= 1 if @item.name != "Sulfuras, Hand of Ragnaros"
  end

  def process_for_backstage_passes
    if    @item.sell_in <= 0  then @item.quality = 0
    elsif @item.sell_in <= 5  then increase_quality( 3 )
    elsif @item.sell_in <= 10 then increase_quality( 2 )
    else  degrade_quality( 1 ) end
  end

  def process_for_sulfuras
    # “Sulfuras”, being a legendary item, never has to decrease in Quality
  end

  def process_for_aged_brie
    increase_quality( 1 )
  end

  def process_for_normal_item
    return degrade_quality( 2 ) if @item.sell_in <= 0
    degrade_quality( 1 )
  end

  def quality_under_50?
    @item.quality < 50
  end

  def increase_quality( number )
    @item.quality += number if quality_under_50?
  end

  def degrade_quality( number )
    @item.quality -= number if @item.quality > 0
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

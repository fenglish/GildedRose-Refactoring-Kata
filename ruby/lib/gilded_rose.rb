class GildedRose

  def initialize(items)
    @items = items
    @item  = nil
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
    if    @item.name.include?("Backstage passes") then process_for_backstage_passes
    elsif @item.name.include?("Sulfuras")         then process_for_sulfuras_item
    elsif @item.name.include?("Aged Brie")        then process_for_aged_brie
    elsif @item.name.include?("Conjured")         then process_for_conjured_item
    else process_for_normal_item end
  end

  def decrease_sell_in
    @item.sell_in -= 1 if @item.name != "Sulfuras, Hand of Ragnaros"
  end

  def process_for_backstage_passes
    if    out_of_date?      then @item.quality = 0
    elsif less_than_5days?  then increase_quality_by(3)
    elsif less_than_10days? then increase_quality_by(2)
    else  degrade_quality_by(1) end
  end

  def process_for_sulfuras_item
    # “Sulfuras”, being a legendary item, never has to decrease in Quality
  end

  def process_for_aged_brie
    increase_quality_by(1) if out_of_date?
    increase_quality_by(1)
  end

  def process_for_normal_item
    degrade_quality_by(1) if out_of_date?
    degrade_quality_by(1)
  end

  def process_for_conjured_item
    degrade_quality_by(2) if out_of_date?
    degrade_quality_by(2)
  end

  def quality_more_than_0?
    @item.quality > 0
  end

  def quality_under_50?
    @item.quality < 50
  end

  def increase_quality_by( number )
    @item.quality += number if quality_under_50?
  end

  def degrade_quality_by( number )
    @item.quality -= number if quality_more_than_0?
  end

  def out_of_date?
    @item.sell_in <= 0
  end

  def less_than_5days?
    @item.sell_in <= 5
  end

  def less_than_10days?
    @item.sell_in <= 10
  end

end

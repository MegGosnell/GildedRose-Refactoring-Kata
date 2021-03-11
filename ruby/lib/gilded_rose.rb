class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_items(item)
    end 
  end 
  
  def update_item(item)
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
          decrease_quality
        end
      else
        increase_quality
          if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 11
              increase_quality
              if item.sell_in < 6 && item.quality < 50
                item.quality += 1
              end
          end
        if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
        end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                 item.quality -= 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          increase_quality
        end
      end
    end
  end
end

def increase_quality 
  item.quality += 1 if quality < 50 
end

def decrease_quality 
  item.quality -= 1 if quality > 0 
end 


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

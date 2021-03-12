class GildedRose

  def initialize(items)
    @items = items
  end

  def update
    return if name != "Sulfuras, Hand of Ragnaros"
   age 
   update_quality
  end 

  def age 
    item.sell_in -= 1
  end
  
  def update_quality
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        increase_quality
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if sell_in < 11
            increase_quality
          end 
          if sell_in < 6 
            increase_quality
          end
        end
      else 
        decrease_quality
      end 
      
      if item.sell_in < 0
          if item.name == "Aged Brie"
            increase_quality
          elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
              if item.name != "Sulfuras, Hand of Ragnaros"
              item.quality -= quality
              else
                decrease_quality
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

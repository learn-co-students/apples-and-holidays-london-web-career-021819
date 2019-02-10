require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

holiday_supplies.each do |k, v|
  v.each do |h, s| s << supply
end
end 
end 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_supplies[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
holiday_hash[season] = {holiday_name => supply_array}
holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
holiday_supplies[:winter].values.flatten!
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |k, v|
    puts "#{k.to_s.capitalize}:"
    v.each do |holn, sup|
      puts "  #{holn.to_s.split("_").collect {|split_holn| split_holn.capitalize}.join(" ")}: #{sup.join(", ")}"
      end
    end
end 

def all_holidays_with_bbq(holiday_hash)
a = []
holiday_hash.each do |season, holiday|
  holiday.each do |day, supply|
    if supply.include? ("BBQ")
      a << day
    end
  end
end
a
end








require 'pry'

#:holiday_supplies) {
#  {
#    :winter => {
#      :christmas => ["Lights", "Wreath"],
#      :new_years => ["Party Hats"]
#    },
#    :summer => {
#      :fourth_of_july => ["Fireworks", "BBQ"]
#    },
#    :fall => {
#      :thanksgiving => ["Turkey"]
#    },
#    :spring => {
#      :memorial_day => ["BBQ"]
#    }
#  }

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = holiday_hash[:winter].collect do |holiday, supply|
    supply
  end
  winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_data|
    puts "#{season.to_s.capitalize}:"
    holiday_data.each do |holiday_name, supplies|
      holiday_name_array = holiday_name.to_s.split("_").collect {|word| word.capitalize}
      puts "  #{holiday_name_array.join(" ")}: #{supplies.join(", ")}"
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = []

  holiday_hash.each do |season, holiday_data|
    holiday_data.each do |holiday_name, supplies|
      if supplies.include?("BBQ")
        holidays_with_bbq << holiday_name
      end
    end
  end

  holidays_with_bbq
end

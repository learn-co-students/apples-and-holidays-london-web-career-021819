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
  # return the second element in the 4th of July array
  second_element = holiday_hash[:summer][:fourth_of_july]
  second_element[1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, items|
    items << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |quarter, party|
    # find the particular season hash:
    if quarter == season
      # add the new key/value pair in the right location
      holiday_hash[quarter].merge!(holiday_name => supply_array)
    end
  end
  # remember to return the updated hash
holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten!
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, details|
    puts "#{season.capitalize}:"
    # nest iteration within iteration
    details.each do |hol, stuff|
      # can chain lots of operations instead of initialising multiple variables
      holiday = hol.to_s.split("_") #string to array
                .collect { |x| x.capitalize! } # iterate over array
                .join(" ") # array to string
      puts "  #{holiday}: #{stuff.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  yes = []
  holiday_hash.each do |season, celebration|
    #...to access the hash with holiday names(celebration)
    celebration.each do |k, v|
      if v.include?("BBQ") # include?, not == because looking within an array
        yes << k # k is already a symbol so leave it be
      end
    end
  end
  yes
end

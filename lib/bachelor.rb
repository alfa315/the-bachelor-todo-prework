def get_name(hash)
  hash.each do |category_key, info_value|
    if category_key == "name"
      return info_value.split[0]
    end
  end
end

def get_first_name_of_season_winner(data, season)
  # code here
  empty_hash ={}
  data.each do |season_num, array_hash|
    if season_num.to_s == season
      array_hash.each do |hash|
        if hash.values.include?("Winner")
          empty_hash = hash
        end
      end
    end
  end
  get_name(empty_hash)
end


def get_contestant_name(data, occupation)
  # code here
  empty_hash ={}
  data.each do |season_num, array_hash|
    array_hash.each do |hash|
      if hash.values.include?(occupation)
        empty_hash = hash
      end
    end
  end
  empty_hash.each do |category_key, info_value|
    if category_key == "name"
      return info_value
    end
  end
end


def count_contestants_by_hometown(data, hometown)
  # code here
  empty_array = []
  data.each do |season_num, array_hash|
    array_hash.each do |hash|
      hash.each do |category_key, info_value|
        if info_value == hometown
          empty_array.push(hometown)
        end
      end
    end
  end
  empty_array.length
end


def get_occupation(data, hometown)
  # code here
  empty_hash = {}
  data.each do |season_num, array_hash|
    array_hash.each do |hash|
      if hash.values.include?(hometown)
        empty_hash = hash
      end
      empty_hash.each do |category_key, info_value|
        if category_key == "occupation"
          return info_value
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # code here
  empty_array = []
  total = 0
  data.each do |season_num, array_hash|
    if season_num.to_s == season
      array_hash.each do |hash|
        hash.each do |category_key, info_value|
          if category_key == "age"
            empty_array.push(info_value)
            total = total + info_value.to_f
          end
        end
      end
    end
  end
  (total/empty_array.length).round
end

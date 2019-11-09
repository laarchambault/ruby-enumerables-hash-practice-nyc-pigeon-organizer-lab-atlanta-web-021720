require 'pry'

def create_keys_for_pigeons(list)
  pigeon_names = {}
  list.each { |attribute_group_key, value_hash| 
    value_hash.each { |attribute_type_key, pigeon_array|
    pigeon_array.each { |pigeon|
    if !pigeon_names.include? pigeon
       pigeon_names[pigeon] = {}
    end
    }
    }
  }
  pigeon_names
end


def nyc_pigeon_organizer(data)
  pigeon_names = create_keys_for_pigeons(data)

  data.each { |attribute_group_key, attribute_array|
  attribute_array.each { |attribute_type_key, value_array|
  value_array.each { |x| 

  if !pigeon_names.include? x[attribute_group_key]
    pigeon_names[x] = {}
    pigeon_names[x][attribute_group_key] = [attribute_type_key]
binding.pry
  else
    if !pigeon_names[x][attribute_group_key].include? attribute_type_key
      pigeon_names[x][attribute_group_key] << attribute_type_key
    end
  end
  }
  }
  }
pigeon_names
end

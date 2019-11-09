require 'pry'

def create_keys_for_pigeons(list)
  pigeon_names = {}
  list.each { |attribute_type| 
    attribute_type.each { |pigeon|
    if !pigeon_names.includes? pigeon
      pigeon_names[pigeon] = {}
    end
    }
  }
  pigeon_names
end


def nyc_pigeon_organizer(data)
  pigeon_names = create_keys_for_pigeons(data)

  binding.pry
  data.each { |attribute_group_key|
  attribute_group_key.each { |attribute_type_key, value_array|
  value_array.any? { |x| 
  if !pigeon_names.includes? x
    pigeon_names[x] = {}
    pigeon_names[x][attribute_group_key] = [attribute_type_key]
  else
    if !pigeon_names[x][attribute_group_key].includes? attribute_type_key
      pigeon_names[x][attribute_group_key] << attribute_type_key
    end
  end
  }
  }
  }
pigeon_names
end

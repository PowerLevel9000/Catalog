require 'json'

def write_to_json_file(labels, file_path)
  data = labels.map(&:to_json)
  File.write(file_path, JSON.pretty_generate(data))
end

def read_from_json_file(file_path, class_name)
  json_str = File.read(file_path)
  data = JSON.parse(json_str)
  data.map { |label_data| class_name.from_json(label_data) }
end

require_relative "./data-controller/reader_writer"

class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    label = Label.new(data['title'], data['color'])
    label.instance_variable_set(:@id, data['id'])
    label.instance_variable_set(:@items, data['items'])
    label
  end
end

##################################### caution open this at your own risk also for testing  ######################################
# label1 = Label.new("action", "red")
# label2 = Label.new("drama", "pink")
# label3 = Label.new("genre", "cyan")
# label4 = Label.new("romance", "yellow")
# write_labels_to_json_file([label1, label2, label3, label4], "./data/label.json")
# read_labels_from_json_file("./data/label.json", Label).map {|label| puts label.title, label.color}
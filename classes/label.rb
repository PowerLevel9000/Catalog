require_relative './data-controller/reader_writer'

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

# #################################### caution open this at your own risk also for testing  ######################################
# label1 = Label.new("action", "red")
# puts label1.to_json
# label1.add_item("new item")
# label2 = Label.new("drama", "pink")
# label2.add_item("new item")
# label3 = Label.new("genre", "cyan")
# label3.add_item("new item")
# label4 = Label.new("romance", "yellow")
# label4.add_item("new item")

# write_to_json_file([label1, label2, label3, label4], "./data/label.json")
# puts read_from_json_file("./data/label.json", Label)

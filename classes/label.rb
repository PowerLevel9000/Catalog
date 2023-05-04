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

  # def to_json(*args)
  #   {
  #     'id' => @id,
  #     'title' => @title,
  #     'color' => @color,
  #     'items' => @items
  #   }.to_json(*args)
  # end

  # def self.from_json(json)
  #   data = JSON.parse(json)
  #   label = Label.new(data['title'], data['color'])
  #   label.instance_variable_set(:@id, data['id'])
  #   label.instance_variable_set(:@items, data['items'])
  #   label
  # end
end

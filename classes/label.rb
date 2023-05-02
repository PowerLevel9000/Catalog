class Label 
    def initialize(title, color)
        @id = rand(1..1000)
        @title = title
        @color = color
        @items = []
    end

    add_item(item)
        @items << item
    end
end

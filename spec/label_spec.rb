require 'spec_helper'

describe Label do
    let(:label) {Label.new("Action", "Red")}

    it "should return public attr such as  'title, color etc'" do
        attributes = [label.title, label.color, label.items]
        expect(attributes).to eq(["Action", "Red", []])
    end

    it "should add item to @item array " do
        label.add_item("demo item")
        expect(label.items).to eq(["demo item"])
    end

    it "should return added item in array" do
        attributes = [label.title, label.color, label.items]
        label.add_item("demo item")
        expect(attributes).to eq(["Action", "Red", ["demo item"]])
    end
end
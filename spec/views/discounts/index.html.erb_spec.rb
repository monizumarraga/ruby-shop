require 'rails_helper'

RSpec.describe "discounts/index", type: :view do
  before(:each) do
    assign(:discounts, [
      Discount.create!(
        :name => "Name",
        :typedisocunt => "Typedisocunt",
        :quantity => 2,
        :unitdiscount => "Unitdiscount",
        :price => 3.5
      ),
      Discount.create!(
        :name => "Name",
        :typedisocunt => "Typedisocunt",
        :quantity => 2,
        :unitdiscount => "Unitdiscount",
        :price => 3.5
      )
    ])
  end

  it "renders a list of discounts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Typedisocunt".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Unitdiscount".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end

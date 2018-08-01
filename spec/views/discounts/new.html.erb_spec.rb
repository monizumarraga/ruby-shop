require 'rails_helper'

RSpec.describe "discounts/new", type: :view do
  before(:each) do
    assign(:discount, Discount.new(
      :name => "MyString",
      :typedisocunt => "MyString",
      :quantity => 1,
      :unitdiscount => "MyString",
      :price => 1.5
    ))
  end

  it "renders new discount form" do
    render

    assert_select "form[action=?][method=?]", discounts_path, "post" do

      assert_select "input[name=?]", "discount[name]"

      assert_select "input[name=?]", "discount[typedisocunt]"

      assert_select "input[name=?]", "discount[quantity]"

      assert_select "input[name=?]", "discount[unitdiscount]"

      assert_select "input[name=?]", "discount[price]"
    end
  end
end

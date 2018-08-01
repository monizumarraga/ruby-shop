require 'rails_helper'

RSpec.describe "discounts/edit", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :name => "MyString",
      :typedisocunt => "MyString",
      :quantity => 1,
      :unitdiscount => "MyString",
      :price => 1.5
    ))
  end

  it "renders the edit discount form" do
    render

    assert_select "form[action=?][method=?]", discount_path(@discount), "post" do

      assert_select "input[name=?]", "discount[name]"

      assert_select "input[name=?]", "discount[typedisocunt]"

      assert_select "input[name=?]", "discount[quantity]"

      assert_select "input[name=?]", "discount[unitdiscount]"

      assert_select "input[name=?]", "discount[price]"
    end
  end
end

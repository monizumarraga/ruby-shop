require 'rails_helper'

RSpec.describe "discounts/show", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :name => "Name",
      :typedisocunt => "Typedisocunt",
      :quantity => 2,
      :unitdiscount => "Unitdiscount",
      :price => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Typedisocunt/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Unitdiscount/)
    expect(rendered).to match(/3.5/)
  end
end

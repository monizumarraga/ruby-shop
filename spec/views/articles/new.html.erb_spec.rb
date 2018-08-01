require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :code => "MyString",
      :name => "MyString",
      :units => 1,
      :price => 1.5
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[code]"

      assert_select "input[name=?]", "article[name]"

      assert_select "input[name=?]", "article[units]"

      assert_select "input[name=?]", "article[price]"
    end
  end
end

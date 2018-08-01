require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :code => "MyString",
      :name => "MyString",
      :units => 1,
      :price => 1.5
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input[name=?]", "article[code]"

      assert_select "input[name=?]", "article[name]"

      assert_select "input[name=?]", "article[units]"

      assert_select "input[name=?]", "article[price]"
    end
  end
end

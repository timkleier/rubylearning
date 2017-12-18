require 'rails_helper'

RSpec.describe "meta_tags/new", type: :view do
  before(:each) do
    assign(:meta_tag, MetaTag.new(
      :meta_type => 1,
      :name => "MyString"
    ))
  end

  it "renders new meta_tag form" do
    render

    assert_select "form[action=?][method=?]", meta_tags_path, "post" do

      assert_select "input[name=?]", "meta_tag[meta_type]"

      assert_select "input[name=?]", "meta_tag[name]"
    end
  end
end

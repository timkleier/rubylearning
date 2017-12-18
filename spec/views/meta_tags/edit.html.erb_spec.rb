require 'rails_helper'

RSpec.describe "meta_tags/edit", type: :view do
  before(:each) do
    @meta_tag = assign(:meta_tag, MetaTag.create!(
      :meta_type => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit meta_tag form" do
    render

    assert_select "form[action=?][method=?]", meta_tag_path(@meta_tag), "post" do

      assert_select "input[name=?]", "meta_tag[meta_type]"

      assert_select "input[name=?]", "meta_tag[name]"
    end
  end
end

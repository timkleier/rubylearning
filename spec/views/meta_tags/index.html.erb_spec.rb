require 'rails_helper'

RSpec.describe "meta_tags/index", type: :view do
  before(:each) do
    assign(:meta_tags, [
      MetaTag.create!(
        :meta_type => 2,
        :name => "Name"
      ),
      MetaTag.create!(
        :meta_type => 2,
        :name => "Name"
      )
    ])
  end

  it "renders a list of meta_tags" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

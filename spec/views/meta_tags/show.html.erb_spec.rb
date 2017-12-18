require 'rails_helper'

RSpec.describe "meta_tags/show", type: :view do
  before(:each) do
    @meta_tag = assign(:meta_tag, MetaTag.create!(
      :meta_type => 2,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
  end
end

require 'rails_helper'

RSpec.describe "text_scrolls/show", type: :view do
  before(:each) do
    @text_scroll = assign(:text_scroll, TextScroll.create!(
      :text => "",
      :text_color => "",
      :bg_color => "",
      :scroll_amount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end

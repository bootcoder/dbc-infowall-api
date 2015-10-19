require 'rails_helper'

RSpec.describe "text_scrolls/index", type: :view do
  before(:each) do
    assign(:text_scrolls, [
      TextScroll.create!(
        :text => "",
        :text_color => "",
        :bg_color => "",
        :scroll_amount => 1
      ),
      TextScroll.create!(
        :text => "",
        :text_color => "",
        :bg_color => "",
        :scroll_amount => 1
      )
    ])
  end

  it "renders a list of text_scrolls" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

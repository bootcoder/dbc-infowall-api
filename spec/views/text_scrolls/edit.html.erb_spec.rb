require 'rails_helper'

RSpec.describe "text_scrolls/edit", type: :view do
  before(:each) do
    @text_scroll = assign(:text_scroll, TextScroll.create!(
      :text => "",
      :text_color => "",
      :bg_color => "",
      :scroll_amount => 1
    ))
  end

  it "renders the edit text_scroll form" do
    render

    assert_select "form[action=?][method=?]", text_scroll_path(@text_scroll), "post" do

      assert_select "input#text_scroll_text[name=?]", "text_scroll[text]"

      assert_select "input#text_scroll_text_color[name=?]", "text_scroll[text_color]"

      assert_select "input#text_scroll_bg_color[name=?]", "text_scroll[bg_color]"

      assert_select "input#text_scroll_scroll_amount[name=?]", "text_scroll[scroll_amount]"
    end
  end
end

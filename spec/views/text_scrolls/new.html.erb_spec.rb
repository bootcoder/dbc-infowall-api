require 'rails_helper'

RSpec.describe "text_scrolls/new", type: :view do
  before(:each) do
    assign(:text_scroll, TextScroll.new(
      :text => "",
      :text_color => "",
      :bg_color => "",
      :scroll_amount => 1
    ))
  end

  it "renders new text_scroll form" do
    render

    assert_select "form[action=?][method=?]", text_scrolls_path, "post" do

      assert_select "input#text_scroll_text[name=?]", "text_scroll[text]"

      assert_select "input#text_scroll_text_color[name=?]", "text_scroll[text_color]"

      assert_select "input#text_scroll_bg_color[name=?]", "text_scroll[bg_color]"

      assert_select "input#text_scroll_scroll_amount[name=?]", "text_scroll[scroll_amount]"
    end
  end
end

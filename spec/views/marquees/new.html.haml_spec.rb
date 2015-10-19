require 'rails_helper'

RSpec.describe "marquees/new", type: :view do
  before(:each) do
    assign(:marquee, Marquee.new(
      :text => "",
      :text_color => "",
      :bg_color => "",
      :scroll_amount => "",
      :display_status => "MyString"
    ))
  end

  it "renders new marquee form" do
    render

    assert_select "form[action=?][method=?]", marquees_path, "post" do

      assert_select "input#marquee_text[name=?]", "marquee[text]"

      assert_select "input#marquee_text_color[name=?]", "marquee[text_color]"

      assert_select "input#marquee_bg_color[name=?]", "marquee[bg_color]"

      assert_select "input#marquee_scroll_amount[name=?]", "marquee[scroll_amount]"

      assert_select "input#marquee_display_status[name=?]", "marquee[display_status]"
    end
  end
end

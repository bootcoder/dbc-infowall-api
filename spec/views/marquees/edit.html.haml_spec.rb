require 'rails_helper'

RSpec.describe "marquees/edit", type: :view do
  before(:each) do
    @marquee = assign(:marquee, Marquee.create!(
      :text => "",
      :text_color => "",
      :bg_color => "",
      :scroll_amount => "",
      :display_status => "MyString"
    ))
  end

  it "renders the edit marquee form" do
    render

    assert_select "form[action=?][method=?]", marquee_path(@marquee), "post" do

      assert_select "input#marquee_text[name=?]", "marquee[text]"

      assert_select "input#marquee_text_color[name=?]", "marquee[text_color]"

      assert_select "input#marquee_bg_color[name=?]", "marquee[bg_color]"

      assert_select "input#marquee_scroll_amount[name=?]", "marquee[scroll_amount]"

      assert_select "input#marquee_display_status[name=?]", "marquee[display_status]"
    end
  end
end

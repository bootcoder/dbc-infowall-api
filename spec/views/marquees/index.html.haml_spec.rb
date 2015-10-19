require 'rails_helper'

RSpec.describe "marquees/index", type: :view do
  before(:each) do
    assign(:marquees, [
      Marquee.create!(
        :text => "",
        :text_color => "",
        :bg_color => "",
        :scroll_amount => "",
        :display_status => "Display Status"
      ),
      Marquee.create!(
        :text => "",
        :text_color => "",
        :bg_color => "",
        :scroll_amount => "",
        :display_status => "Display Status"
      )
    ])
  end

  it "renders a list of marquees" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Display Status".to_s, :count => 2
  end
end

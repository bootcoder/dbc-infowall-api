require 'rails_helper'

RSpec.describe "marquees/show", type: :view do
  before(:each) do
    @marquee = assign(:marquee, Marquee.create!(
      :text => "",
      :text_color => "",
      :bg_color => "",
      :scroll_amount => "",
      :display_status => "Display Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Display Status/)
  end
end

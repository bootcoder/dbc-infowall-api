json.array!(@marquees) do |marquee|
  json.extract! marquee, :id, :text, :text_color, :bg_color, :scroll_amount, :display_status
  json.url marquee_url(marquee, format: :json)
end

json.array!(@text_scrolls) do |text_scroll|
  json.extract! text_scroll, :id, :text, :text_color, :bg_color, :scroll_amount
  json.url text_scroll_url(text_scroll, format: :json)
end

module ApplicationHelper
  def tide_font_size(text_length)
    case text_length
    when (0..99) then '36px'
    when (100..199) then '32px'
    when (200..299) then '26px'
    when (300..499) then '20px'
    when (500..999) then '18px'
    when (1000..1499) then '16px'
    else
      '14px'
    end
  end
end

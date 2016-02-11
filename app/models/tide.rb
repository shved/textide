class Tide < ActiveRecord::Base
  def self.kenko_quote
    [quote, caption]
  end

  private

  def self.caption
    'Ёсида Кэнко, «Записки от скуки», XIV век.'
  end

  def self.quote
    'Когда весь день праздно сидишь против тушечницы и для чего-то '\
    'записываешь всякую всячину, что приходит на ум, бывает, такое напишешь '\
    '– с ума можно сойти.'
  end
end

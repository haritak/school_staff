class School < ApplicationRecord
  def to_s
    "[#{code}] #{title}"
  end
end

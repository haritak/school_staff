class Person < ApplicationRecord

  def full_name
    "#{last_name} #{first_name} του #{father_name}"
  end

end

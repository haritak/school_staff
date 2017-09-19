class Student < ApplicationRecord
  def to_s
    "[#{serial_no}] #{last_name} #{first_name} του #{father_name} και της #{mother_name}"
  end
end

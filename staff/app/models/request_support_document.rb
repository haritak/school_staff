class RequestSupportDocument < ApplicationRecord
  belongs_to :school_teacher_request

  def to_s
    "Την από #{issuer_date} και με αρ.πρωτ. #{issuer_protocol} #{description} του #{issuer}."
  end
end

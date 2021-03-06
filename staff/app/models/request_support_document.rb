class RequestSupportDocument < ApplicationRecord
  belongs_to :school_teacher_request

  def to_s
    issuer_protocol_str = ""
    if issuer_protocol!=nil and issuer_protocol.strip != ''
      issuer_protocol_str = "και με αρ.πρωτ. #{issuer_protocol}"
    end
    from_str = issuer_date ? issuer_date.strftime("%d-%m-%Y") : ""
    #start with two spaces to align with previous numbered list.
    "  Την από #{from_str} #{issuer_protocol_str} #{description} #{issuer}."
  end
end

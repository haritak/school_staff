class ResponseSpecification < ApplicationRecord
  belongs_to :request_specification

  Templates_Directory = "response_templates" #inside Rails.root

  def uploaded_template
    self.template_filename
  end

  def uploaded_template=( file_field ) 
    return if not file_field

    filename = file_field.tempfile

    sha256 = `sha256sum #{File.absolute_path(filename)}`
    raise "SHA256 calculation error." if not sha256
    raise "SHA256 calculation error." if sha256.length==0
    sha256 = sha256.split()
    raise "SHA256 calculation error." if sha256.length==0
    sha256 = sha256[0]
    raise "SHA256 calculation error." if sha256.length<10


    #move the uploaded file to our Templates Directory
    uploaded_filename = File.absolute_path( filename )
    target_filename = Rails.root.join( Templates_Directory, "#{sha256}.odt" )
    FileUtils.mv( uploaded_filename, target_filename )

    self.template_filename = File.absolute_path( target_filename )
  end

  def to_s
    "απόφαση για :#{request_specification.description}"
  end
end

class RequestSpecification < ApplicationRecord
  belongs_to :teacher_working_class

  Templates_Directory = "request_templates" #inside Rails.root

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

  def static_filename
    path = "#{Templates_Directory}/#{teacher_working_class_id}"
    FileUtils.mkdir( path ) if not File.exist?( path )
    path += "/#{code}.odt"

    if not File.exist?(path)
      #XXX in case the template_filename is removed, but the path exists
      #will continue to work.
      FileUtils.mv( template_filename, path ) if File.exist?( template_filename )
    else
      if File.exist?( template_filename )
        #overwrite the path only when the template_filename is newer
        FileUtils.mv( template_filename, path ) if File.mtime( template_filename ) > File.mtime( path )
      end
    end
    return path
  end

  def to_s
    "#{description}-#{teacher_working_class}"
  end

end

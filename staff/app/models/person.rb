class Person < ApplicationRecord

  def gender_txt
    ['Ανδρας', 'Γυναίκα'][gender]
  end

  def full_name
    "#{last_name} #{first_name} του #{father_name}"
  end

  def short_name
    "#{last_name} #{first_name[0..2]}."
  end

  def geniki( attribute, local_gender=gender )
    stored_geniki = self.send "#{attribute}_gen"
    return stored_geniki if stored_geniki and stored_geniki.strip != ''

    onoma = self.send attribute
    onoma = capitalize( onoma )

    geniki = onoma
    if local_gender==0 #male
      base = onoma[0...-2]
      ending = onoma[-2..-1]
      ending = case ending 
               when "ΑΣ" then "Α"
               when "ΗΣ" then "Η"
               when "ΟΣ" then "ΟΥ"
               when "ΕΣ" then "Ε"
               else ending
               end
      geniki = base + ending
    elsif local_gender==1 #female
      return geniki if attribute.to_s=="last_name" #female surnames δεν κλίνονται

      base = onoma[0...-1]
      ending = onoma[-1..-1]
      ending = case ending 
               when "Α" then "ΑΣ"
               when "Η" then "ΗΣ"
               when "Ο" then "ΟΥ"
               when "Υ" then "ΥΣ"
               when "Ω" then "ΟΥΣ"
               when "Σ" then "ΟΥ"
               else ending
               end
      geniki = base + ending
    else
      raise "Uknown gender!"
    end
    
    geniki
  end

  def aitiatiki( attribute, local_gender=gender )
    stored_aitiatiki = self.send "#{attribute}_ait"
    return stored_aitiatiki if stored_aitiatiki and stored_aitiatiki.strip != ''

    onoma = self.send attribute
    onoma = capitalize( onoma )

    aitiatiki = onoma
    if local_gender==0 #male
      base = onoma[0...-2]
      ending = onoma[-2..-1]
      ending = case ending 
               when "ΑΣ" then "Α"
               when "ΗΣ" then "Η"
               when "ΟΣ" then "Ο"
               when "ΕΣ" then "Ε"
               else ending
               end
      aitiatiki = base + ending
    elsif local_gender==1 #female
      return aitiatiki if attribute.to_s=="last_name" #female surnames δεν κλίνονται

      base = onoma[0...-1]
      ending = onoma[-1..-1]
      ending = case ending 
               when "Α" then "Α"
               when "Η" then "Η"
               when "Ο" then "ΟΥ"
               when "Υ" then "Υ"
               when "Ω" then "Ω"
               when "Σ" then ""
               else ending
               end
      aitiatiki = base + ending
    else
      raise "Uknown gender!"
    end
    
    aitiatiki
  end

  private

  def capitalize( name )
    capital = name.upcase
    capital.gsub("/Ά/", "Α").
      gsub("/Έ/", "Ε").
      gsub("/Ή/", "Η").
      gsub("/Ί/", "Ι").
      gsub("/Ό/", "Ο").
      gsub("/Ύ/", "Υ").
      gsub("/Ώ/", "Ω").
      gsub("/Ϊ/", "Ι").
      gsub("/Ϋ/", "Υ")
  end

end

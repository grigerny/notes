module NotesHelper 
  
  def truncate_link(note)
  truncate("#{note.link.sub(/^https?\:\/\//, '').sub(/^www./,'')}", :length => 17, :separator => ' ') 
  end
  
  def created_at_time(note)
     note.created_at.strftime('%b %d, %Y') 
   end
  
  def website_name
    "ihasbookmarks"
  end 
  
  def page_thumbnail(note)
  link_to image_tag("http://immediatenet.com/t/l?Size=1024x768&URL=#{note.link}"), "#{note.link}"
  end
  
  def page_placeholder(note)
    link_to image_tag("http://placehold.it/200x150/232C3B/&text=#{note.link}"), "#{note.link}" 
  end
  
  def https_link(note)
    note.link.match (/https:/)
  end 

  
end

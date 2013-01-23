module NotesHelper 
  
  def truncate_link(note)
  truncate("#{note.link.sub(/^https?\:\/\//, '').sub(/^www./,'')}", :length => 17, :separator => ' ') 
  end
  
  def created_at_time(note)
    note.created_at.strftime('%b %d, %Y') 
  end
  
end

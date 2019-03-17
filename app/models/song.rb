class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    self.note = Note.find_or_create_by(content: note)
  end

  def note_contents=(notes)
    notes.each do |note|
       unless note.empty?
        self.notes.build(content: note)
     end
   end
  end

  def note_contents
    self.notes.collect { |note| note.content }
  end

end

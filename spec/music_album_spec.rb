require_relative '../modules/item'
require_relative '../modules/music_album'
require_relative 'spec_helper'

describe MusicAlbum do
  context 'album should be an instance of MusicAlbum class' do
    it 'returns true' do
      music_album = MusicAlbum.new(true)
      expect(music_album).to be_an_instance_of(MusicAlbum)
    end
  end

  context 'when the album is is not on spotify' do
    it 'returns false' do
      album = MusicAlbum.new(false, '2010-01-01')
      expect(album.send(:can_be_archived?)).to eq false
    end
  end

  context 'when the album is not over 10 years old' do
    it 'returns false' do
      album = MusicAlbum.new(true, '2020-01-01')
      expect(album.send(:can_be_archived?)).to eq false
    end
  end

  context 'when the album is over 10 years old and on spotify' do
    it 'returns true' do
      album = MusicAlbum.new(true, '2010-01-01')
      expect(album.send(:can_be_archived?)).to eq true
    end
  end
end

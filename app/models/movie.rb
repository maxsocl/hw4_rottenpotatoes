class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_similar(id)
  	movie = Movie.find(id)
    Movie.find_all_by_director(movie.director)
  end

end

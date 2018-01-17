02 - Intro to ActiveRecord Queries

1. Find the albums recorded by the artist Queen.
Album.where("#{Artist.where('name = ?', 'Queen').ids.first}")

2. Count how many tracks belong to the media type "Protected MPEG-4 video file".
Track.where('media_type_id = ?', "#{MediaType.find_by(name: "Protected MPEG-4 video file").id}").count

3. Find the genre with the name "Hip Hop/Rap".
Genre.find_by(name: "Hip Hop/Rap")

4. Count how many tracks belong to the "Hip Hop/Rap" genre
Track.where(genre_id: "#{Genre.find_by(name: 'Hip Hop/Rap').id}").count

5. Find the total amount of time required to listen to all the tracks in the database.
Track.sum("milliseconds")

6. Find the highest price of any track that has the media type "MPEG audio file".
Track.where('media_type_id = ?', "#{MediaType.find_by(name: "MPEG audio file").id}").maximum("unit_price")

7. Find the name of the most expensive track that has the media type "MPEG audio file".
Track.where('media_type_id = ?', "#{MediaType.find_by(name: "MPEG audio file").id}").order(unit_price: :desc).first.name

8. Find the 2 oldest artists.
Artist.order(created_at: :asc).limit(2)

9.Find the least expensive track that has the genre "Electronica/Dance".
Track.where.minimum(:unit_price)

10.Find all "MPEG autio file" tracks in the genre "Electronica/Dance".
Track.where(genre_id: 15).where(media_type_id: 1)

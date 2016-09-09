drop table if exists movie_ratings;

drop table if exists movie_ratings_stg;

CREATE TABLE movie_ratings_stg (
RespondentID VARCHAR(64),
Movie1Rating VARCHAR(64),
Movie2Rating VARCHAR(64),
Movie3Rating VARCHAR(64),
Movie4Rating VARCHAR(64),
Movie5Rating VARCHAR(64),
Movie6Rating VARCHAR(64)


);



CREATE TABLE movie_ratings (
    movie_rating_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RespondentID VARCHAR(64),
    MOVIE VARCHAR(128),
    RATING VARCHAR(64)
)
;
  


LOAD  DATA LOCAL INFILE '/Users/rnash/github/CUNY-DATA-607/Week2/Week2Assignment/SurveyMonkeyData.csv'
INTO TABLE movie_ratings_stg 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r'
iGNORE 2 LINES
(RespondentID, @dummy,  @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy,
movie1Rating, movie2Rating, movie3Rating, movie4Rating, movie5Rating, movie6Rating

)
;


select * from movie_ratings_stg;

Insert Into Movie_Ratings  (
RespondentID, Rating, Movie 
) 
Select RespondentID, Movie1Rating, 'Finding Dory' from movie_ratings_stg 
where Movie1Rating is not null
Union 
Select RespondentID, Movie2Rating, 'Captain America: Civil War' from movie_ratings_stg
where Movie2Rating is not null
Union
Select RespondentID, Movie3Rating, 'The Jungle Book (2016)' from movie_ratings_stg
where Movie3Rating is not null
Union 
Select RespondentID, Movie4Rating, 'Deadpool' from movie_ratings_stg
where Movie4Rating is not null
Union
Select RespondentID, Movie5Rating, 'The Secret Life of Pets' from movie_ratings_stg
where Movie5Rating is not null
Union 
Select RespondentID, Movie6Rating, 'Zootopia' from movie_ratings_stg 
where Movie6Rating is not null; 

 select * from Movie_Ratings;
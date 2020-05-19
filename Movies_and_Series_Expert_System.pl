%  This Mini Expert System advises on what movies and series to watch based on the users choice of Age, Mood and Genre 

% By saying top, the system begins.
% It will ask the user whether he wants to watch a movie or series
% If movie is chosen by user, he is asked to enter age, gender, mood and length information.
% If series is chosen by user, he is asked to enter age, gender and mood information.
% choose_movie will bind a value to the variable Movie.
% choose_series will bind a value to the variable Series.
%  You must press a period after your input.

% User enters top. 
% It goes to the top rule and asks user whether he wants to watch a movie or a series 

top :- choice, read_input.

choice :- write('Do you want to watch a movie or series? ').

read_input :- read(Option), process_input(Option).

process_input(Option) :- (Option == movie), topm.

process_input(Option) :- (Option == series), tops.

% topm chooses movies
topm :- write('Age? '), read(Age), write('Subscription? - netflix or prime or disney? '), read(Subscription),
	   write('Genre? - thriller | comedy | action | horror | scifi | animation | romance | fantasy | horror_comedy? '), read(Genre),
       write('Mood? - happy | sad ? '), read(Mood), write('Length? <= 2 hours movie | > 2 hours movie ? '), read(Length),
       choose_movie(Age, Genre, Mood, Length , Subscription, Movie),
       write('You can watch '), write(Movie), nl.
	   
% tops chooses series
tops :- write('Age? '), read(Age), write('Subscription? - netflix, prime or disney? '), read(Subscription),
	   write('Genre? - thriller | comedy | action | horror | scifi | animation | romance | fantasy | horror_comedy? '), read(Genre),
       write('Mood? - happy | sad ? '), read(Mood), 
       choose_series(Age, Genre, Mood, Subscription, Series),
       write('You can watch '), write(Series), nl.

% Confidence Factor of choose rules are all 60 percent.

% Movies

% Following movies are chosen if age is adult, genre is thriller, mood is happy, length is greater than 2 and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'The Tourist, Inception') :-  
	adult(Age), thriller(Genre), happy(Mood),  gtwo(Length), netflix(Subscription).

% Following movies are chosen if age is adult, genre is thriller, mood is happy, length is greater than 2 and subscription is prime
choose_movie(Age, Genre, Mood, Length, Subscription, 'Parasite, Joker') :- 
	adult(Age), thriller(Genre), happy(Mood), gtwo(Length), prime(Subscription).
	
% Following movies are chosen if age is adult genre is thriller, mood is sad, length is lesser than 2 and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Shutter Island, Memento') :- 
	adult(Age), thriller(Genre), sad(Mood), ltwo(Length), netflix(Subscription).

% Following movies are chosen if age is kid, genre is comedy, mood is happy, Length is lesser than or equal to 2 hours and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Hangover, Jumanji') :- 
	kid(Age), comedy(Genre), happy(Mood), ltwo(Length), netflix(Subscription).

% Following movies are chosen if age is adult, genre is comedy, mood is happy, Length is lesser than or equal to 2 hours and subscription is prime
choose_movie(Age, Genre, Mood, Length, Subscription, 'Sonic, The Gentlemen') :- 
	adult(Age), comedy(Genre), happy(Mood), ltwo(Length), prime(Subscription).

% Following movies are chosen if age, genre is kid_scifi, mood is happy, Length is greater than 2 hours and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Back To The Future, Avengers') :- 
	kid_scifi(Age, Genre), happy(Mood), gtwo(Length), netflix(Subscription).

% Following movies are chosen if age, genre is kid_scifi, mood is happy, Length is greater than 2 hours and subscription is prime
choose_movie(Age, Genre, Mood, Length, Subscription, 'The Medusa Touch, Overlord') :- 
	kid_scifi(Age, Genre), happy(Mood), gtwo(Length), prime(Subscription).
	
% Following movies are chosen if age, genre is kid_scifi, mood is happy, Length is lesser than 2 hours and subscription is disney
choose_movie(Age, Genre, Mood, Length, Subscription, 'Star Wars, The Chronicles of Narnia') :- 
	kid_scifi(Age, Genre), happy(Mood), ltwo(Length), disney(Subscription).

% Following movies are chosen if age, genre is adult_horror is kid, mood is sad, Length is lesser than or equal to 2 hours and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Conjuring, The Grudge') :- 
	adult_horror(Age, Genre), sad(Mood), ltwo(Length), netflix(Subscription).

% Following movies are chosen if age is adult, genre is action, mood is happy, Length is greater than 2 hours and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Mission Impossible, Fast and Furious') :- 
	adult(Age), action(Genre), happy(Mood), gtwo(Length), netflix(Subscription).

% Following movies are chosen if age is adult, genre is romance, mood is happy, Length is leseer than or equal to 2 hours and subscription is prime
choose_movie(Age, Genre, Mood, Length, Subscription, 'A Star is Born, La La Land') :- 
	adult(Age), romance(Genre), happy(Mood), ltwo(Length), prime(Subscription).

% Following movies are chosen if age is kid, genre is animation, mood is happy, Length is lesser than or equal to 2 hours and subscription is disney
choose_movie(Age, Genre, Mood, Length, Subscription, 'Lion King, Despicable Me') :- 
	kid(Age), animation(Genre), happy(Mood), ltwo(Length), disney(Subscription).

% Following movies are chosen if age is kid, genre is fantasy, mood is happy, Length is greater than 2 hours and subscription is disney
choose_movie(Age, Genre, Mood, Length, Subscription, 'Aladdin, Snow White and the Seven Dwarfs') :- 
	kid(Age), fantasy(Genre), happy(Mood), gtwo(Length), disney(Subscription).
	
% Following movies are chosen if age is kid, genre is fantasy, mood is happy, Length is greater 2 hours and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Maleficent: Mistress of Evil, Shazam') :- 
	kid(Age), fantasy(Genre), happy(Mood), gtwo(Length), netflix(Subscription).

% Following movies are chosen if age is adult, genre is horror_comedy, mood is happy, Length is lesser than or equal 2 hours and subscription is netflix
choose_movie(Age, Genre, Mood, Length, Subscription, 'Fantasy Island, Ready or Not') :- 
	adult(Age), horror_comedy(Genre), happy(Mood), ltwo(Length), netflix(Subscription).

% Random below choice chosen if all of the above failed
choose_movie(_, _, _, _, _, 'Lord of the Rings instead as there are no matches for the options you chose').

% Series

% Following series are chosen if age is adult, genre is thriller, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Money Heist, Sherlock') :- 
	adult(Age), thriller(Genre), happy(Mood), netflix(Subscription).
	
% Following series are chosen if age is adult, genre is thriller, mood is happy and subscription is prime
choose_series(Age, Genre, Mood, Subscription, 'Suits, Quantico') :- 
	adult(Age), thriller(Genre), happy(Mood), prime(Subscription).

% Following series are chosen if age is adult, genre is thriller, mood is sad and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Into the Night, Aftermath') :- 
	adult(Age), thriller(Genre), sad(Mood), netflix(Subscription).

% Following series are chosen if age is adult, genre is comedy, mood is happy and subscription is prime
choose_series(Age, Genre, Mood, Subscription, 'Friends, The Big Bang Theory') :- 
	adult(Age), comedy(Genre), happy(Mood), prime(Subscription).

% Following series are chosen if age, genre is kid_scifi, is adult, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Stranger Things, Supergirl') :- 
	kid_scifi(Age, Genre), happy(Mood), netflix(Subscription).
	
% Following series are chosen if age, genre is adult_horror, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Supernatural, Teen Wolf') :- 
	adult_horror(Age, Genre), happy(Mood), netflix(Subscription).

% Following series are chosen if age, genre is adult_horror, mood is sad and subscription is prime
choose_series(Age, Genre, Mood, Subscription, 'The Vampire Diaries, The Purge') :- 
	adult_horror(Age, Genre), sad(Mood), prime(Subscription).

% Following series are chosen if age is adult, genre is scifi, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Outlander, Black Mirror') :- 
	adult(Age), scifi(Genre), happy(Mood), netflix(Subscription).

% Following series are chosen if age is adult, genre is scifi, mood is sad and subscription is prime
choose_series(Age, Genre, Mood, Subscription, 'Upload, The Mandalorian') :- 
	adult(Age), scifi(Genre), sad(Mood), prime(Subscription).

% Following series are chosen if age is kid, genre is action, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Flash, NCIS') :- 
	kid(Age), action(Genre), happy(Mood), netflix(Subscription).

% Following series are chosen if age is adult, genre is romance, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'You, 90 Day Fiance') :- 
	adult(Age), romance(Genre), happy(Mood), netflix(Subscription).

% Following series are chosen if age is kid, genre is animation, mood is happy and subscription is disney
choose_series(Age, Genre, Mood, Subscription, 'The Simpsons, Mr.Bean') :- 
	kid(Age), animation(Genre), happy(Mood), disney(Subscription).

% Following series are chosen if age is adult, genre is fantasy, mood is happy and subscription is netflix
choose_series(Age, Genre, Mood, Subscription, 'Game of Thrones, Legacies') :- 
	adult(Age), fantasy(Genre), happy(Mood), netflix(Subscription).

% Random below choice chosen if all of the above failed
choose_series(_, _, _, _, 'Two and a Half Men instead as there are no matches for the options you chose').


% CF for these rules is 100 because they are definitions.

thriller(Genre) :- Genre = thriller.
comedy(Genre) :- Genre = comedy.
action(Genre) :- Genre = action.
horror(Genre) :- Genre = horror.
scifi(Genre) :- Genre = scifi.
animation(Genre) :- Genre = animation.
romance(Genre) :- Genre = romance.
fantasy(Genre) :- Genre = fantasy.
horror_comedy(Genre) :- Genre = horror_comedy.

netflix(Subscription) :- Subscription = netflix.
prime(Subscription) :- Subscription = prime.
disney(Subscription) :- Subscription = disney.

happy(Mood) :- Mood = happy.
sad(Mood) :- Mood = sad.

% CF for these rules is 90.

gtwo(Length) :- Length > 2.
ltwo(Length) :- Length =< 2.

adult(Age) :- Age > 18.
kid(Age) :- Age =<18.

% CF for these rules is 70.

adult_horror(Age, Genre) :- adult(Age), Genre = horror.
kid_scifi(Age, Genre) :- kid(Age), Genre = scifi.

% This system uses no facts
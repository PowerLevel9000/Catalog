-- catalog of my things schema
--genre table ---
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);



--- music album table ---
CREATE TABLE music_album (
   id serial primary key,
   on_spotify boolean not null,
   publish_date date not null,
   archived boolean not null,
   author_id int references author(id),
   genre_id int references genre(id),
   source_id int references source(id),
   label_id int references label(id)
);


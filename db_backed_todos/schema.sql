CREATE TABLE lists (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

CREATE TABLE todos (
  id serial PRIMARY KEY,
  name text NOT NULL,
  completed BOOLEAN NOT NULL DEFAULT false,
  list_id INTEGER NOT NULL REFERENCES lists (id)
);

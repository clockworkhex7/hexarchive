CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.child as name
  from parents as a, dogs as b
  where a.parent = b.name
  order by b.height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name as name, b.size as size
  from dogs as a, sizes as b
  where a.height <= b.max and b.min < a.height;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name as big, b.name as small, a.size as size
  from size_of_dogs as a, size_of_dogs as b, parents as c, parents as d
  where c.parent = d.parent
  and c.child = a.name
  and d.child = b.name
  and a.name < b.name
  and a.size = b.size
  and a.name <> b.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, "||a.big ||" and "||a.small||", have the same size: "||a.size
  from siblings as a;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE correct AS
  SELECT fur as fur, avg(height) as avgh from dogs group by fur;

CREATE TABLE low_variance AS
  SELECT a.fur, max(a.height)-min(a.height)
    from dogs as a, correct as b
    group by a.fur
    having max(a.height) < 1.3 * b.avgh and min(a.height) > 0.7 * b.avgh;



/* Queries that provide answers to the questions from all projects. */
/* Day 1 */
SELECT * from animals where(name like '%mon');

SELECT name from animals where date_of_birth >= '2016-01-01' and date_of_birth <= '2019-12-31';

SELECT name from animals where neutered = true and escape_attempts < 3;

SELECT date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';

SELECT name, escape_attempts from animals where weight_kg > 10.5;

SELECT * from animals where neutered = true;

SELECT * from animals where name not in('Gabumon');

SELECT * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

/* Day 2 */ 
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * animals;
ROLLBACK;
SELECT * animals;
END;

BEGIN;
UPDATE animals
SET species = 'digimon' where name like '%mon';
UPDATE animals
SET species = 'pokemon' where species is NULL;
SELECT * from animals;
COMMIT;
SELECT * from animals order by id;

BEGIN;
DELETE from animals;
SELECT * from animals;
ROLLBACK;
SELECT * from animals;
END;

BEGIN;
DELETE from animals where date_of_birth > '2022-01-10';
SAVEPOINT delete2022;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK to delete2022;
UPDATE animals
SET weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;

SELECT COUNT(*) from animals;

SELECT COUNT(*) from animals where escape_attempts = 0;

SELECT AVG(weight_kg) from animals;

SELECT neutered, MAX(escape_attempts) from animals group by neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) from animals group by species;

SELECT species, AVG(escape_attempts) from animals
where date_of_birth between '1990-01-01' and '2000-12-12'
group by species;
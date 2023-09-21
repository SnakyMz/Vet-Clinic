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

/* Day 3 */
SELECT full_name as owner, name as animal from animals
JOIN owners ON animals.owner_id = owners.id
where owners.full_name like 'Melody Pond';

SELECT species.name as species, animals.name as animal from animals
JOIN species ON animals.species_id = species.id
where species.name like 'Pokemon';

SELECT owners.full_name as owner, animals.name as animal from owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.name) from species
JOIN animals ON species.id = animals.species_id
group by species.name;

SELECT owners.full_name as owner, animals.name as digimon from animals
JOIN owners ON animals.owner_id = owners.id
where owners.full_name like 'Jennifer Orwell' and animals.species_id = 2;

SELECT owners.full_name as owner, animals.name as animal from animals
JOIN owners ON animals.owner_id = owners.id
where owners.full_name like 'Dean Winchester' and animals.escape_attempts = 0;

SELECT owners.full_name as owner, COUNT(animals.name) as count from animals
JOIN owners ON animals.owner_id = owners.id
group by owners.full_name
order by count DESC
limit 1;

/* Day 4 */
SELECT vets.name as vet, animals.name as animal, visits.date_of_visit from visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
where vets.name like 'William Tatcher'
order by visits.date_of_visit DESC
limit 1;

SELECT vets.name as vet, COUNT(DISTINCT visits.animal_id) from visits
JOIN vets ON visits.vet_id = vets.id
where vets.name like 'Stephanie Mendez'
group by vets.name;

SELECT vets.name as vet, species.name as speciality from specializations
RIGHT JOIN vets ON specializations.vet_id = vets.id
LEFT JOIN species ON specializations.species_id = species.id;

SELECT vets.name as vet, animals.name as animal, visits.date_of_visit from visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
where vets.name like 'Stephanie Mendez' and visits.date_of_visit between '2020-04-01' and '2020-08-30';

SELECT animals.name as animal, COUNT(visits.date_of_visit) as visit_count from visits
JOIN animals ON visits.animal_id = animals.id
group by animals.name
order by visit_count DESC
limit 1;

SELECT vets.name as vet, animals.name as animal, visits.date_of_visit from visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
where vets.name like 'Maisy Smith'
order by visits.date_of_visit
limit 1;

SELECT animals.name as animal_name, species.name as species, animals.weight_kg,
vets.name as vet_name, vets.age as vet_age, visits.date_of_visit from visits
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
JOIN vets ON visits.vet_id = vets.id
order by visits.date_of_visit DESC
limit 1;

SELECT COUNT(date_of_visit) from visits
JOIN animals ON visits.animal_id = animals.id
LEFT JOIN specializations ON visits.vet_id = specializations.vet_id and animals.species_id = specializations.species_id
where specializations.species_id is NULL;

SELECT vets.name as vet, species.name as species, COUNT(species.name) as no_of_visit from visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
where vets.name like 'Maisy Smith'
group by vets.name, species.name
order by no_of_visit DESC
limit 1;
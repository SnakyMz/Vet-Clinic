/* Database schema to keep the structure of entire database. */
/* Day 1 */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20) NOT NULL,
date_of_birth DATE NOT NULL, 
escape_attempts INT, 
neutered BOOLEAN, 
weight_kg DECIMAL(5,2) NOT NULL, 
PRIMARY KEY(id)
);

/* Day 2 */
ALTER TABLE animals ADD species VARCHAR(20);

/* Day 3 */
CREATE table owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(20) NOT NULL,
age INT NOT NULL,
PRIMARY KEY(id)
);

CREATE table species(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20) NOT NULL,
PRIMARY KEY(id)
);

ALTER table animals
DROP column species;

ALTER table animals
ADD species_id INT;

ALTER table animals
ADD CONSTRAINT spid
FOREIGN KEY(species_id)
REFERENCES species(id);

ALTER table animals
ADD owner_id INT;

ALTER table animals
ADD CONSTRAINT owid
FOREIGN KEY(owner_id)
REFERENCES owners(id);

/* Day 4 */
CREATE table vets(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
date_of_graduation DATE NOT NULL,
PRIMARY KEY(id)
);

CREATE table specializations(
vet_id INT NOT NULL,
species_id INT NOT NULL,
PRIMARY KEY(vet_id, species_id),
FOREIGN KEY(vet_id) REFERENCES vets(id),
FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE table visits(
animal_id INT NOT NULL,
vet_id INT NOT NULL,
date_of_visit DATE NOT NULL,
PRIMARY KEY(animal_id, vet_id, date_of_visit),
FOREIGN KEY(animal_id) REFERENCES animals(id),
FOREIGN KEY(vet_id) REFERENCES vets(id)
);
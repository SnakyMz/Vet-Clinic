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
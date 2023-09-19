/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;


CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY,
                                       name VARCHAR(20) NOT NULL,
                                                        date_of_birth DATE NOT NULL,
                                                                           escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL(5,2) NOT NULL,
                                                                                                                                         PRIMARY KEY(id));


CREATE TABLE person (
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(50)  NOT NULL,
   last_name VARCHAR(50),
   dob DATE
);

CREATE TABLE relationship (
   id SERIAL PRIMARY KEY,
   mother_id INT REFERENCES person(id),
   father_id INT REFERENCES person(id),
   child_id INT REFERENCES person(id)
);

INSERT INTO person (first_name, last_name, dob)
     VALUES ('Todd', 'Van Sickle', '1968-09-03'),
            ('Wendi', 'Van Sickle', '1969-06-28'),
            ('Trace', 'Van Sickle', '2002-02-07'),
            ('Riley', 'Van Sickle', '2008-11-03'),
            ('Beverly', 'Aicard', '1946-08-01'),
            ('Warren', 'Massey', '1944-07-08'),
            ('Shannon', 'Polfer', '1969-06-28'),
            ('Todd', 'Massey', '1966-10-30'),
            ('Cord', 'Massey', '1971-07-04'),
            ('Wade', 'Massey', '1972-08-17');

 INSERT INTO relationship (mother_id, father_id, child_id)
     VALUES ('5', '6', '8'),
            ('5', '6', '7'),
            ('5', '6', '2'),
            ('5', '6', '9'),
            ('5', '6', '10'),
            ('2', '1', '3'),
            ('2', '1', '4');


SELECT first_name, last_name, dob FROM person WHERE person.id = relationship.mother_id;

SELECT first_name, last_name, child_id FROM person RIGHT JOIN relationship ON person.id = relationship.mother_id;
SELECT first_name, last_name, FROM person RIGHT JOIN relationship ON person.id = relationship.mother_id;


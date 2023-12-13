USE badass;

CREATE TABLE personnage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    age INT
);

INSERT INTO personnage (nom, age) VALUES ('John Doe', 30);
INSERT INTO personnage (nom, age) VALUES ('Jane Doe', 25);
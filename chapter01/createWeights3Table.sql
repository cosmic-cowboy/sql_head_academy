
CREATE TABLE Weights3(
	class INTEGER NOT NULL,
	student_id INTEGER NOT NULL, 
	Weight INTEGER NOT NULL,
	seq INTEGER,
    Constraint "Weights3_pkey" Primary Key (class, student_id)
);

INSERT INTO Weights3 VALUES(1, 100,50,NULL);
INSERT INTO Weights3 VALUES(1, 101,55,NULL);
INSERT INTO Weights3 VALUES(1, 102,56,NULL);
INSERT INTO Weights3 VALUES(2, 100,60,NULL);
INSERT INTO Weights3 VALUES(2, 101,72,NULL);
INSERT INTO Weights3 VALUES(2, 102,73,NULL);
INSERT INTO Weights3 VALUES(2, 103,73,NULL);
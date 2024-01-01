DROP SCHEMA IF EXISTS Human_Friends;
CREATE SCHEMA Human_Friends;
USE Human_Friends;
-- general class animal
DROP TABLE IF EXISTS animal_classes;
    CREATE TABLE animal_classes (
    animal_classes_id INT AUTO_INCREMENT PRIMARY KEY, 
	Type_class_animal VARCHAR(20)
    );
INSERT INTO animal_classes (Type_class_animal)
VALUES ('вьючные'),
		('домашние'); 
-- home animals
DROP TABLE IF EXISTS home_animals;
    CREATE TABLE home_animals (
    home_animals_id INT AUTO_INCREMENT PRIMARY KEY, 
	type_home_animals VARCHAR(20)
    );
INSERT INTO home_animals (type_home_animals)
	VALUES ('Cat'), 
			('Dog'), 
			('Hamster'); 
-- вьючные животные 
DROP TABLE IF EXISTS Pack_animals;
    CREATE TABLE Pack_animals (
    Pack_animals_id INT AUTO_INCREMENT PRIMARY KEY, 
	type_animals VARCHAR(20)
    );
INSERT INTO Pack_animals (type_animals)
	VALUES ('Horse'), 
			('Camel'),
			('Donkey'); 
-- заполняем домашних животных
-- cat
DROP TABLE IF EXISTS Cat;
    CREATE TABLE Cat (
	id SERIAL PRIMARY KEY,
	name_animal VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	commands LONGTEXT,
    id_class int,
    id_category int
    );
INSERT INTO Cat (name_animal, birth_date, commands, id_class, id_category)
VALUES ("Барсик", "2011-12-23", "Есть, спать, служить", 2, 1),
		("Рыжик", "2019-08-01", "Есть, спать, будить хозяина", 2, 1),
        ("Барсик", "2018-03-12", "Есть, спать, кусь", 2, 1),
        ("Барсик", "2015-06-24", "Есть, спать, мяукать", 2, 1);
        
DROP TABLE IF EXISTS Dog;
    CREATE TABLE Dog (
    id SERIAL PRIMARY KEY,
	name_animal VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	commands LONGTEXT,
    id_class int,
    id_category int
    );
INSERT INTO Dog (name_animal, birth_date, commands, id_class, id_category)
VALUES ("Бобик", "2022-12-23", "Сидеть, лежать", 2, 2),
		("Тузик", "2015-07-01", "Голос, лежать, фас", 2, 2),
        ("Полкан", "2018-07-12", "Сидеть, голос, лежать", 2, 2),
        ("Мухтар", "2012-12-24", "Умер, спать, голос", 2, 2);
        
-- Hamster
DROP TABLE IF EXISTS Hamster;
    CREATE TABLE Hamster (
    id SERIAL PRIMARY KEY,
	name_animal VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	commands LONGTEXT,
    id_class int,
    id_category int
    );
INSERT INTO Hamster (name_animal, birth_date, commands, id_class, id_category)
VALUES ("Флифти", "2022-12-23", "бег, стойка", 2, 3),
		("Бунтарь", "2019-04-01", "переворот, прыжок, фу", 2, 3),
        ("Росс", "2018-07-12", "прыжок, бег, стойка", 2, 3),
        ("Сэм", "2015-06-24", "переворот, прыжок, бег", 2, 3);
        
-- вьючные животные заполнение
-- Horse
DROP TABLE IF EXISTS Horse;
    CREATE TABLE Horse (
    id SERIAL PRIMARY KEY,
	name_animal VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	commands LONGTEXT, 
    id_class int,
    id_category int
    );
INSERT INTO Horse (name_animal, birth_date, commands, id_class, id_category)
VALUES ("Ярость", "2021-12-23", "вперёд, голоп", 1, 1),
		("Лиса", "2019-03-01", "рысь, хоп, шагом", 1, 1),
        ("Победа", "2018-12-12", "тише, стой, лежать", 1, 1),
        ("Непобедимый", "2013-06-24", "вперёд, стой, рысь", 1, 1);
-- Camel
DROP TABLE IF EXISTS Camel;
    CREATE TABLE Camel (
    id SERIAL PRIMARY KEY,
	name_animal VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	commands LONGTEXT,
    id_class int,
    id_category int
    );
INSERT INTO Camel (name_animal, birth_date, commands, id_class, id_category)
VALUES ("Вася", "2017-12-23", "право, лево, пошел", 1, 2),
		("Корабль пустыни", "2019-04-01", "стой, назад, пошел", 1, 2),
        ("Горбатый", "2023-04-12", "тише, стой, назад", 1, 2),
        ("Рыжий", "2010-06-24", "вперёд, стой, сидеть", 1, 2);
        
-- Donkey
DROP TABLE IF EXISTS Donkey;
    CREATE TABLE Donkey (
    id SERIAL PRIMARY KEY,
	name_animal VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	commands LONGTEXT,
    id_class int,
    id_category int
    );
INSERT INTO Donkey (name_animal, birth_date, commands, id_class, id_category)
VALUES ("Ишак", "2017-12-23", "назад, лево, пошел", 1, 3),
		("Ослик", "2021-04-01", "стой, право, пошел", 1, 3),
        ("Мелкий", "2023-12-12", "тише, стой, назад", 1, 3),
        ("Работяга", "2015-06-24", "вперёд, стой, лево", 1, 3);
        
-- удаляем таблицу верблюдов
DROP TABLE IF EXISTS Camel;

-- объединяем таблицы ослов и лошадей
DROP TABLE IF EXISTS Donkey_and_Hourse;
    CREATE TABLE Donkey_and_Hourse AS
	SELECT name_animal, birth_date, commands FROM Horse
	UNION SELECT  name_animal, birth_date, commands FROM Donkey;
    
-- 12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
DROP TABLE IF EXISTS all_animals;
    CREATE TABLE all_animals AS
    SELECT *, round(TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) / 12) AS ear, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) % 12 AS month FROM Cat
	UNION SELECT *, round(TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) / 12) AS ear, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) % 12 AS month FROM Dog
    UNION SELECT *, round(TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) / 12) AS ear, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) % 12 AS month FROM Hamster
    UNION SELECT *, round(TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) / 12) AS ear, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) % 12 AS month FROM Horse
    UNION SELECT *, round(TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) / 12) AS ear, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) % 12 AS month FROM Donkey;

/* 11.Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице */

DROP TABLE IF EXISTS Yong_animals;
    CREATE TABLE Yong_animals AS
	SELECT * FROM all_animals
    WHERE ear > 0.9 and ear < 3.1;



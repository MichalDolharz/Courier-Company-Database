--DEMO

@'D:\OneDrive - Politechnika Wroclawska\Studia\Bazy Danych\Projekt Mzyk\create_db_tables.sql';
@'D:\OneDrive - Politechnika Wroclawska\Studia\Bazy Danych\Projekt Mzyk\proc_add.sql';
@'D:\OneDrive - Politechnika Wroclawska\Studia\Bazy Danych\Projekt Mzyk\proc_del.sql';
@'D:\OneDrive - Politechnika Wroclawska\Studia\Bazy Danych\Projekt Mzyk\proc_print.sql'; 

CALL addAddress('Slowackiego 1', 1, NULL, 'Wroclaw', '50-000');
CALL addAddress('Kiepury 4', 2, 1, 'Jelenia Gora', '58-506');
CALL addAddress('Beethovena', 1, NULL, 'Warszawa', '00-769');

CALL addClient('Slowacki', 'Juliusz', 'juliusz@slowacki.pl', 111111111, 'Slowackiego 1', 1, 'Wroclaw');
CALL addClient('Prus', 'Boleslaw', 'bolek@prus.com', 222222222, 'Kiepury 4', 2, 'Jelenia Gora');
CALL addClient('Gombrowicz', 'Witold', 'geba@geba.pl', 333333333, 'Beethovena', 1, 'Warszawa');

CALL addVehicle('85642968', 60, 30);
CALL addCourier('Mickiewicz', 'Adam', 928573948);

CALL addVehicle('42142100', 60, 30);
CALL addCourier('Reymont', 'Wladyslaw', 123123123);

CALL addParcels('Priorytet', 'L', 10, 20, 5);

CALL addDeal(4, 'Nadejscie do magazynu');

CALL addJob('juliusz@slowacki.pl', 'geba@geba.pl');

CALL printClient('Prus', 'Boleslaw', 'bolek@prus.com');

--CALL delVehicle('42142100');

show tables;
desc employee;
select * from parts_SO;

-- idClient, Fname, Minit, Lname, CPF
insert into clients (Fname, Minit, Lname, CPF)
	values ('Maria', 'M', 'Silva', 123456789),
			('Matheus', 'O', 'Pimentel', 987654321),
            ('Amanda', 'B', 'Donini', 487654321),
            ('Akaua', 'S', 'Costa', 587654321);
select * from clients;

-- idEmployee, Fname, Minit, Lname, CPF
insert into employee (Fname, Minit, Lname, CPF)
	values ('Jose', 'M', 'Silva', 123456788),
			('Mauricio', 'O', 'Pimentel', 987654322),
            ('Joao', 'B', 'Souza', 487654324),
            ('Manoel', 'S', 'Costa', 587654325);
select * from employee;

-- idTeam, Tname
insert into team (Tname)
	values ('Red team'),
			('Blue team'),
            ('Yellow team'),
            ('Pink team');
select * from team;

-- idParts, partDescription, partPrice, serialNumber
insert into parts (partDescription, partPrice, serialNumber)
	values ('blalblabalbalba', 27.90, 13579),
			('bjsdoisjdodood', 68.40, 24680),
            ('nddfjdfjdfjfns', 100, 12345),
            ('ojdiodjfnefpee', 49.90, 67890);
select * from parts;

-- idService, servicePrice, idSClient, idSTeam, identificationNumber
insert into service (servicePrice, idSClient, idSTeam, identificationNumber)
	values (98.60, 1, 1, 12345),
			(120.90, 2, 2, 67890),
            (34.20, 3, 3, 13569),
            (78.90, 4, 4, 24680);
select * from service;

-- idSO, issueDate, deliveryDate, laborPrice, partPrice, SOstatus, serviceType
insert into serviceOrder (issueDate, deliveryDate, laborPrice, partPrice, SOstatus, serviceType)
	values ('2022-04-22', '2022-04-30', 44.50, 27.90, default, 'revisao'),
			('2022-05-23', '2022-05-30', 200.50, 60.40, 'Confirmado', 'conserto'),
            ('2022-06-10', '2022-06-15', 100.00, 100.00, 'Executado', 'conserto'),
            ('2022-07-5', '2022-07-06', 50.44, 49.90, 'Em processamento', 'revisao');
select * from serviceOrder;

-- idVehicle, idVClient, idVTeam, licensePlate, Model, Color
insert into vehicle (idVClient, idVTeam, licensePlate, Model, Color)
	values (1, 1, 'DEF-456', 'Corolla', 'prata'),
			(2, 1, 'ABD-123', 'Corsa', 'preto'),
            (3, 4, 'PQR-567', 'Celta', 'branco'),
            (4, 2, 'GHI-789', 'Tucson', 'preto');
select * from vehicle;

-- idESOemployee, idESOso
insert into employee_makes_SO (idESOemployee, idESOso)
	values (1, 5),
			(2, 6),
            (3, 7),
            (4, 8);
select * from employee_makes_SO;

-- idPSOparts, idPSOserviceOrder
insert into parts_SO (idPSOparts, idPSOserviceOrder)
	values (4, 5),
			(3, 6),
            (2, 7),
            (1, 8);
select * from parts_SO;

-- idSOservice, idSOserviceOrder	
insert into SO_service (idSOservice, idSOserviceOrder)
	values (4, 5),
			(3, 6),
            (2, 7),
            (1, 8);
select * from SO_service;

-- idTEteam, idTEemployee
insert into team_has_employees (idTEteam, idTEemployee)
	values (4, 1),
			(3, 2),
            (2, 3),
            (1, 4);
select * from team_has_employees;

-- Recuperando o numero da placa do veiculo de cada cliente
select concat(Fname, ' ', Lname), CPF, licensePlate from clients, vehicle
	where idVClient = idClient
    order by licensePlate;
    
select concat(Fname, ' ', Lname), CPF from employee, team_has_employees
	where idTEemployee = idEmployee;
    
select concat(Fname, ' ', Lname) as Complete_name, Tname as TeamName, identificationNumber as ServiceIdentificationNumber, idEmployee 
as identificationOfEmployee
	from employee, team
	inner join service on  idTeam = idSTeam
    order by Complete_name;
    




   
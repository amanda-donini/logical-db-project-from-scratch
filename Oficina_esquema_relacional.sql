-- Projeto Oficina - esquema relacional

create database Oficina;
use Oficina;

create table clients (
	idClient int auto_increment primary key, 
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    CPF char(11) not null,
    constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;

create table team(
	idTeam int auto_increment primary key,
    Tname varchar(25)
);
alter table team auto_increment=1;


create table vehicle (
	idVehicle int auto_increment,
    idVClient int,
    idVTeam int,
    licensePlate varchar(25),
    Model varchar (25), 
    Color varchar (10), 
    constraint unique_licensePlate_vehicle unique (licensePlate),
    primary key(idVehicle, idVClient),
    constraint fk_vehicle_client foreign key (idVClient) references clients(idClient),
    constraint fk_vehicle_team foreign key (idVTeam) references team(idTeam)
    );
alter table vehicle auto_increment=1;
    
create table employee(
	idEmployee int auto_increment primary key,
	Fname varchar(10),
	Minit varchar(3),
	Lname varchar (20),
	CPF char(11) not null,
	constraint unique_cpf_employee unique (CPF)
	);
alter table employee auto_increment=1;

create table serviceOrder(
	idSO int auto_increment primary key,
    issueDate date,
    deliveryDate date,
    laborPrice float, 
    partPrice float,
    SOstatus ENUM('Em processamento', 'Confirmado', 'Executado') default 'Em processamento',
    serviceType enum ('conserto' , 'revisao')
    );
alter table serviceOrder auto_increment=1;

create table parts(
	idParts int auto_increment primary key, 
	partDescription varchar (255), 
	partPrice float, 
	serialNumber varchar(50) not null,
	constraint unique_serialNumber_parts unique (serialNumber)
	);
alter table parts auto_increment=1;

create table service(
	idService int auto_increment primary key,
	servicePrice float,
	idSClient int,
	idSTeam int,
	identificationNumber varchar (9),
	constraint unique_identificationNumber_service unique (identificationNumber),
	constraint fk_service_client foreign key (idSClient) references clients(idClient),
	constraint fk_service_team foreign key (idSTeam) references team (idTeam)
);
alter table service auto_increment=1;

create table team_has_employees(
	idTEteam int,
	idTEemployee int,
	primary key (idTEteam, idTEemployee),
	constraint fk_team_employee_team foreign key (idTEteam) references team(idTeam),
	constraint fk_team_employee_employee foreign key (idTEemployee) references employee(idEmployee)
);

create table employee_makes_SO(
	idESOemployee int,
	idESOso int,
	primary key (idESOemployee, idESOso),
	constraint fk_employee_SO_employee foreign key (idESOemployee) references employee(idEmployee),
	constraint fk_employee_SO_service_order foreign key (idESOso) references serviceOrder(idSO)
	);

create table SO_service (
	idSOservice int,
    idSOserviceOrder int,
    primary key (idSOservice, idSOserviceOrder),
    constraint fk_SO_service foreign key (idSOservice) references service(idService),
    constraint fk_SO_serviceOrder foreign key (idSOserviceOrder) references serviceOrder(idSO)
    );

create table parts_SO (
idPSOparts int,
idPSOserviceOrder int,
primary key (idPSOparts, idPSOserviceOrder),
constraint fk_PSO_parts foreign key (idPSOparts) references parts(idParts),
constraint fk_PSO_service_order foreign key (idPSOserviceOrder) references serviceOrder(idSO)
);


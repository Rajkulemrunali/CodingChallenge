Create Database PetPals;

create table pets (
    petid int primary key,                
    pet_name varchar(100),                    
    pet_age int,                              
    pet_breed varchar(100),                   
    pet_type varchar(50),                    
    availableforadoption bit              
);
create table shelters(
	shelter_id int primary key,
	shelter_name varchar(100),
	Shelter_location varchar(255)
);
create table donations(
	donation_id int primary key,
	donar_name varchar(100),
	donation_type varchar(100),
	donation_amount decimal(10,2),
	donation_item varchar(100),
	donation_date datetime
);

create table adoption_events(
	event_id int primary key,
	event_name varchar(100),
	event_date datetime,
	event_location varchar(255)
);

create table participants(
	participant_id int primary key,
	participant_name varchar(100),
	participant_type varchar(50),
	event_id int,
	foreign key (event_id) references adoption_events(event_id)
);

insert into pets (petid, pet_name, pet_age, pet_breed, pet_type, availableforadoption) 
values
(1, 'Buddy', 3, 'Golden Retriever', 'Dog', 1),
(2, 'Michael', 2, 'Siamese', 'Cat', 1),
(3, 'Kio', 5, 'Beagle', 'Dog', 0),
(4, 'Luna', 1, 'Maine Coon', 'Cat', 1),
(5, 'Blackie', 4, 'Bulldog', 'Dog', 1),
(6, 'Bella', 3, 'Persian', 'Cat', 0),
(7, 'Fluffy', 2, 'Mini Rex', 'Rabbit', 1),
(8, 'Squeaky', 1, 'Fancy Rat', 'Rat', 1),
(9, 'Polly', 3, 'African Grey', 'Parrot', 1),
(10, 'Zoe', 1, 'Dachshund', 'Dog', 0),
(11, 'Oliver', 2, 'Ragdoll', 'Cat', 1),
(12, 'Thumper', 4, 'Holland Lop', 'Rabbit', 1);

insert into shelters (shelter_id, shelter_name, shelter_location)
values
(1, 'Happy Tails Shelter', 'MG Road, Bengaluru, Karnataka'),
(2, 'Paws and Claws', 'Rajpath Road, New Delhi, Delhi'),
(3, 'Furry Friends ', 'FC Road, Pune, Maharashtra'),
(4, 'Whiskers Rescue', 'Anna Salai, Chennai, Tamil Nadu'),
(5, 'Barking Buddies', 'Park Street, Kolkata, West Bengal'),
(6, 'Kitty Haven', 'Marine Drive, Mumbai, Maharashtra'),
(7, 'Puppy Pals', 'Banjara Hills, Hyderabad, Telangana'),
(8, 'Pets Paradise', 'Law Garden, Ahmedabad, Gujarat'),
(9, 'Furry Paws', 'Residency Road, Mysuru, Karnataka'),
(10, 'Pawsitive Shelter', 'MG Road, Pune, Maharashtra'),
(11, 'Lucky Paws', 'Jubilee Hills, Hyderabad, Telangana'),
(12, 'Hope for Paws', 'Brigade Road, Bengaluru, Karnataka');

insert into donations (donation_id, donar_name, donation_type, donation_amount, donation_item, donation_date) 
values
(1, 'Mrunali Rajkule', 'Cash', 100.00, null, '2024-09-01 10:30:00'),
(2, 'Ankita Raut', 'Item', null, 'Dog Food', '2024-09-02 14:45:00'),
(3, 'Mona Ray', 'Cash', 250.00, null, '2024-09-03 09:15:00'),
(4, 'Sarah Tendulkar', 'Item', null, 'Cat Toys', '2024-09-04 12:00:00'),
(5, 'Isha Daye', 'Cash', 75.00, null, '2024-09-05 11:00:00'),
(6, 'Ravi Singh', 'Item', null, 'Rabbit Food', '2024-09-06 15:30:00'),
(7, 'Mohan Joshi', 'Cash', 150.00, null, '2024-09-07 09:45:00'),
(8, 'Dhruv Rathi', 'Item', null, 'Rat Cages', '2024-09-08 16:00:00'),
(9, 'Priya Sharma', 'Cash', 50.00, null, '2024-09-09 10:15:00'),
(10, 'Mira Desai', 'Item', null, 'Parrot Toys', '2024-09-10 13:30:00'),
(11, 'Swapnil Kote', 'Cash', 200.00, null, '2024-09-11 08:45:00'),
(12, 'Malti Marry ', 'Item', null, 'Pet Beds', '2024-09-12 17:00:00');

insert into adoption_events (event_id, event_name, event_date, event_location) 
values
(1, 'Adopt-a-Pet Day', '2024-09-15 10:00:00', 'Osho Garden, Pune'),
(2, 'Paws in the Park', '2024-09-20 11:00:00', 'India Gate, New Delhi'),
(3, 'Furry Friends Fest', '2024-09-25 09:00:00', 'Kothi Bagh, Srinagar'),
(4, 'Pets Parade', '2024-09-30 13:00:00', 'Marine Drive, Mumbai'),
(5, 'Adopt Love Event', '2024-10-05 12:00:00', 'Nehru Planetarium, Mumbai'),
(6, 'Puppy Adoption Fair', '2024-10-10 10:30:00', 'Sanjay Gandhi National Park, Mumbai'),
(7, 'Kitten Carnival', '2024-10-15 14:00:00', 'Brigade Road, Bengaluru'),
(8, 'Rescue Rally', '2024-10-20 16:00:00', 'Lodi Gardens, New Delhi'),
(9, 'Adoption Extravaganza', '2024-10-25 11:30:00', 'Bal Bhavan, Pune'),
(10, 'Furry Family Fun Day', '2024-10-30 10:00:00', 'Jawaharlal Nehru Stadium, Delhi'),
(11, 'Pet Palooza', '2024-11-05 09:30:00', 'Nandi Hills, Karnataka'),
(12, 'Forever Home Fair', '2024-11-10 12:30:00', 'Sankey Tank, Bengaluru');

insert into participants (participant_id, participant_name, participant_type, event_id) values
(1, 'Happy Tails Shelter', 'Shelter', 1),
(2, 'Mrunali Rajkule', 'Adopter', 1),
(3, 'Paws and Claws', 'Shelter', 2),
(4, 'Ankita Raut', 'Adopter', 2),
(5, 'Furry Friends', 'Shelter', 3),
(6, 'Mona Ray', 'Adopter', 3),
(7, 'Whiskers Rescue', 'Shelter', 4),
(8, 'Sarah Tendulkar', 'Adopter', 4),
(9, 'Barking Buddies', 'Shelter', 5),
(10, 'Isha Daye', 'Adopter', 5),
(11, 'Kitty Haven', 'Shelter', 6),
(12, 'Ravi Singh', 'Adopter', 6);

select * from pets;
select * from shelters;
select * from donations;
select * from adoption_events;
select * from participants;

--5) Write an SQL query that retrieves a list of available pets (those marked as available for adoption)
--from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that
--the query filters out pets that are not available for adoption.

select pet_name, pet_age, pet_breed, pet_type
from pets
where availableforadoption=1;


--6)Write an SQL query that retrieves the names of participants (shelters and adopters) registered
--for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query
--joins the necessary tables to retrieve the participant names and types.

select  p.participant_name, p.participant_type
from participants p
inner join adoption_events ae on p.event_id=ae.event_id
where ae.event_id=3;

--7)Create a stored procedure in SQL that allows a shelter to update its information (name and
--location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information.
--Ensure that the procedure performs the update and handles potential errors, such as an invalid
--shelter ID.
create procedure shelter_info_updation(
    @shelter_id int,
    @new_name varchar(255),
    @new_location varchar(255)
)
as
begin
    update shelters
    set shelter_name = @new_name,              
        shelter_location = @new_location       
    where shelter_id = @shelter_id;             

    select 'shelter information updated successfully.' as message;
end;

exec shelter_info_updation @shelter_id = 1, @new_name = 'Pets and Paws', @new_location = 'Alandi,Pune,Maharshtra';

select * from shelters;


--8)Write an SQL query that calculates and retrieves the total donation amount for each shelter (by
--shelter name) from the "Donations" table. The result should include the shelter name and the
--total donation amount. Ensure that the query handles cases where a shelter has received no donations.

alter table donations
add shelter_id int;

alter table donations
add constraint fk_shelter
foreign key (shelter_id) references shelters(shelter_id);

update donations set shelter_id = 1 where donation_id=11; 
update donations set shelter_id = 2 where donation_id=10 ; 
update donations set shelter_id = 3 where donation_id=9 ; 
update donations set shelter_id = 1 where donation_id=8 ; 
update donations set shelter_id = 1 where donation_id=7 ; 
update donations set shelter_id = 3 where donation_id=6 ; 
update donations set shelter_id = 1 where donation_id=5 ; 
update donations set shelter_id = 4 where donation_id=4 ; 
update donations set shelter_id = 1 where donation_id=3 ; 
update donations set shelter_id = 1 where donation_id=2 ; 
update donations set shelter_id = 1 where donation_id=1 ; 

select 
    s.shelter_name,
    coalesce(sum(d.donation_amount), 0) as total_donation
from 
    shelters s
left join 
    donations d on s.shelter_id = d.shelter_id
group by 
    s.shelter_id, s.shelter_name
order by 
    s.shelter_name;

--9)Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an
--owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result
--set.

ALTER TABLE pets
ADD owner_id int;

create table owners(
owner_id int primary key, 
owner_name varchar(100),
owner_location varchar(100)
);

insert into owners (owner_id, owner_name, owner_location) values
(1, 'Rajesh Kumar', 'Mumbai'),
(2, 'Anita Sharma', 'Delhi'),
(3, 'Sunil Verma', 'Pune');

ALTER TABLE pets
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id) REFERENCES owners(owner_id);

update pets set owner_id=2 where petid=2;
update pets set owner_id=1 where petid=3;
update pets set owner_id=3 where petid=5;

select 
    pet_name,
    pet_age,
    pet_breed,
    pet_type
from 
    pets
where 
    owner_id is null;


--10)Write an SQL query that retrieves the total donation amount for each month and year (e.g.,
--January 2023) from the "Donations" table. The result should include the month-year and the
--corresponding total donation amount. Ensure that the query handles cases where no donations
--were made in a specific month-year.

select 
    format(donation_date, 'MMMM yyyy') as month_year,
    sum(coalesce(donation_amount, 0)) as total_donation_amount
from 
    donations
group by 
    format(donation_date, 'MMMM yyyy'), 
    year(donation_date), 
    month(donation_date)
order by 
    year(donation_date), 
    month(donation_date);


--11)11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older
--than 5 years

select DISTINCT pet_breed
from pets
where (pet_age BETWEEN 1 AND 3) OR (pet_age > 5);

--12)Retrieve a list of pets and their respective shelters where the pets are currently available for
--adoption.
select 
    p.petid,
    p.pet_name as pet_name,
    s.shelter_name,
    s.shelter_location
from 
    pets p
join 
    shelters s on p.shelter_id = s.shelter_id
where 
    p.availableforadoption = 1;  



--13)Find the total number of participants in events organized by shelters located in specific city.
--Example: City=Chennai

--Executing query with location city= Mumbai
SELECT COUNT(p.participant_id) AS total_participants
FROM participants p
JOIN adoption_events ae ON ae.event_id = p.event_id
WHERE ae.event_location like '%Mumbai%';

--14)Retrieve a list of unique breeds for pets with ages between 1 and 5 years.

select distinct pet_breed
from pets
where pet_age BETWEEN 1 AND 5;



--15)Find the pets that have not been adopted by selecting their information from the 'Pet' table.

select * from pets 
where owner_id is Null;

--16)Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and 'User' tables.

--Skipped due to changes are required to be made in the database scema.

--17)Retrieve a list of all shelters along with the count of pets currently available for adoption in each shelter.

--Pets table requires to be altered
alter table pets
add shelter_id int;

update pets set shelter_id = 2 where petid =10;
update pets set shelter_id = 1 where petid =9;
update pets set shelter_id = 3 where petid =8;
update pets set shelter_id = 4 where petid =7;
update pets set shelter_id = 5 where petid =6;
update pets set shelter_id = 6 where petid =5;
update pets set shelter_id = 9 where petid =4;
update pets set shelter_id = 10 where petid =3;
update pets set shelter_id = 11 where petid =2;

select 
    s.shelter_name,
    COUNT(p.petid) AS available_pets_count
from 
    shelters s
left join
    pets p on s.shelter_id = p.shelter_id
where 
    p.availableforadoption = 1
group by
    s.shelter_name;

--18)Find pairs of pets from the same shelter that have the same breed.

select 
    p1.petid as pet1_id,
    p1.pet_name as pet1_name,
    p2.petid as pet2_id,
    p2.pet_name as pet2_name,
    p1.pet_breed,
    p1.shelter_id
from 
    pets p1
join 
    pets p2 on p1.shelter_id = p2.shelter_id 
           and p1.pet_breed = p2.pet_breed 
           and p1.petid < p2.petid;

--19)List all possible combinations of shelters and adoption events.
select 
    s.shelter_name,
    e.event_name,
    e.event_date,
    e.event_location as event_location
from 
    shelters s
cross join 
    adoption_events e;

--20)Determine the shelter that has the highest number of adopted pets.

--TABLE REQUIRES TO HAVE NO. OF AVAILBLE PETSFOR ADOPTION, HENCE TABLE shelters have been altered

select * from shelters;

alter table shelters
add pets_available_for_adoption int

update shelters set pets_available_for_adoption=2 where shelter_id=1;
update shelters set pets_available_for_adoption=5 where shelter_id=2;
update shelters set pets_available_for_adoption=7 where shelter_id=3;
update shelters set pets_available_for_adoption=3 where shelter_id=4;
update shelters set pets_available_for_adoption=1 where shelter_id=5;
update shelters set pets_available_for_adoption=10 where shelter_id=6;
update shelters set pets_available_for_adoption=9 where shelter_id=7;
update shelters set pets_available_for_adoption=7 where shelter_id=8;
update shelters set pets_available_for_adoption=2 where shelter_id=9;
update shelters set pets_available_for_adoption=3 where shelter_id=10;
update shelters set pets_available_for_adoption=2 where shelter_id=11
update shelters set pets_available_for_adoption=5 where shelter_id=12;
 
select shelter_id, shelter_name, shelter_location ,pets_available_for_adoption
from shelters
where pets_available_for_adoption=
	(select MAX(pets_available_for_adoption)
	from shelters)
;


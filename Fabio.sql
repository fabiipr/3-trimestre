-- 1. 

delimiter $$
drop function if exists is_free $$
create function is_free(par_bike_id int(5), par_datetime datetime)
returns boolean
begin 
    return (
        select if(par_datetime < end_dt && par_datetime > ini_dt, True, False)
        from rental
        where par_bike_id = bike_id
    );
end $$
delimiter ;


-- 2. 

delimiter $$
drop function if exists count_free $$
create function count_free(par_color varchar(40))
returns int
begin
    return (
        select count(bike_id)
        from rental r, bike b
        where r.bike_id = b.bike_id
        and par_color = b.color
        and instante between ini_dt and ifnull(end_dt, CURRENT_TIMESTAMP)
    );
end $$
delimiter ;


-- 3.

delimiter $$
drop procedure if exists devolution $$
create procedure devolution(par_bike_id int(5), out ret_trueorfalse boolean)
    begin
    if par_bike_id is not null then
        insert into rental (email, bike_id, ini_dt, end_dt)
        values (null, par_bike_id, null, current_timestamp )
        set ret_trueorfalse = true
        select ret_trueorfalse;
    else
        set ret_trueorfalse = false
        select ret_trueorfalse;
    end if;
end $$
delimiter ;


-- 4
hora
delimiter $$
drop trigger if exists no_overlapping $$
create trigger no_overlapping
before update on rental
for each row 
begin
    if new.ini_dt >= old.end_dt then 
        signal sqlstate '45000'
        set message_text = 'No se ha podido realizar la operación';
    else 
        insert into new.ini_dt
        set new.end_dt = null;
    end if;
end $$
delimiter ;


-- 5. 

delimiter $$
drop trigger if exists only_one_rent $$
create trigger only_one_rent
before insert on rental
for each row
begin
    if new.email = true then
    signal sqlstate '45000'
    set message_text = 'Este cliente ya tiene una bici prestada';
    end if;
end $$
delimiter ;
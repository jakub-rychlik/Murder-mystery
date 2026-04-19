SELECT  date,
        TO_DATE(CAST(date AS VARCHAR ), 'YYYYMMDD') AS date_check,
        type,
        description,
        city
FROM crime_scene_report
WHERE type = 'murder'
AND city = 'SQL City'
AND date = 20180115;

SELECT * FROM witnesses;

SELECT witnesses.id AS person_id,
    name,
    transcript
FROM witnesses LEFT JOIN interview ON witnesses.id = interview.person_id;

SELECT * FROM alice_gym_time;

SELECT * FROM suspect_check_ins;

SELECT person.name
FROM person JOIN drivers_license ON license_id = drivers_license.id
WHERE plate_number LIKE '%%H42W%%'
AND person.id IN
    (SELECT person_id
     FROM suspect_check_ins JOIN get_fit_now_member ON membership_id = id
     WHERE membership_id = get_fit_now_member.id);

SELECT person_id,
       name,
       transcript
FROM interview JOIN person ON person_id = id
WHERE name = 'Jeremy Bowers';

SELECT person.name,
       height,
       hair_color,
       car_make,
       car_model,
       event_name,
       annual_income,
       COUNT(date) AS number_of_attendences
FROM person JOIN drivers_license ON license_id = drivers_license.id
            JOIN facebook_event_checkin ON person.id = person_id
            JOIN income ON person.ssn = income.ssn
WHERE height BETWEEN 65 AND 67
AND hair_color = 'red'
AND car_make = 'Tesla'
GROUP BY person.name, height, hair_color, car_make, car_model, event_name, annual_income;
DROP VIEW IF EXISTS suspect_check_ins;
DROP VIEW IF EXISTS alice_gym_time;
DROP VIEW IF EXISTS witnesses;

CREATE VIEW witnesses AS
SELECT *
FROM person
WHERE (address_street_name = 'Northwestern Dr'
        AND address_number >= ALL(SELECT address_number FROM person))
OR (address_street_name = 'Franklin Ave' AND name LIKE 'Annabel%');

CREATE VIEW alice_gym_time AS
SELECT membership_id,
       check_in_date,
       check_in_time,
       check_out_time
FROM get_fit_now_check_in JOIN get_fit_now_member ON membership_id = id
WHERE check_in_date = 20180109
AND membership_id IN
    (SELECT get_fit_now_member.id
    FROM witnesses JOIN get_fit_now_member ON witnesses.id = get_fit_now_member.person_id
    WHERE witnesses.id = 16371);

CREATE VIEW suspect_check_ins AS
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109
AND check_in_time + check_out_time BETWEEN
        (SELECT (check_in_time + check_out_time) - (check_out_time - check_in_time) FROM alice_gym_time)
         AND
        (SELECT (check_in_time + check_out_time) + (check_out_time - check_in_time) FROM alice_gym_time)
AND membership_id <> (SELECT membership_id FROM alice_gym_time)
AND membership_id LIKE '48Z%';
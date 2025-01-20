SELECT
user_id
FROM emails
JOIN texts USING(email_id)
WHERE signup_action = 'Confirmed' AND  EXTRACT(DAY FROM action_date - signup_date)::INT = 1

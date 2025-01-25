CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30))
    LANGUAGE plpgsql
AS
$$
DECLARE
    account_id INT;
BEGIN
    SELECT INTO account_id ACC.id
    FROM accounts ACC
             JOIN addresses ADD ON ACC.id = ADD.account_id
    WHERE ADD.street = address_street
      AND ADD.town = address_town;
    IF account_id IS NULL THEN
        RETURN;
    END IF;

    UPDATE accounts
    SET job_title = concat('(Remote) ', job_title)
    WHERE id = account_id;
END
$$;
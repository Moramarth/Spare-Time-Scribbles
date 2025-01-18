CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC(1000, 4))
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF money_amount <= 0 THEN
        RETURN;
    END IF;
    IF (SELECT id FROM accounts WHERE id = account_id) IS NULL THEN
        RETURN;
    END IF;

    UPDATE accounts
    SET balance = balance + money_amount
    WHERE id = account_id;
END
$$;
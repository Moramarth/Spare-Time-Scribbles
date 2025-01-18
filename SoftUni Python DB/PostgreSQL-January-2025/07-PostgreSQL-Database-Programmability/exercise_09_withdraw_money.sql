CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INT, money_amount NUMERIC(1000, 4))
    LANGUAGE plpgsql
AS
$$
DECLARE
    current_balance NUMERIC;
    current_id      INT;
BEGIN
    IF money_amount <= 0 THEN
        RETURN;
    END IF;

    SELECT id, balance
    INTO current_id, current_balance
    FROM accounts
    WHERE id = account_id;

    IF current_id IS NULL THEN
        RETURN;
    ELSEIF current_balance < money_amount THEN
        RAISE NOTICE 'NOTICE: Insufficient balance to withdraw %', money_amount;
        RETURN;
    END IF;

    UPDATE accounts
    SET balance = balance - money_amount
    WHERE id = account_id;
END
$$;
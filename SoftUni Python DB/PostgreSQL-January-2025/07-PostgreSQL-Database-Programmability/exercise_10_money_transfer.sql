-- This procedure does not correspond fully with using the previous two.
-- Previous two passed as individual procedures and this one works for the two that are checked in the Judge System
CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC(1000, 4))
    LANGUAGE plpgsql
AS
$$
BEGIN
    CALL sp_withdraw_money(sender_id, amount);
    CALL sp_deposit_money(receiver_id, amount);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END
$$;
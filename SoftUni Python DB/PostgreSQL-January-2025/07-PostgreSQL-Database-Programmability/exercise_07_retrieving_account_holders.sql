CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
    LANGUAGE plpgsql
AS
$$
DECLARE
    f_name        VARCHAR;
    l_name        VARCHAR;
    total_balance NUMERIC;
    account_holders_totals CURSOR FOR SELECT first_name,
                                             last_name,
                                             SUM(balance)
                                      FROM account_holders AH
                                               JOIN accounts A on AH.id = A.account_holder_id
                                      GROUP BY first_name, last_name
                                      ORDER BY first_name, last_name;
BEGIN
    OPEN account_holders_totals;
    LOOP
        FETCH NEXT FROM account_holders_totals into f_name, l_name, total_balance;
        EXIT WHEN NOT FOUND;
        IF total_balance >= searched_balance THEN
            RAISE NOTICE 'NOTICE: % % - %', f_name, l_name, total_balance;
        END IF;
    END LOOP;
END
$$;

CALL sp_retrieving_holders_with_balance_higher_than(200000)
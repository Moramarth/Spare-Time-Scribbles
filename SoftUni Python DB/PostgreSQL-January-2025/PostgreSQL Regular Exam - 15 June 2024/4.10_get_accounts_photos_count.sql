CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
    RETURNS INT
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN (SELECT count(*)
            FROM accounts A
                     JOIN accounts_photos AP ON A.id = AP.account_id
            WHERE A.username = account_username);
END
$$;
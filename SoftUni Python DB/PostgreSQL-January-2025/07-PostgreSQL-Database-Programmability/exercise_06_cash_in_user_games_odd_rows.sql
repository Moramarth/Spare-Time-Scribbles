CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
    RETURNS TABLE
            (
                total_cash NUMERIC
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY (WITH game_info AS (SELECT UG.cash,
                                            row_number() OVER (ORDER BY UG.cash DESC) AS row_rank
                                     FROM users_games UG
                                              JOIN games G ON G.id = UG.game_id
                                     WHERE G.name = game_name)
                  SELECT TRUNC(SUM(cash), 2)
                  FROM game_info
                  WHERE row_rank % 2 <> 0);
END;
$$;
CREATE OR REPLACE PROCEDURE udp_awarded_production(production_title VARCHAR(70))
    LANGUAGE plpgsql
AS
$$
DECLARE
BEGIN
    UPDATE actors
    SET awards = awards + 1
    WHERE id IN (SELECT A.id
                 FROM actors A
                          JOIN productions_actors PA on A.id = pa.actor_id
                          JOIN productions p on PA.production_id = p.id
                 WHERE P.title = production_title);
END
$$;
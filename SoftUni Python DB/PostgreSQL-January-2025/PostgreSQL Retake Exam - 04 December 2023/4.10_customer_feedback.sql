CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(product_name VARCHAR(25))
    RETURNS TABLE
            (
                customer_id          INT,
                customer_name        VARCHAR(75),
                feedback_description VARCHAR(255),
                feedback_rate        NUMERIC(4, 2)
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY (SELECT C.id          AS customer_id,
                         C.first_name  AS customer_name,
                         F.description AS feedback_description,
                         F.rate        AS feedback_Rate
                  FROM products P
                           JOIN feedbacks F ON P.id = F.product_id
                           JOIN customers C ON F.customer_id = C.id
                  WHERE P.name = product_name
                  ORDER BY C.id);
END
$$;
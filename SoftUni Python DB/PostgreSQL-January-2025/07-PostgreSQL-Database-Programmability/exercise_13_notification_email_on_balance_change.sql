CREATE TABLE notification_emails
(
    id           SERIAL PRIMARY KEY,
    recipient_id INT,
    subject      VARCHAR,
    body         VARCHAR
);

CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
DECLARE

BEGIN

    INSERT INTO notification_emails (recipient_id, subject, body)
    VALUES (OLD.account_id,
            ('Balance change for account: %', NEW.account_id),
            ('On % your balance was changed from % to %.', DATE(now()), NEW.old_sum, NEW.new_sum));
    RETURN NEW;
END
$$;

CREATE OR REPLACE TRIGGER tr_send_email_on_balance_change
    AFTER UPDATE
    ON logs
    FOR EACH ROW
EXECUTE PROCEDURE trigger_fn_send_email_on_balance_change();
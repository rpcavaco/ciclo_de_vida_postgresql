
-------------------------------------------------
-- Colunas a usar
-------------------------------------------------

ALTER TABLE schemax.tabela_a
    ADD COLUMN utilizador character varying(64),
    ADD COLUMN data_criacao timestamp without time zone,
    ADD COLUMN data_atualizacao timestamp without time zone;
    

-------------------------------------------------
-- Registo de criação de objeto
-------------------------------------------------

CREATE FUNCTION schemax.tr_ins()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
	NEW.utilizador := current_user;
	NEW.data_criacao := now();
	RETURN NEW;
END;
$BODY$;

CREATE TRIGGER tr_criacao
    BEFORE INSERT
    ON schemax.tabela_a
    FOR EACH ROW
    EXECUTE PROCEDURE schemax.tr_ins();


-------------------------------------------------
-- Registo de alteração de objeto
-------------------------------------------------

CREATE FUNCTION schemax.tr_upd()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
	NEW.utilizador := current_user;
	NEW.data_atualizacao := now();
	RETURN NEW;
END;
$BODY$;

CREATE TRIGGER tr_atualizacao
    BEFORE UPDATE
    ON schemax.tabela_a
    FOR EACH ROW
    EXECUTE PROCEDURE schemax.tr_upd();

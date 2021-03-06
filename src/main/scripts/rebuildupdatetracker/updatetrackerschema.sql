--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: latestkey; Type: TABLE; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE TABLE latestkey (
    id boolean NOT NULL,
    key bigint NOT NULL
);


ALTER TABLE public.latestkey OWNER TO "domsUpdateTracker";

--
-- Name: memberships; Type: TABLE; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE TABLE memberships (
    viewangle character varying(64) NOT NULL,
    entrypid character varying(64) NOT NULL,
    collection character varying(64) NOT NULL,
    objectpid character varying(64)
);


ALTER TABLE public.memberships OWNER TO "domsUpdateTracker";

--
-- Name: records; Type: TABLE; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE TABLE records (
    viewangle character varying(64) NOT NULL,
    entrypid character varying(64) NOT NULL,
    collection character varying(64) NOT NULL,
    lastmodified timestamp with time zone,
    active timestamp with time zone,
    deleted timestamp with time zone,
    inactive timestamp with time zone
);


ALTER TABLE public.records OWNER TO "domsUpdateTracker";

--
-- Name: latestkey_pkey; Type: CONSTRAINT; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

ALTER TABLE ONLY latestkey
    ADD CONSTRAINT latestkey_pkey PRIMARY KEY (id);


--
-- Name: records_pkey; Type: CONSTRAINT; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

ALTER TABLE ONLY records
    ADD CONSTRAINT records_pkey PRIMARY KEY (viewangle, entrypid, collection);


--
-- Name: entrypid_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX entrypid_idx ON records USING btree (entrypid);


--
-- Name: memberships_objects_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX memberships_objects_idx ON memberships USING btree (objectpid);


--
-- Name: memberships_records_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX memberships_records_idx ON memberships USING btree (viewangle, entrypid, collection);


--
-- Name: records_active_notnull_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX records_active_notnull_idx ON records USING btree (lastmodified, viewangle, collection) WHERE ((deleted IS NOT NULL) OR (active IS NOT NULL));


--
-- Name: records_all_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX records_all_idx ON records USING btree (lastmodified, viewangle, collection);


--
-- Name: records_deleted_notnull_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX records_deleted_notnull_idx ON records USING btree (lastmodified, viewangle, collection) WHERE (deleted IS NOT NULL);


--
-- Name: records_inactive_notnull_idx; Type: INDEX; Schema: public; Owner: domsUpdateTracker; Tablespace: 
--

CREATE INDEX records_inactive_notnull_idx ON records USING btree (lastmodified, viewangle, collection) WHERE ((deleted IS NOT NULL) OR (inactive IS NOT NULL));


--
-- Name: fk_k2lqbw3w3301chc41h4ga03kh; Type: FK CONSTRAINT; Schema: public; Owner: domsUpdateTracker
--

ALTER TABLE ONLY memberships
    ADD CONSTRAINT fk_k2lqbw3w3301chc41h4ga03kh FOREIGN KEY (viewangle, entrypid, collection) REFERENCES records(viewangle, entrypid, collection);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


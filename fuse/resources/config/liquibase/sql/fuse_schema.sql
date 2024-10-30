CREATE TABLE environment (
    id uuid NOT NULL,
    description character varying(255),
    enabled boolean,
    name character varying(64),
    type character varying(64),
    owners character varying(255)
);

CREATE TABLE fuse_config (
    component character varying(255),
    type character varying(255),
    value character varying(255)
);

CREATE TABLE fuse_user (
    id uuid NOT NULL,
    username character varying(255),
    active boolean,
    email character varying(255),
    password character varying(255),
    type character varying(255)
);

CREATE TABLE otcssystem_config (
    id bigint NOT NULL,
    data_time_stamp timestamp without time zone,
    is_global boolean,
    keyword character varying(255),
    require_restart boolean,
    section character varying(255),
    type character varying(255),
    value character varying(255),
    system_id character varying(255)
);

CREATE TABLE system (
    id uuid NOT NULL,
    activation_status character varying(255),
    app_name character varying(64),
    app_build_number character varying(64),
    description character varying(128),
    enabled boolean,
    name character varying(64),
    app_password character varying(64),
    app_port integer,
    secret_key character varying(64),
    app_type character varying(64),
    app_update_version character varying(64),
    app_url character varying(128),
    app_username character varying(64),
    app_version character varying(64),
    environment_id uuid,
    owners character varying(255)
);

CREATE TABLE system_tag (
    id uuid NOT NULL,
    name character varying(128) NOT NULL
);

CREATE TABLE system_tags (
    system_id uuid NOT NULL,
    system_tag_id uuid NOT NULL
);

CREATE TABLE environment_tag (
    id uuid NOT NULL,
    name character varying(128) NOT NULL
);

CREATE TABLE environment_tags (
    environment_id uuid NOT NULL,
    environment_tag_id uuid NOT NULL
);

ALTER TABLE ONLY environment
    ADD CONSTRAINT environment_pkey PRIMARY KEY (id);

ALTER TABLE ONLY fuse_config
    ADD CONSTRAINT fuse_config_pkey PRIMARY KEY (component, type);

ALTER TABLE ONLY fuse_user
    ADD CONSTRAINT fuse_user_pkey PRIMARY KEY (id);

-- ALTER TABLE ONLY system_jobs
--     ADD CONSTRAINT system_jobs_pkey PRIMARY KEY (id);

ALTER TABLE ONLY system
    ADD CONSTRAINT system_pkey PRIMARY KEY (id);

ALTER TABLE ONLY system_tag
    ADD CONSTRAINT system_tag_pkey PRIMARY KEY (id);

ALTER TABLE ONLY system_tag
    ADD CONSTRAINT uk_3ecjwf6693ed4l6wh2gw01txg UNIQUE (name);

ALTER TABLE ONLY environment
    ADD CONSTRAINT uk_fdb0ohhfysiwxy88s7k80bx90 UNIQUE (name);

-- ALTER TABLE ONLY system_jobs
--     ADD CONSTRAINT ukiqnv75jm86f1ouv0n2fqpraa2 UNIQUE (timestamp, id, system_id);

ALTER TABLE ONLY system_tags
    ADD CONSTRAINT fk2tvav5j2rt04a0xtwq64q1l93 FOREIGN KEY (system_tag_id) REFERENCES system_tag(id);

-- ALTER TABLE ONLY system_jobs
--     ADD CONSTRAINT fkaoyv0ah3pbt49h7vcl8pj3a2s FOREIGN KEY (system_id) REFERENCES system(id);

ALTER TABLE ONLY system
    ADD CONSTRAINT fkimep7u9bj10iymvnp47lc6e1l FOREIGN KEY (environment_id) REFERENCES environment(id);

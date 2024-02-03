-- Table: public.article

-- DROP TABLE IF EXISTS article;

CREATE TABLE IF NOT EXISTS article
(
    article_id SERIAL PRIMARY KEY,
    title character varying(100) NOT NULL,
    content text NOT NULL,
    create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_original boolean NOT NULL DEFAULT TRUE,
    is_delete boolean DEFAULT FALSE,
    keyword character varying
);



-- Table: public.article_tag_mapping

-- DROP TABLE IF EXISTS public.article_tag_mapping;

CREATE TABLE IF NOT EXISTS public.article_tag_mapping
(
    article_tag_mapping_id SERIAL PRIMARY KEY,
    tag_id integer NOT NULL,
    article_id integer NOT NULL,
    is_delete boolean DEFAULT false
);

-- Table: public.tag

-- DROP TABLE IF EXISTS public.tag;

CREATE TABLE IF NOT EXISTS public.tag
(
    tag_id SERIAL PRIMARY KEY,
    tag_name character varying(50) NOT NULL,
    create_time timestamp DEFAULT CURRENT_TIMESTAMP,
    last_update_time timestamp DEFAULT CURRENT_TIMESTAMP,
    is_delete boolean DEFAULT false
);

INSERT INTO public.article (title, content, create_time, last_update_time, is_original, is_delete, keyword) VALUES ('First Article', 'First Article', '2024-01-29 16:44:59.987096', '2024-01-29 16:44:59.987096', true, false, 'First Article');
INSERT INTO public.article (title, content, create_time, last_update_time, is_original, is_delete, keyword) VALUES ('Second Article', 'Second Article', '2024-01-29 16:44:59.987096', '2024-01-29 16:44:59.987096', true, false, 'Second Article');
INSERT INTO public.article (title, content, create_time, last_update_time, is_original, is_delete, keyword) VALUES ('Third Article', 'Third Article', '2024-01-29 16:44:59.987096', '2024-01-29 16:44:59.987096', true, false, 'Third Article');

INSERT INTO public.article_tag_mapping (tag_id, article_id, is_delete) VALUES (1, 1, false);
INSERT INTO public.article_tag_mapping (tag_id, article_id, is_delete) VALUES (2, 2, false);
INSERT INTO public.article_tag_mapping (tag_id, article_id, is_delete) VALUES (2, 3, false);

INSERT INTO public.tag (tag_name, create_time, last_update_time, is_delete) VALUES ('Website Updating Log', '2024-01-29 16:46:20.225546', '2024-01-29 16:46:20.225546', false);
INSERT INTO public.tag (tag_name, create_time, last_update_time, is_delete) VALUES ('Diary', '2024-01-29 16:46:20.225546', '2024-01-29 16:46:20.225546', false);
INSERT INTO public.tag (tag_name, create_time, last_update_time, is_delete) VALUES ('Interests', '2024-01-29 16:46:20.225546', '2024-01-29 16:46:20.225546', false);

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
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
-- Name: bugs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bugs (
    id integer NOT NULL,
    description text,
    user_id integer,
    project_id integer,
    test_case_id integer,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bugs OWNER TO postgres;

--
-- Name: bugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bugs_id_seq OWNER TO postgres;

--
-- Name: bugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bugs_id_seq OWNED BY bugs.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    task_id integer,
    message text,
    approved boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: commits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE commits (
    id integer NOT NULL,
    url character varying(255),
    sha character varying(255),
    author_name character varying(255),
    author_email character varying(255),
    date character varying(255),
    message character varying(255),
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.commits OWNER TO postgres;

--
-- Name: commits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE commits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commits_id_seq OWNER TO postgres;

--
-- Name: commits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE commits_id_seq OWNED BY commits.id;


--
-- Name: document_project_requirements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_project_requirements (
    id integer NOT NULL,
    document_project_id integer,
    requirement_id integer
);


ALTER TABLE public.document_project_requirements OWNER TO postgres;

--
-- Name: document_project_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_project_requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_project_requirements_id_seq OWNER TO postgres;

--
-- Name: document_project_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_project_requirements_id_seq OWNED BY document_project_requirements.id;


--
-- Name: document_project_use_cases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_project_use_cases (
    id integer NOT NULL,
    document_project_id integer,
    use_case_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.document_project_use_cases OWNER TO postgres;

--
-- Name: document_project_use_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_project_use_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_project_use_cases_id_seq OWNER TO postgres;

--
-- Name: document_project_use_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_project_use_cases_id_seq OWNED BY document_project_use_cases.id;


--
-- Name: document_projects; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_projects (
    id integer NOT NULL,
    name character varying(255),
    description text,
    url_path character varying(255),
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    version integer DEFAULT 0,
    origin character varying(255)
);


ALTER TABLE public.document_projects OWNER TO postgres;

--
-- Name: document_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_projects_id_seq OWNER TO postgres;

--
-- Name: document_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_projects_id_seq OWNED BY document_projects.id;


--
-- Name: document_requirements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_requirements (
    id integer NOT NULL,
    description text,
    name character varying(255),
    requirement_id integer,
    url_path character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.document_requirements OWNER TO postgres;

--
-- Name: document_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_requirements_id_seq OWNER TO postgres;

--
-- Name: document_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_requirements_id_seq OWNED BY document_requirements.id;


--
-- Name: document_tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_tasks (
    id integer NOT NULL,
    description text,
    name character varying(255),
    task_id integer,
    url_path character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    version integer,
    original_name character varying(255)
);


ALTER TABLE public.document_tasks OWNER TO postgres;

--
-- Name: document_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_tasks_id_seq OWNER TO postgres;

--
-- Name: document_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_tasks_id_seq OWNED BY document_tasks.id;


--
-- Name: document_use_cases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_use_cases (
    id integer NOT NULL,
    description text,
    name character varying(255),
    use_case_id integer,
    url_path character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.document_use_cases OWNER TO postgres;

--
-- Name: document_use_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_use_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_use_cases_id_seq OWNER TO postgres;

--
-- Name: document_use_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_use_cases_id_seq OWNED BY document_use_cases.id;


--
-- Name: evaluations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evaluations (
    id integer NOT NULL,
    task_id integer,
    description text,
    name character varying(255),
    code character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.evaluations OWNER TO postgres;

--
-- Name: evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluations_id_seq OWNER TO postgres;

--
-- Name: evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE evaluations_id_seq OWNED BY evaluations.id;


--
-- Name: goals; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE goals (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.goals OWNER TO postgres;

--
-- Name: goals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goals_id_seq OWNER TO postgres;

--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE goals_id_seq OWNED BY goals.id;


--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE labels (
    id integer NOT NULL,
    name character varying(255),
    color character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer
);


ALTER TABLE public.labels OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labels_id_seq OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE labels_id_seq OWNED BY labels.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    link character varying(255),
    description character varying(255),
    user_id integer,
    viewed boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    task_id integer
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: project_role_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE project_role_users (
    id integer NOT NULL,
    project_id integer,
    role_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    invitation_token character varying(255),
    invitation_confirmed boolean,
    show_tutorial boolean DEFAULT true
);


ALTER TABLE public.project_role_users OWNER TO postgres;

--
-- Name: project_role_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE project_role_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_role_users_id_seq OWNER TO postgres;

--
-- Name: project_role_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE project_role_users_id_seq OWNED BY project_role_users.id;


--
-- Name: project_statuses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE project_statuses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.project_statuses OWNER TO postgres;

--
-- Name: project_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE project_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_statuses_id_seq OWNER TO postgres;

--
-- Name: project_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE project_statuses_id_seq OWNED BY project_statuses.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(255),
    description text,
    initial_date date,
    finish_date date,
    status character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_status_id integer,
    dropbox_token character varying(255),
    github_token character varying(255),
    repo_name character varying(255),
    github_user character varying(255)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: reported_hours; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reported_hours (
    id integer NOT NULL,
    user_id integer,
    task_id integer,
    reporting_hours integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reported_hours OWNER TO postgres;

--
-- Name: reported_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reported_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reported_hours_id_seq OWNER TO postgres;

--
-- Name: reported_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reported_hours_id_seq OWNED BY reported_hours.id;


--
-- Name: requirement_templates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requirement_templates (
    id integer NOT NULL,
    name character varying(255),
    template_form text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.requirement_templates OWNER TO postgres;

--
-- Name: requirement_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requirement_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requirement_templates_id_seq OWNER TO postgres;

--
-- Name: requirement_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requirement_templates_id_seq OWNED BY requirement_templates.id;


--
-- Name: requirement_use_cases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requirement_use_cases (
    id integer NOT NULL,
    use_case_id integer,
    requirement_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.requirement_use_cases OWNER TO postgres;

--
-- Name: requirement_use_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requirement_use_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requirement_use_cases_id_seq OWNER TO postgres;

--
-- Name: requirement_use_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requirement_use_cases_id_seq OWNED BY requirement_use_cases.id;


--
-- Name: requirements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requirements (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    data text,
    template_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    project_id integer
);


ALTER TABLE public.requirements OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requirements_id_seq OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requirements_id_seq OWNED BY requirements.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE statuses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer,
    "order" integer
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_id_seq OWNER TO postgres;

--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE statuses_id_seq OWNED BY statuses.id;


--
-- Name: sub_tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sub_tasks (
    id integer NOT NULL,
    name character varying(255),
    description text,
    curr_state boolean,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sub_tasks OWNER TO postgres;

--
-- Name: sub_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sub_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_tasks_id_seq OWNER TO postgres;

--
-- Name: sub_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sub_tasks_id_seq OWNED BY sub_tasks.id;


--
-- Name: task_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_users (
    id integer NOT NULL,
    task_id integer,
    user_id integer,
    developer_id integer,
    creator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.task_users OWNER TO postgres;

--
-- Name: task_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE task_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_users_id_seq OWNER TO postgres;

--
-- Name: task_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE task_users_id_seq OWNED BY task_users.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    name character varying(255),
    description text,
    task_father_id integer,
    task_type character varying(255),
    status_update_at timestamp without time zone,
    project_id integer,
    status_id integer,
    requirement_id integer,
    label_id integer,
    estimated_hours integer,
    effective_hours integer,
    priority integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    goal_id integer,
    task_depend_id integer,
    lock boolean DEFAULT false,
    use_case_id integer,
    archived boolean DEFAULT false,
    user_id integer
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: test_cases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE test_cases (
    id integer NOT NULL,
    description text,
    executed_at timestamp without time zone,
    approved boolean,
    evaluation_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.test_cases OWNER TO postgres;

--
-- Name: test_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE test_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_cases_id_seq OWNER TO postgres;

--
-- Name: test_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE test_cases_id_seq OWNED BY test_cases.id;


--
-- Name: use_case_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE use_case_groups (
    id integer NOT NULL,
    name character varying(255),
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.use_case_groups OWNER TO postgres;

--
-- Name: use_case_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE use_case_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.use_case_groups_id_seq OWNER TO postgres;

--
-- Name: use_case_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE use_case_groups_id_seq OWNED BY use_case_groups.id;


--
-- Name: use_case_templates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE use_case_templates (
    id integer NOT NULL,
    name character varying(255),
    template_form text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer
);


ALTER TABLE public.use_case_templates OWNER TO postgres;

--
-- Name: use_case_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE use_case_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.use_case_templates_id_seq OWNER TO postgres;

--
-- Name: use_case_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE use_case_templates_id_seq OWNED BY use_case_templates.id;


--
-- Name: use_cases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE use_cases (
    id integer NOT NULL,
    name character varying(255),
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    use_case_template_id integer,
    data text,
    use_case_group_id integer
);


ALTER TABLE public.use_cases OWNER TO postgres;

--
-- Name: use_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE use_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.use_cases_id_seq OWNER TO postgres;

--
-- Name: use_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE use_cases_id_seq OWNED BY use_cases.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255),
    picture character varying(255),
    curriculum character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    authentication_token character varying(255),
    invitation_token character varying(255),
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_id integer,
    invited_by_type character varying(255),
    provider character varying(255),
    uid character varying(255),
    avatar character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bugs ALTER COLUMN id SET DEFAULT nextval('bugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY commits ALTER COLUMN id SET DEFAULT nextval('commits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_project_requirements ALTER COLUMN id SET DEFAULT nextval('document_project_requirements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_project_use_cases ALTER COLUMN id SET DEFAULT nextval('document_project_use_cases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_projects ALTER COLUMN id SET DEFAULT nextval('document_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_requirements ALTER COLUMN id SET DEFAULT nextval('document_requirements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_tasks ALTER COLUMN id SET DEFAULT nextval('document_tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_use_cases ALTER COLUMN id SET DEFAULT nextval('document_use_cases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluations ALTER COLUMN id SET DEFAULT nextval('evaluations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY goals ALTER COLUMN id SET DEFAULT nextval('goals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY labels ALTER COLUMN id SET DEFAULT nextval('labels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project_role_users ALTER COLUMN id SET DEFAULT nextval('project_role_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project_statuses ALTER COLUMN id SET DEFAULT nextval('project_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reported_hours ALTER COLUMN id SET DEFAULT nextval('reported_hours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requirement_templates ALTER COLUMN id SET DEFAULT nextval('requirement_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requirement_use_cases ALTER COLUMN id SET DEFAULT nextval('requirement_use_cases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requirements ALTER COLUMN id SET DEFAULT nextval('requirements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statuses ALTER COLUMN id SET DEFAULT nextval('statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sub_tasks ALTER COLUMN id SET DEFAULT nextval('sub_tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_users ALTER COLUMN id SET DEFAULT nextval('task_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY test_cases ALTER COLUMN id SET DEFAULT nextval('test_cases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use_case_groups ALTER COLUMN id SET DEFAULT nextval('use_case_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use_case_templates ALTER COLUMN id SET DEFAULT nextval('use_case_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use_cases ALTER COLUMN id SET DEFAULT nextval('use_cases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: bugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bugs (id, description, user_id, project_id, test_case_id, task_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: bugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bugs_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments (id, user_id, task_id, message, approved, created_at, updated_at) FROM stdin;
2	11	11	IP del servidor: 200.114.91.54	t	2014-04-05 16:59:51.843515	2014-04-05 16:59:51.843515
3	6	14	Reunion de Equipo = Se definieron Mockups y Tareas semanales	t	2014-04-08 22:37:08.368244	2014-04-08 22:37:08.368244
4	6	20	Mockups Subidos a Smartboard	t	2014-04-09 20:20:47.285989	2014-04-09 20:20:47.285989
5	11	16	En revisión mientras queda lista la API para hacer el login realmente. Cuando exista, se actualizara la versión de la app en el servidor de producción y se realizaran pruebas con ella para poder pasarlo a Done.	t	2014-04-10 02:48:24.146206	2014-04-10 02:48:24.146206
6	6	21	Falta Probar Mailer. Por ahora se solicita y Admin autoriza con un boton.	t	2014-04-11 20:58:04.601119	2014-04-11 20:58:04.601119
7	6	19	Se agrego el #19 al commit, pero hubo conflicto de versiones y al hacer el merge se perdio en #19	t	2014-04-11 20:59:26.375779	2014-04-11 20:59:26.375779
8	7	17	Lista App de android de chat centralizado utilizando get requests y json	t	2014-04-11 21:24:04.547385	2014-04-11 21:24:04.547385
10	6	21	Casi Ok. Falta controlar una Excepción Descubierta.	t	2014-04-14 20:39:04.603656	2014-04-14 20:39:04.603656
9	9	18	Blog rails y Rails for Zombies listo	t	2014-04-12 15:31:49.583118	2014-04-15 15:18:54.62786
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 10, true);


--
-- Data for Name: commits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY commits (id, url, sha, author_name, author_email, date, message, task_id, created_at, updated_at) FROM stdin;
1	https://github.com/narisso/Smartboard/commit/f12f167b4e67f555f0f0203f108d63891468121e	f12f167b4e67f555f0f0203f108d63891468121e	Nicolito	narisso@uc.cl	2014-03-26T21:36:39-04:00	nothing #1	1	2014-03-27 01:36:39.621886	2014-03-27 01:36:39.621886
2	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/f5cb64f7f34073d1ec959059b88c43932dfa990a	f5cb64f7f34073d1ec959059b88c43932dfa990a	maxfindel	maxfindel@gmail.com	2014-04-02T20:38:25-03:00	 smartboard test #10	10	2014-04-02 23:36:09.563069	2014-04-02 23:36:09.563069
3	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/4e754f1a179c5952a74b0d7d591a05b6b5f63ad4	4e754f1a179c5952a74b0d7d591a05b6b5f63ad4	fjsandov	franciscosandoval15@gmail.com	2014-04-02T23:22:43-03:00	 smartboard test #10	10	2014-04-03 02:22:59.067229	2014-04-03 02:22:59.067229
4	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/ea54639ec748826e57e4627833c4b2581134ed2e	ea54639ec748826e57e4627833c4b2581134ed2e	cristobal jimenez	cijimenez90@gmail.com	2014-04-04T14:06:10-04:00	comentario para probar git y smartboard #10	10	2014-04-04 18:08:22.613921	2014-04-04 18:08:22.613921
5	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/4378c86a3a157c60f672f977ad887634023ea7d4	4378c86a3a157c60f672f977ad887634023ea7d4	cristobal jimenez	cijimenez90@gmail.com	2014-04-04T14:13:22-04:00	nuevo test github y smartboard #10	10	2014-04-04 18:13:45.780048	2014-04-04 18:13:45.780048
6	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/deaa31d598737ca199847951ffd473f7b81d3f2e	deaa31d598737ca199847951ffd473f7b81d3f2e	fjsandov	franciscosandoval15@gmail.com	2014-04-04T18:42:11-03:00	sh que permite borrar, crear, migrar la bd y desplegar la aplicacion #11	11	2014-04-04 21:42:01.923276	2014-04-04 21:42:01.923276
7	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/4d8c2426e24b22572e119db978d9cc8b09ec446f	4d8c2426e24b22572e119db978d9cc8b09ec446f	lucas	lucas@lucas-VB.(none)	2014-04-07T17:25:53-03:00	mensaje de commit #10TareaEnSmartboard	10	2014-04-07 20:25:58.302904	2014-04-07 20:25:58.302904
8	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/b2fcba404d9d002b3943145a369fdd2ead24a8fc	b2fcba404d9d002b3943145a369fdd2ead24a8fc	Lucas Valenzuela	lucasvalenzuela@gmail.com	2014-04-07T17:32:08-03:00	nuevo commit de prueba en #10	10	2014-04-07 20:31:46.28902	2014-04-07 20:31:46.28902
9	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a26bb16abbd2055efeec641ce680f2938a5dc4c8	a26bb16abbd2055efeec641ce680f2938a5dc4c8	rnsfeir	rsfeir91@hotmail.com	2014-04-07T18:09:29-03:00	prueba, comentario agregado en readme #10	10	2014-04-07 21:11:40.056505	2014-04-07 21:11:40.056505
10	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/53d08bc81fbee001f594e2f1f2d36c88dca7533d	53d08bc81fbee001f594e2f1f2d36c88dca7533d	Felipe	asfura@gmail.com	2014-04-07T18:40:45-03:00	Prueba de commit #10	10	2014-04-07 21:40:30.812443	2014-04-07 21:40:30.812443
11	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/8494c65bdb721e915f2d172db33e5fd49975c4c8	8494c65bdb721e915f2d172db33e5fd49975c4c8	Nicolas Castro	npcastrol@gmail.com	2014-04-07T19:13:17-03:00	Prueba #10	10	2014-04-07 22:12:53.958708	2014-04-07 22:12:53.958708
12	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e370c57c8fd5adfabf6b1fd4a205a8f5c54b6a2e	e370c57c8fd5adfabf6b1fd4a205a8f5c54b6a2e	Juan Carlos	juan@juan-VirtualBox.(none)	2014-04-08T09:38:00-04:00	Prueba commit #10	10	2014-04-08 13:38:09.987135	2014-04-08 13:38:09.987135
13	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/499176db2df51bb6c039f71a73228200f46eff97	499176db2df51bb6c039f71a73228200f46eff97	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-09T23:46:42-03:00	Se agrega libreria para request http y se dejo un boton que intenta hacer una llamada al servidor esperando un json con un authentication_token. Tambien se agrega clase AppConfig para manejar variables de aplicacion #16	16	2014-04-10 02:46:27.584753	2014-04-10 02:46:27.584753
14	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/494c7b47304d0b880a873072ad6b092ccd51d3b8	494c7b47304d0b880a873072ad6b092ccd51d3b8	Nicolas Castro	npcastrol@gmail.com	2014-04-08T21:15:14-03:00	Cambio nombre de aplicacion. Quito forms y cosas visibles de pre_users #12	12	2014-04-11 16:42:01.74686	2014-04-11 16:42:01.74686
15	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/5c9a895b993f1d6d5d791074a3350558ef61946f	5c9a895b993f1d6d5d791074a3350558ef61946f	Nicolas Castro	npcastrol@gmail.com	2014-04-11T14:32:47-03:00	Termino tarea de limpieza de la aplicacion basica #12	12	2014-04-11 17:32:11.153359	2014-04-11 17:32:11.153359
16	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/5b381b5af6b0e21c30ef24da941c7c6a1f3dc13f	5b381b5af6b0e21c30ef24da941c7c6a1f3dc13f	Nicolas Castro	npcastrol@gmail.com	2014-04-14T12:18:14-03:00	Hago funcionar los mails y el proceso de activacion. Falta obligar a rellenar su clave #19	19	2014-04-14 15:19:09.797842	2014-04-14 15:19:09.797842
17	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/5ec7bc2074d769d4fc376c1aa3ce23eeb753aa56	5ec7bc2074d769d4fc376c1aa3ce23eeb753aa56	Nicolas Castro	npcastrol@gmail.com	2014-04-14T15:58:12-03:00	Hago merge #21	21	2014-04-14 18:57:30.080304	2014-04-14 18:57:30.080304
18	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/9545c918b563e0601d2e4b2b3e1eca2996bcc3a4	9545c918b563e0601d2e4b2b3e1eca2996bcc3a4	Nicolas Castro	npcastrol@gmail.com	2014-04-14T16:27:07-03:00	Cuando se le envia el mail de activacion a un usuario, este se cambia de lista en la vista del admin. #21	21	2014-04-14 19:26:21.897708	2014-04-14 19:26:21.897708
19	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/8a5ec575b6935c89c7db34bad7ac72796e2a6704	8a5ec575b6935c89c7db34bad7ac72796e2a6704	Max Findel	maxfindel@gmail.com	2014-04-14T17:23:15-04:00	api setup with json #7	7	2014-04-14 21:22:22.580088	2014-04-14 21:22:22.580088
20	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a4ccd5a232d0886309826870dead5a9389a4338b	a4ccd5a232d0886309826870dead5a9389a4338b	maxfindel	maxfindel@gmail.com	2014-04-14T18:28:29-03:00	 devices with own key #7	7	2014-04-14 21:25:15.431012	2014-04-14 21:25:15.431012
21	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/1a1aaa63167b29f19c792b4d43d95bd9274d019e	1a1aaa63167b29f19c792b4d43d95bd9274d019e	maxfindel	maxfindel@gmail.com	2014-04-14T18:45:09-03:00	 esquema db #15	15	2014-04-14 21:41:55.173478	2014-04-14 21:41:55.173478
22	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/fd81041eda5ea5f7be64f7c7ccc0fe3cbec09213	fd81041eda5ea5f7be64f7c7ccc0fe3cbec09213	Max Findel	maxfindel@gmail.com	2014-04-14T18:18:04-04:00	optional params #7	7	2014-04-14 22:17:12.293735	2014-04-14 22:17:12.293735
23	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/c388f64c36319c8f70541e4e80eb98fef10cfe2b	c388f64c36319c8f70541e4e80eb98fef10cfe2b	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-15T00:26:46-03:00	se integro el poder hacer solicitudes http con ventana de login y se agrego la posibilidad de recuperar la direccion MAC del dispositivo #16	16	2014-04-15 03:26:14.827471	2014-04-15 03:26:14.827471
24	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e2bd5429605bd21bc39a872e4ffd30fecb5c5e92	e2bd5429605bd21bc39a872e4ffd30fecb5c5e92	maxfindel	maxfindel@gmail.com	2014-04-15T15:01:57-03:00	 hotfix logo_url #7	7	2014-04-15 17:58:36.68389	2014-04-15 17:58:36.68389
25	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/03673a2fe10fad878e85aa3e84669f6925935807	03673a2fe10fad878e85aa3e84669f6925935807	unknown	asfura@gmail.com	2014-04-15T16:07:56-03:00	Comenzando modelos de estado de aplicacion #16	16	2014-04-15 19:07:36.620554	2014-04-15 19:07:36.620554
26	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/ed54feb373077aaa1cf25e67625643653d862b85	ed54feb373077aaa1cf25e67625643653d862b85	fjsandov	franciscosandoval15@gmail.com	2014-04-15T16:08:25-03:00	evitando verificacion de fuente en api #7	7	2014-04-15 19:09:08.436499	2014-04-15 19:09:08.436499
27	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/1d8d543f76a541996296aeb02ad28a92a8b058d4	1d8d543f76a541996296aeb02ad28a92a8b058d4	Nicolas Castro	npcastrol@gmail.com	2014-04-15T16:12:03-03:00	Hago merge y: Corrijo comportamiento de la vista de la lista de usuarios. Ahora al mandar el mail, los usuarios nuevos pasan a la lista de abajo. #19	19	2014-04-15 19:11:16.216508	2014-04-15 19:11:16.216508
28	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e20c14b35f88701f7982f71404527af363b216ca	e20c14b35f88701f7982f71404527af363b216ca	Nicolas Castro	npcastrol@gmail.com	2014-04-15T16:19:22-03:00	Terminado comportamiento de usuario #21	21	2014-04-15 19:18:34.455056	2014-04-15 19:18:34.455056
29	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/ecb2a83b505108f3c88cbb7fc79656dbdf2a3da3	ecb2a83b505108f3c88cbb7fc79656dbdf2a3da3	unknown	asfura@gmail.com	2014-04-15T22:26:14-03:00	Creando clases multimedia que serán generadas del JSON obtenido del servidor #26	26	2014-04-16 01:26:26.363295	2014-04-16 01:26:26.363295
30	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/4faa52191333702eb9fdac311c4be27640b58317	4faa52191333702eb9fdac311c4be27640b58317	unknown	asfura@gmail.com	2014-04-15T22:54:53-03:00	Mas desarrrollo en los modelos junto a DeviceInformation #26 (faltaro hacer git add)	26	2014-04-16 01:54:12.583194	2014-04-16 01:54:12.583194
\.


--
-- Name: commits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('commits_id_seq', 30, true);


--
-- Data for Name: document_project_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_project_requirements (id, document_project_id, requirement_id) FROM stdin;
\.


--
-- Name: document_project_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_project_requirements_id_seq', 1, false);


--
-- Data for Name: document_project_use_cases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_project_use_cases (id, document_project_id, use_case_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: document_project_use_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_project_use_cases_id_seq', 1, false);


--
-- Data for Name: document_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_projects (id, name, description, url_path, project_id, created_at, updated_at, version, origin) FROM stdin;
1	Mockup login		https://db.tt/Y2cl80nQ	2	2014-04-09 20:18:44.479399	2014-04-09 20:18:44.479399	0	web
2	Mockup Dispositivos		https://db.tt/9n9Lnv3L	2	2014-04-09 20:19:19.552875	2014-04-09 20:19:19.552875	0	web
3	Mockup programaciones		https://db.tt/SgQ46NVQ	2	2014-04-09 20:19:51.020427	2014-04-09 20:19:51.020427	0	web
4	Mockup contenido		https://db.tt/AltaiEGA	2	2014-04-09 20:20:16.442626	2014-04-09 20:20:16.442626	0	web
\.


--
-- Name: document_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_projects_id_seq', 4, true);


--
-- Data for Name: document_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_requirements (id, description, name, requirement_id, url_path, created_at, updated_at) FROM stdin;
\.


--
-- Name: document_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_requirements_id_seq', 1, false);


--
-- Data for Name: document_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_tasks (id, description, name, task_id, url_path, created_at, updated_at, version, original_name) FROM stdin;
\.


--
-- Name: document_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_tasks_id_seq', 1, false);


--
-- Data for Name: document_use_cases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_use_cases (id, description, name, use_case_id, url_path, created_at, updated_at) FROM stdin;
\.


--
-- Name: document_use_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_use_cases_id_seq', 1, false);


--
-- Data for Name: evaluations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evaluations (id, task_id, description, name, code, created_at, updated_at) FROM stdin;
\.


--
-- Name: evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evaluations_id_seq', 1, false);


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY goals (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('goals_id_seq', 1, false);


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY labels (id, name, color, created_at, updated_at, project_id) FROM stdin;
1	Administration	#2b72dc	2014-03-27 01:25:44.112417	2014-03-27 01:25:44.112417	\N
2	Analysis	#2babd6	2014-03-27 01:25:44.13899	2014-03-27 01:25:44.13899	\N
3	Requirement	#ff8533	2014-03-27 01:25:44.146321	2014-03-27 01:25:44.146321	\N
4	Feature	#ffad33	2014-03-27 01:25:44.162156	2014-03-27 01:25:44.162156	\N
5	Design	#9d2bd6	2014-03-27 01:25:44.166118	2014-03-27 01:25:44.166118	\N
6	Bug	#ff3333	2014-03-27 01:25:44.170152	2014-03-27 01:25:44.170152	\N
7	Testing	#ffff33	2014-03-27 01:25:44.174118	2014-03-27 01:25:44.174118	\N
8	Chore	#bceb2f	2014-03-27 01:25:44.17811	2014-03-27 01:25:44.17811	\N
9	Suggestion	#2bd62b	2014-03-27 01:25:44.18214	2014-03-27 01:25:44.18214	\N
10	Learning	#472bd6	2014-03-27 01:25:44.186106	2014-03-27 01:25:44.186106	\N
11	Research	#020118	2014-03-27 01:25:44.190085	2014-03-27 01:25:44.190085	\N
12	Administration	#2b72dc	2014-03-27 01:26:56.123713	2014-03-27 01:26:56.123713	1
13	Analysis	#2babd6	2014-03-27 01:26:56.132942	2014-03-27 01:26:56.132942	1
14	Requirement	#ff8533	2014-03-27 01:26:56.140287	2014-03-27 01:26:56.140287	1
15	Feature	#ffad33	2014-03-27 01:26:56.148204	2014-03-27 01:26:56.148204	1
16	Design	#9d2bd6	2014-03-27 01:26:56.153977	2014-03-27 01:26:56.153977	1
17	Bug	#ff3333	2014-03-27 01:26:56.160158	2014-03-27 01:26:56.160158	1
18	Testing	#ffff33	2014-03-27 01:26:56.165895	2014-03-27 01:26:56.165895	1
19	Chore	#bceb2f	2014-03-27 01:26:56.172163	2014-03-27 01:26:56.172163	1
20	Suggestion	#2bd62b	2014-03-27 01:26:56.188064	2014-03-27 01:26:56.188064	1
21	Learning	#472bd6	2014-03-27 01:26:56.193754	2014-03-27 01:26:56.193754	1
22	Research	#020118	2014-03-27 01:26:56.200023	2014-03-27 01:26:56.200023	1
23	Administration	#2b72dc	2014-03-27 19:13:50.963587	2014-03-27 19:13:50.963587	2
24	Analysis	#2babd6	2014-03-27 19:13:50.972577	2014-03-27 19:13:50.972577	2
27	Design	#9d2bd6	2014-03-27 19:13:50.987775	2014-03-27 19:13:50.987775	2
28	Bug	#ff3333	2014-03-27 19:13:50.991798	2014-03-27 19:13:50.991798	2
32	Learning	#472bd6	2014-03-27 19:13:51.00768	2014-03-27 19:13:51.00768	2
34	Administration	#2b72dc	2014-04-07 13:24:12.340163	2014-04-07 13:24:12.340163	3
35	Analysis	#2babd6	2014-04-07 13:24:12.351263	2014-04-07 13:24:12.351263	3
36	Requirement	#ff8533	2014-04-07 13:24:12.358515	2014-04-07 13:24:12.358515	3
37	Feature	#ffad33	2014-04-07 13:24:12.366365	2014-04-07 13:24:12.366365	3
38	Design	#9d2bd6	2014-04-07 13:24:12.370402	2014-04-07 13:24:12.370402	3
39	Bug	#ff3333	2014-04-07 13:24:12.377936	2014-04-07 13:24:12.377936	3
40	Testing	#ffff33	2014-04-07 13:24:12.382288	2014-04-07 13:24:12.382288	3
41	Chore	#bceb2f	2014-04-07 13:24:12.386287	2014-04-07 13:24:12.386287	3
42	Suggestion	#2bd62b	2014-04-07 13:24:12.390301	2014-04-07 13:24:12.390301	3
43	Learning	#472bd6	2014-04-07 13:24:12.394282	2014-04-07 13:24:12.394282	3
44	Research	#020118	2014-04-07 13:24:12.402252	2014-04-07 13:24:12.402252	3
30	Chore Android	#bceb2f	2014-03-27 19:13:50.999747	2014-04-08 19:15:42.566984	2
26	Chore Rails	#ffad33	2014-03-27 19:13:50.983768	2014-04-08 19:16:04.067782	2
\.


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('labels_id_seq', 44, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notifications (id, link, description, user_id, viewed, created_at, updated_at, task_id) FROM stdin;
1	/projects/1/boards	You were assigned to a new task	1	t	2014-03-27 01:35:31.913069	2014-03-27 01:42:31.246791	\N
3	/projects/2/boards	You were assigned to a new task	10	t	2014-03-28 03:04:54.459934	2014-03-28 03:08:09.663971	\N
4	/projects/2/boards	You were assigned to a new task	10	t	2014-03-31 00:41:34.304185	2014-03-31 00:42:15.303649	\N
10	/projects/2/boards	You were assigned to a new task	10	t	2014-04-02 18:58:23.851681	2014-04-02 23:05:07.054471	\N
9	/projects/2/boards	You were assigned to a new task	8	t	2014-04-02 18:58:23.847687	2014-04-06 18:13:24.420374	\N
12	/projects/2/boards	You were assigned to a new task	11	t	2014-04-04 21:13:59.226782	2014-04-08 17:15:27.362886	\N
6	/projects/2/boards	You were assigned to a new task	7	t	2014-04-02 18:58:23.817643	2014-04-08 18:34:22.464674	\N
8	/projects/2/boards	You were assigned to a new task	11	t	2014-04-02 18:58:23.843797	2014-04-08 19:19:56.238816	\N
25	/projects/2/boards	You were assigned to a new task	13	f	2014-04-08 20:45:22.166582	2014-04-08 20:45:22.166582	\N
24	/projects/2/boards	You were assigned to a new task	6	t	2014-04-08 20:45:22.16009	2014-04-08 21:41:57.509436	\N
27	/projects/2/boards	You were assigned to a new task	7	f	2014-04-08 22:53:37.433722	2014-04-08 22:53:37.433722	\N
28	/projects/2/boards	You were assigned to a new task	13	f	2014-04-08 22:53:37.445993	2014-04-08 22:53:37.445993	\N
33	/projects/2/boards	You were assigned to a new task	10	t	2014-04-08 22:56:46.607179	2014-04-08 22:57:01.531042	\N
16	/projects/2/boards	You were assigned to a new task	10	t	2014-04-08 19:41:49.656859	2014-04-08 22:57:04.104274	\N
21	/projects/2/boards	You were assigned to a new task	10	t	2014-04-08 20:45:22.142845	2014-04-08 22:57:06.510106	\N
34	/projects/2/boards	You were assigned to a new task	6	t	2014-04-08 22:56:46.618648	2014-04-09 00:38:32.189061	\N
32	/projects/2/boards	You were assigned to a new task	6	t	2014-04-08 22:55:29.427709	2014-04-09 00:45:06.778513	\N
13	/projects/2/boards	You were assigned to a new task	5	t	2014-04-08 19:16:54.868113	2014-04-09 00:56:20.77377	\N
36	/projects/2/boards	You were assigned to a new task	6	t	2014-04-09 18:03:17.558732	2014-04-09 20:24:06.197189	\N
5	/projects/2/boards	You were assigned to a new task	13	t	2014-03-31 23:40:31.598843	2014-04-09 20:44:20.012212	\N
15	/projects/2/boards	You were assigned to a new task	11	t	2014-04-08 19:41:49.649912	2014-04-10 03:55:51.334894	\N
19	/projects/2/boards	You were assigned to a new task	11	t	2014-04-08 20:45:22.118752	2014-04-10 03:55:54.512632	\N
26	/projects/2/boards	You were assigned to a new task	11	t	2014-04-08 22:51:50.011377	2014-04-10 03:55:56.892058	\N
20	/projects/2/boards	You were assigned to a new task	8	t	2014-04-08 20:45:22.136202	2014-04-11 00:53:08.736965	\N
31	/projects/2/boards	You were assigned to a new task	8	t	2014-04-08 22:55:29.417169	2014-04-11 00:53:16.230128	\N
35	/projects/2/boards	You were assigned to a new task	8	t	2014-04-09 18:03:17.537892	2014-04-11 00:53:22.119446	\N
2	/projects/2/boards	You were assigned to a new task	7	t	2014-03-28 03:04:54.44844	2014-04-11 21:23:24.670836	\N
23	/projects/2/boards	You were assigned to a new task	12	t	2014-04-08 20:45:22.154638	2014-04-11 21:46:38.952723	\N
30	/projects/2/boards	You were assigned to a new task	12	t	2014-04-08 22:54:26.097456	2014-04-11 21:46:45.130257	\N
7	/projects/2/boards	You were assigned to a new task	13	t	2014-04-02 18:58:23.836838	2014-04-14 17:42:10.460731	\N
17	/projects/2/boards	You were assigned to a new task	13	t	2014-04-08 19:41:49.662072	2014-04-14 17:43:02.81931	\N
37	/projects/2/boards	You were assigned to a new task	7	f	2014-04-14 23:13:33.143084	2014-04-14 23:13:33.143084	\N
14	/projects/2/boards	You were assigned to a new task	7	t	2014-04-08 19:41:49.636143	2014-04-14 23:14:02.494714	\N
11	/projects/2/boards	You were assigned to a new task	9	t	2014-04-02 18:58:23.855664	2014-04-15 20:02:45.959757	\N
22	/projects/2/boards	You were assigned to a new task	9	t	2014-04-08 20:45:22.14813	2014-04-15 20:02:52.705618	\N
29	/projects/2/boards	You were assigned to a new task	9	t	2014-04-08 22:54:26.083606	2014-04-15 20:02:57.012728	\N
38	/projects/2/boards	You were assigned to a new task	7	f	2014-04-15 20:19:28.477256	2014-04-15 20:19:28.477256	\N
39	/projects/2/boards	You were assigned to a new task	7	f	2014-04-16 00:39:05.040101	2014-04-16 00:39:05.040101	\N
40	/projects/2/boards	You were assigned to a new task	11	f	2014-04-16 00:39:05.055762	2014-04-16 00:39:05.055762	\N
41	/projects/2/boards	You were assigned to a new task	8	f	2014-04-16 00:39:05.06137	2014-04-16 00:39:05.06137	\N
43	/projects/2/boards	You were assigned to a new task	9	f	2014-04-16 00:39:05.073309	2014-04-16 00:39:05.073309	\N
45	/projects/2/boards	You were assigned to a new task	13	f	2014-04-16 00:39:05.08523	2014-04-16 00:39:05.08523	\N
46	/projects/2/boards	You were assigned to a new task	7	f	2014-04-16 00:39:16.724798	2014-04-16 00:39:16.724798	\N
47	/projects/2/boards	You were assigned to a new task	11	f	2014-04-16 00:39:16.747374	2014-04-16 00:39:16.747374	\N
48	/projects/2/boards	You were assigned to a new task	8	f	2014-04-16 00:39:16.75478	2014-04-16 00:39:16.75478	\N
50	/projects/2/boards	You were assigned to a new task	9	f	2014-04-16 00:39:16.766693	2014-04-16 00:39:16.766693	\N
52	/projects/2/boards	You were assigned to a new task	13	f	2014-04-16 00:39:16.785	2014-04-16 00:39:16.785	\N
53	/projects/2/boards	You were assigned to a new task	7	f	2014-04-16 00:41:14.82122	2014-04-16 00:41:14.82122	\N
54	/projects/2/boards	You were assigned to a new task	11	f	2014-04-16 00:41:14.835041	2014-04-16 00:41:14.835041	\N
55	/projects/2/boards	You were assigned to a new task	8	f	2014-04-16 00:41:14.842597	2014-04-16 00:41:14.842597	\N
56	/projects/2/boards	You were assigned to a new task	9	f	2014-04-16 00:41:14.84896	2014-04-16 00:41:14.84896	\N
58	/projects/2/boards	You were assigned to a new task	13	f	2014-04-16 00:41:14.860831	2014-04-16 00:41:14.860831	\N
59	/projects/2/boards	You were assigned to a new task	7	f	2014-04-16 01:12:43.399016	2014-04-16 01:12:43.399016	\N
60	/projects/2/boards	You were assigned to a new task	11	f	2014-04-16 01:12:43.414241	2014-04-16 01:12:43.414241	\N
61	/projects/2/boards	You were assigned to a new task	13	f	2014-04-16 01:12:43.422008	2014-04-16 01:12:43.422008	\N
44	/projects/2/boards	You were assigned to a new task	12	t	2014-04-16 00:39:05.079573	2014-04-16 03:01:48.728218	\N
57	/projects/2/boards	You were assigned to a new task	12	t	2014-04-16 00:41:14.854606	2014-04-16 03:01:54.231373	\N
51	/projects/2/boards	You were assigned to a new task	12	t	2014-04-16 00:39:16.773112	2014-04-16 03:01:58.161335	\N
49	/projects/2/boards	You were assigned to a new task	10	t	2014-04-16 00:39:16.761001	2014-04-16 14:37:24.124591	\N
42	/projects/2/boards	You were assigned to a new task	10	t	2014-04-16 00:39:05.067626	2014-04-16 14:37:27.571335	\N
18	/projects/2/boards	You were assigned to a new task	7	t	2014-04-08 20:45:22.107882	2014-04-16 15:01:31.396912	\N
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notifications_id_seq', 61, true);


--
-- Data for Name: project_role_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY project_role_users (id, project_id, role_id, user_id, created_at, updated_at, invitation_token, invitation_confirmed, show_tutorial) FROM stdin;
1	1	1	1	2014-03-27 01:26:56.246887	2014-03-27 01:26:59.950542	\N	\N	f
2	1	2	2	2014-03-27 17:41:04.70986	2014-03-27 17:42:17.931571	_Fqi3WgYKZRu9amm_baskg	t	t
3	2	1	4	2014-03-27 19:13:51.063125	2014-03-27 19:13:56.892936	\N	\N	f
4	2	1	5	2014-03-27 19:24:25.630523	2014-03-27 19:29:16.265808	EGMK3HfumsN7RkXMr5u3Pg	t	f
7	2	3	7	2014-03-27 22:02:33.501064	2014-03-27 22:04:32.077466	q9LP78KIi-jx5NB7TbHKzw	t	t
11	2	3	11	2014-03-27 22:04:08.926347	2014-03-27 22:48:35.756199	0IX_JQer1nU3bqGbs1UOog	t	t
8	2	3	8	2014-03-27 22:03:01.804762	2014-03-27 22:52:45.2386	670482SgvJ8hZ4Tlcs1o3g	t	t
10	2	2	10	2014-03-27 22:03:39.78114	2014-03-28 03:00:29.664751	pDuaWryzFJ5mbkdVUEBIWA	t	t
9	2	3	9	2014-03-27 22:03:19.575014	2014-03-28 14:04:46.676956	FRruv6eEdp-SWkfoNi18EA	t	t
14	1	2	14	2014-03-29 15:09:38.947327	2014-03-29 15:10:09.89317	7CQ-qvaikQYvyE3_1o3oiw	t	t
12	2	3	12	2014-03-27 22:04:28.977088	2014-03-29 17:18:46.201509	8Rg-kBJnF-yaSeFoBN_6eA	t	t
5	2	3	6	2014-03-27 22:02:05.942957	2014-04-01 20:37:42.313207	cmFBgNkPVh9uOIP96HjrcA	t	t
15	3	1	15	2014-04-07 13:24:12.414268	2014-04-07 13:24:12.414268	\N	\N	t
13	2	3	13	2014-03-27 22:04:50.387568	2014-04-07 20:16:30.782944	t0cl_Lf3Q5-sjdsZL9QzzQ	t	t
\.


--
-- Name: project_role_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('project_role_users_id_seq', 16, true);


--
-- Data for Name: project_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY project_statuses (id, name, created_at, updated_at) FROM stdin;
1	Starting	2014-03-27 01:25:44.301689	2014-03-27 01:25:44.301689
2	In process	2014-03-27 01:25:44.310339	2014-03-27 01:25:44.310339
3	Finished	2014-03-27 01:25:44.317675	2014-03-27 01:25:44.317675
4	Cancel	2014-03-27 01:25:44.321718	2014-03-27 01:25:44.321718
\.


--
-- Name: project_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('project_statuses_id_seq', 4, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projects (id, name, description, initial_date, finish_date, status, created_at, updated_at, project_status_id, dropbox_token, github_token, repo_name, github_user) FROM stdin;
1	Proyecto de prueba		2014-03-27	\N	\N	2014-03-27 01:26:55.967222	2014-03-27 01:37:30.718748	1	---\n- flqvcvak690j4xe\n- kvnzj9gj8m1ii4sp\n- Seaak2SS6DXWaeZ4\n- 7Cml5SvCvPggXTEC\n- hh8hg8hjx04gauz\n- xc4hqprhzwe0ufs\n	d16b0d3008ca68c9186ebcb4b1fb55edbeaae94c	Smartboard	narisso
2	TradeMedia	TradeMedia	2014-03-27	\N	\N	2014-03-27 19:13:50.856248	2014-04-03 01:26:41.680848	1	---\n- dl5ww7rrgcob8ud\n- gbc05t3hgfe1ufhq\n- 4qHq0VcDNydb03HZ\n- V5I1eiNN3yZUasr1\n- hh8hg8hjx04gauz\n- xc4hqprhzwe0ufs\n	4fab0af88f1272b311d152d49a30f765f83c7224	[{"user":"aneyem-github","repo":"IIC2154-2014-1-Grupo4"},{"user":"iic2154-uc-cl","repo":"2014-1-Grupo4-Web"},{"user":"iic2154-uc-cl","repo":"2014-1-Grupo4-Mobile"},{"user":"iic2154-uc-cl","repo":"2014-1-Grupo4-Embedded"}]	iic2154-uc-cl
3	PROYECTO	PRUEBA DEL PROYECTO	2014-04-07	\N	\N	2014-04-07 13:24:12.203533	2014-04-07 13:24:12.203533	1	\N	\N	\N	\N
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projects_id_seq', 3, true);


--
-- Data for Name: reported_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reported_hours (id, user_id, task_id, reporting_hours, created_at, updated_at) FROM stdin;
2	10	3	2	2014-03-31 00:25:06.532684	2014-03-31 00:25:06.532684
1	10	2	5	2014-03-28 03:05:54.54777	2014-03-31 00:25:46.507283
3	1	1	5	2014-03-31 01:01:42.585864	2014-03-31 01:02:12.62309
4	10	4	2	2014-04-02 17:52:17.818741	2014-04-02 17:52:18.075893
5	11	11	4	2014-04-04 21:14:49.951698	2014-04-04 21:14:49.951698
6	9	10	1	2014-04-08 20:43:24.190863	2014-04-08 20:43:24.190863
9	8	10	1	2014-04-08 21:20:33.729155	2014-04-08 21:20:33.729155
10	6	10	1	2014-04-08 21:44:20.109205	2014-04-08 21:44:20.109205
8	6	14	3	2014-04-08 21:00:41.221585	2014-04-08 22:34:42.758986
12	10	14	4	2014-04-08 22:35:34.312665	2014-04-08 22:35:44.837436
13	7	14	3	2014-04-08 22:37:28.747519	2014-04-08 22:37:28.747519
11	11	14	3	2014-04-08 21:44:35.197616	2014-04-08 22:40:38.59964
14	12	14	3	2014-04-09 00:00:34.244877	2014-04-09 00:00:34.244877
15	8	14	3	2014-04-09 00:15:06.839493	2014-04-09 00:15:06.839493
17	9	14	2	2014-04-09 04:07:06.612241	2014-04-09 04:07:06.612241
18	10	20	1	2014-04-09 17:48:10.725228	2014-04-09 17:48:10.725228
19	10	13	2	2014-04-09 17:48:35.409929	2014-04-09 17:48:35.409929
20	6	20	3	2014-04-09 20:20:55.9691	2014-04-09 20:26:23.36435
21	13	10	1	2014-04-09 20:47:21.666602	2014-04-09 20:47:21.666602
22	13	5	1	2014-04-09 20:47:47.143668	2014-04-09 20:47:47.143668
23	13	17	2	2014-04-09 20:48:06.700812	2014-04-09 20:48:06.700812
24	13	14	2	2014-04-09 20:49:02.575622	2014-04-09 20:49:02.575622
7	8	12	2	2014-04-08 20:50:18.35963	2014-04-11 17:31:02.07007
26	8	19	3	2014-04-11 20:57:20.854405	2014-04-11 20:57:20.854405
27	6	19	3	2014-04-11 20:57:24.401626	2014-04-11 20:57:24.401626
29	7	10	1	2014-04-11 21:24:56.147434	2014-04-11 21:24:56.147434
31	11	13	2	2014-04-12 23:25:53.529312	2014-04-12 23:25:53.529312
16	9	18	8	2014-04-09 04:05:13.9649	2014-04-14 17:41:07.371461
34	13	6	2	2014-04-14 17:42:53.521225	2014-04-14 17:42:53.521225
30	12	18	6	2014-04-11 21:46:10.966649	2014-04-14 19:02:55.210044
35	6	21	1	2014-04-14 20:41:13.820943	2014-04-14 20:41:13.820943
28	7	17	3	2014-04-11 21:24:20.021821	2014-04-14 23:08:18.232236
36	7	22	1	2014-04-14 23:13:53.415675	2014-04-14 23:13:53.415675
32	8	21	3	2014-04-14 15:53:52.605996	2014-04-15 19:18:52.907807
25	11	16	5	2014-04-10 02:43:11.568124	2014-04-15 19:39:51.230344
33	10	7	6	2014-04-14 17:27:51.015804	2014-04-15 20:02:20.626836
37	11	25	1	2014-04-16 00:41:28.052915	2014-04-16 00:41:28.052915
38	11	24	1	2014-04-16 00:41:35.308293	2014-04-16 00:41:35.308293
39	7	24	2	2014-04-16 01:12:59.345328	2014-04-16 01:12:59.345328
40	7	25	1	2014-04-16 01:13:09.875166	2014-04-16 01:13:09.875166
41	12	24	1	2014-04-16 03:02:10.906145	2014-04-16 03:02:10.906145
42	12	25	1	2014-04-16 03:02:23.894313	2014-04-16 03:02:23.894313
43	7	26	2	2014-04-16 15:02:31.687705	2014-04-16 15:02:31.687705
44	8	24	2	2014-04-16 18:44:16.124298	2014-04-16 18:44:16.124298
\.


--
-- Name: reported_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reported_hours_id_seq', 44, true);


--
-- Data for Name: requirement_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requirement_templates (id, name, template_form, created_at, updated_at) FROM stdin;
\.


--
-- Name: requirement_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requirement_templates_id_seq', 1, false);


--
-- Data for Name: requirement_use_cases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requirement_use_cases (id, use_case_id, requirement_id, created_at, updated_at) FROM stdin;
1	1	1	2014-04-01 00:06:02.121096	2014-04-01 00:06:02.121096
2	1	2	2014-04-01 00:08:04.12122	2014-04-01 00:08:04.12122
3	\N	3	2014-04-07 00:16:41.36121	2014-04-07 00:16:41.36121
4	\N	4	2014-04-07 00:18:09.395302	2014-04-07 00:18:09.395302
5	\N	5	2014-04-07 02:32:30.997784	2014-04-07 02:32:30.997784
6	\N	6	2014-04-07 02:33:01.404122	2014-04-07 02:33:01.404122
7	\N	7	2014-04-07 03:21:30.267695	2014-04-07 03:21:30.267695
8	\N	8	2014-04-07 21:42:09.35764	2014-04-07 21:42:09.35764
9	\N	9	2014-04-07 21:42:53.908017	2014-04-07 21:42:53.908017
10	\N	10	2014-04-07 21:44:17.249196	2014-04-07 21:44:17.249196
11	\N	11	2014-04-07 21:45:04.771017	2014-04-07 21:45:04.771017
12	\N	12	2014-04-07 21:46:03.059846	2014-04-07 21:46:03.059846
13	\N	13	2014-04-07 21:46:34.593082	2014-04-07 21:46:34.593082
14	\N	14	2014-04-07 21:47:31.707319	2014-04-07 21:47:31.707319
15	2	13	2014-04-08 19:31:56.040881	2014-04-08 19:31:56.040881
16	\N	15	2014-04-08 19:38:14.669802	2014-04-08 19:38:14.669802
18	3	13	2014-04-09 18:03:57.91374	2014-04-09 18:03:57.91374
19	4	9	2014-04-09 21:29:23.578064	2014-04-09 21:29:23.578064
20	5	9	2014-04-09 21:31:06.190061	2014-04-09 21:31:06.190061
21	6	11	2014-04-09 21:33:29.840677	2014-04-09 21:33:29.840677
22	6	9	2014-04-09 21:33:32.289713	2014-04-09 21:33:32.289713
23	7	1	2014-04-09 21:38:24.362252	2014-04-09 21:38:24.362252
24	7	15	2014-04-09 21:38:36.85104	2014-04-09 21:38:36.85104
25	8	12	2014-04-09 21:38:57.04658	2014-04-09 21:38:57.04658
26	8	1	2014-04-09 21:39:01.048705	2014-04-09 21:39:01.048705
\.


--
-- Name: requirement_use_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requirement_use_cases_id_seq', 26, true);


--
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requirements (id, name, type, data, template_id, created_at, updated_at, description, project_id) FROM stdin;
1	La solución debe permitir administrar dispositivos Android remotamente y proyectarlo a pantallas externas	\N	\N	\N	2014-04-01 00:06:02.068656	2014-04-07 21:38:42.571232		2
8	La solución debe permitir administrar la forma y horarios en que se consultan los datos	\N	\N	\N	2014-04-07 21:42:09.327084	2014-04-07 21:42:09.327084	No la consulta de requests/órdenes	2
9	La solución debe permitir subir contenido digital y manejar una biblioteca online	\N	\N	\N	2014-04-07 21:42:53.894702	2014-04-07 21:42:53.894702		2
10	La solución debe permitir analizar toda la información que genere valor que se pueda rescatar de los dispositivos	\N	\N	\N	2014-04-07 21:44:17.237321	2014-04-07 21:44:17.237321		2
11	La solución debe permitir crear programaciones a partir de contenidos	\N	\N	\N	2014-04-07 21:45:04.729925	2014-04-07 21:45:04.729925	Pueden haber programaciones con un solo contenido (reproducir un video)	2
12	La solución debe permitir calendarizar programaciones en los dispositivos	\N	\N	\N	2014-04-07 21:46:03.045163	2014-04-07 21:46:03.045163	Y replicar calendarizaciones en otros dispositivos.	2
13	La solución debe permitir a TradeMedia administrar a sus clientes y éstos a sus usuarios y permisos	\N	\N	\N	2014-04-07 21:46:34.574869	2014-04-07 21:46:34.574869		2
14	La solución debe permitir crear templates o maneras de mostrar contenido simultáneamente en una pantalla	\N	\N	\N	2014-04-07 21:47:31.692803	2014-04-07 21:47:31.692803		2
15	La solución debe funcionar con mala señal de internet o cuando la conexión es inestable	\N	\N	\N	2014-04-08 19:38:14.638944	2014-04-08 19:38:14.638944		2
\.


--
-- Name: requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requirements_id_seq', 15, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, created_at, updated_at) FROM stdin;
1	Administrator	2014-03-27 01:25:44.25861	2014-03-27 01:25:44.25861
2	Project Manager	2014-03-27 01:25:44.270545	2014-03-27 01:25:44.270545
3	Developer	2014-03-27 01:25:44.277822	2014-03-27 01:25:44.277822
4	Client	2014-03-27 01:25:44.28179	2014-03-27 01:25:44.28179
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20130908153820
20130908162232
20130908162333
20130908233328
20130908234235
20130909000204
20130909000712
20130909001313
20130909001503
20130909001754
20130909002349
20130909005331
20130909005623
20130909010140
20130909010259
20130909021138
20130909021731
20130909022147
20130909022709
20130909022832
20130909023030
20130910194301
20130910194735
20130910200810
20130910200833
20130912214109
20130913150944
20130913151100
20130914213337
20130923031211
20130924160603
20130926164652
20130926201248
20131008175037
20131008175133
20131008175156
20131008183748
20131010195859
20131010201539
20131017193053
20131021175522
20131022152157
20131022164235
20131022192945
20131024155836
20131024201940
20131024203400
20131024204038
20131029021333
20131029045753
20131104011645
20131104022152
20131104023933
20131104033025
20131104042301
20131105170432
20131105192918
20131105193316
20131114143531
20131114145011
20131119200047
20131123134805
20131126192707
20140326121845
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY statuses (id, name, created_at, updated_at, project_id, "order") FROM stdin;
1	Backlog	2014-03-27 01:26:56.086811	2014-03-27 01:26:56.086811	1	1
2	In Progress	2014-03-27 01:26:56.094911	2014-03-27 01:26:56.094911	1	2
3	Done	2014-03-27 01:26:56.102207	2014-03-27 01:26:56.102207	1	9999
5	In Progress	2014-03-27 19:13:50.924918	2014-03-27 19:13:50.924918	2	2
6	Done	2014-03-27 19:13:50.932021	2014-03-27 19:13:50.932021	2	9999
7	Ready	2014-03-27 22:22:59.934215	2014-03-27 22:22:59.934215	2	1
4	Backlog	2014-03-27 19:13:50.917469	2014-03-27 22:23:23.751682	2	0
11	Backlog	2014-04-07 13:24:12.301481	2014-04-07 13:24:12.301481	3	1
12	In Progress	2014-04-07 13:24:12.327183	2014-04-07 13:24:12.327183	3	2
13	Done	2014-04-07 13:24:12.334296	2014-04-07 13:24:12.334296	3	9999
8	Coding	2014-03-27 22:23:16.136631	2014-04-09 21:44:35.097829	2	3
14	Testing & Review	2014-04-09 21:44:23.450253	2014-04-09 21:44:35.124293	2	4
\.


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('statuses_id_seq', 14, true);


--
-- Data for Name: sub_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sub_tasks (id, name, description, curr_state, task_id, created_at, updated_at) FROM stdin;
2	mandar mail de seguimiento		t	3	2014-04-02 17:49:25.076539	2014-04-02 23:04:44.974708
3	Agregar el nombre de la app		t	12	2014-04-08 19:17:24.690046	2014-04-08 19:35:23.769493
5	sacar el form y todo de pre_users		t	12	2014-04-08 19:17:37.42576	2014-04-08 19:47:22.797752
1	Crear minuta	Seguir formato correspondiente y guardar en DropBox	t	2	2014-04-01 00:21:57.708318	2014-04-08 20:44:21.490274
4	cambiar el favicon		t	12	2014-04-08 19:17:27.527977	2014-04-11 17:28:21.938515
6	desactivar el register	usando CanCan	t	12	2014-04-08 19:17:49.468228	2014-04-11 17:30:57.86196
\.


--
-- Name: sub_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_tasks_id_seq', 6, true);


--
-- Data for Name: task_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task_users (id, task_id, user_id, developer_id, creator_id, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	2014-03-27 01:35:31.950456	2014-03-27 01:35:31.950456
2	1	2	\N	\N	2014-03-27 19:05:27.616304	2014-03-27 19:05:27.616304
3	2	7	\N	\N	2014-03-28 03:04:54.494694	2014-03-28 03:04:54.494694
4	2	10	\N	\N	2014-03-28 03:04:54.498166	2014-03-28 03:04:54.498166
5	3	10	\N	\N	2014-03-31 00:24:59.099747	2014-03-31 00:24:59.099747
8	5	13	\N	\N	2014-03-31 23:40:31.638433	2014-03-31 23:40:31.638433
10	4	10	\N	\N	2014-04-01 00:20:50.412914	2014-04-01 00:20:50.412914
11	3	11	\N	\N	2014-04-01 00:21:03.974323	2014-04-01 00:21:03.974323
12	9	6	\N	\N	2014-04-01 21:11:36.424151	2014-04-01 21:11:36.424151
13	10	7	\N	\N	2014-04-02 18:58:23.887455	2014-04-02 18:58:23.887455
14	10	13	\N	\N	2014-04-02 18:58:23.892425	2014-04-02 18:58:23.892425
15	10	11	\N	\N	2014-04-02 18:58:23.894443	2014-04-02 18:58:23.894443
16	10	8	\N	\N	2014-04-02 18:58:23.896438	2014-04-02 18:58:23.896438
17	10	10	\N	\N	2014-04-02 18:58:23.898498	2014-04-02 18:58:23.898498
18	10	9	\N	\N	2014-04-02 18:58:23.90044	2014-04-02 18:58:23.90044
19	10	12	\N	\N	2014-04-02 18:59:55.595181	2014-04-02 18:59:55.595181
20	10	6	\N	\N	2014-04-02 18:59:55.597797	2014-04-02 18:59:55.597797
21	11	11	\N	\N	2014-04-04 21:13:59.317619	2014-04-04 21:13:59.317619
23	12	8	\N	\N	2014-04-08 19:17:11.097623	2014-04-08 19:17:11.097623
24	13	7	\N	\N	2014-04-08 19:41:49.787311	2014-04-08 19:41:49.787311
25	13	11	\N	\N	2014-04-08 19:41:49.823132	2014-04-08 19:41:49.823132
26	13	10	\N	\N	2014-04-08 19:41:49.825097	2014-04-08 19:41:49.825097
27	13	13	\N	\N	2014-04-08 19:41:49.827034	2014-04-08 19:41:49.827034
28	14	7	\N	\N	2014-04-08 20:45:22.178505	2014-04-08 20:45:22.178505
29	14	11	\N	\N	2014-04-08 20:45:22.180545	2014-04-08 20:45:22.180545
30	14	8	\N	\N	2014-04-08 20:45:22.182537	2014-04-08 20:45:22.182537
31	14	10	\N	\N	2014-04-08 20:45:22.184485	2014-04-08 20:45:22.184485
32	14	9	\N	\N	2014-04-08 20:45:22.18645	2014-04-08 20:45:22.18645
33	14	12	\N	\N	2014-04-08 20:45:22.188437	2014-04-08 20:45:22.188437
34	14	6	\N	\N	2014-04-08 20:45:22.190359	2014-04-08 20:45:22.190359
35	14	13	\N	\N	2014-04-08 20:45:22.192324	2014-04-08 20:45:22.192324
36	7	10	\N	\N	2014-04-08 22:42:45.110245	2014-04-08 22:42:45.110245
37	8	11	\N	\N	2014-04-08 22:44:15.745849	2014-04-08 22:44:15.745849
38	6	13	\N	\N	2014-04-08 22:46:56.833838	2014-04-08 22:46:56.833838
39	16	11	\N	\N	2014-04-08 22:51:50.036616	2014-04-08 22:51:50.036616
40	17	7	\N	\N	2014-04-08 22:53:37.456525	2014-04-08 22:53:37.456525
41	17	13	\N	\N	2014-04-08 22:53:37.458848	2014-04-08 22:53:37.458848
42	18	9	\N	\N	2014-04-08 22:54:26.114263	2014-04-08 22:54:26.114263
43	18	12	\N	\N	2014-04-08 22:54:26.123141	2014-04-08 22:54:26.123141
44	19	8	\N	\N	2014-04-08 22:55:29.442857	2014-04-08 22:55:29.442857
45	19	6	\N	\N	2014-04-08 22:55:29.444899	2014-04-08 22:55:29.444899
46	20	10	\N	\N	2014-04-08 22:56:46.628587	2014-04-08 22:56:46.628587
47	20	6	\N	\N	2014-04-08 22:56:46.630689	2014-04-08 22:56:46.630689
48	15	11	\N	\N	2014-04-08 22:56:57.383364	2014-04-08 22:56:57.383364
49	15	10	\N	\N	2014-04-08 22:56:57.385618	2014-04-08 22:56:57.385618
50	21	8	\N	\N	2014-04-09 18:03:17.596019	2014-04-09 18:03:17.596019
51	21	6	\N	\N	2014-04-09 18:03:17.607114	2014-04-09 18:03:17.607114
52	22	7	\N	\N	2014-04-14 23:13:33.241652	2014-04-14 23:13:33.241652
53	16	7	\N	\N	2014-04-15 19:39:39.125214	2014-04-15 19:39:39.125214
54	23	7	\N	\N	2014-04-15 20:19:28.518812	2014-04-15 20:19:28.518812
55	24	7	\N	\N	2014-04-16 00:39:16.797547	2014-04-16 00:39:16.797547
56	24	11	\N	\N	2014-04-16 00:39:16.799825	2014-04-16 00:39:16.799825
57	24	8	\N	\N	2014-04-16 00:39:16.801847	2014-04-16 00:39:16.801847
58	24	10	\N	\N	2014-04-16 00:39:16.803805	2014-04-16 00:39:16.803805
59	24	9	\N	\N	2014-04-16 00:39:16.805728	2014-04-16 00:39:16.805728
60	24	12	\N	\N	2014-04-16 00:39:16.807607	2014-04-16 00:39:16.807607
61	24	13	\N	\N	2014-04-16 00:39:16.809575	2014-04-16 00:39:16.809575
62	25	7	\N	\N	2014-04-16 00:41:14.894404	2014-04-16 00:41:14.894404
63	25	11	\N	\N	2014-04-16 00:41:14.897948	2014-04-16 00:41:14.897948
64	25	8	\N	\N	2014-04-16 00:41:14.899962	2014-04-16 00:41:14.899962
65	25	9	\N	\N	2014-04-16 00:41:14.902023	2014-04-16 00:41:14.902023
66	25	12	\N	\N	2014-04-16 00:41:14.903907	2014-04-16 00:41:14.903907
67	25	13	\N	\N	2014-04-16 00:41:14.905833	2014-04-16 00:41:14.905833
68	26	7	\N	\N	2014-04-16 01:12:43.443208	2014-04-16 01:12:43.443208
69	26	11	\N	\N	2014-04-16 01:12:43.445507	2014-04-16 01:12:43.445507
70	26	13	\N	\N	2014-04-16 01:12:43.447445	2014-04-16 01:12:43.447445
\.


--
-- Name: task_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('task_users_id_seq', 70, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tasks (id, name, description, task_father_id, task_type, status_update_at, project_id, status_id, requirement_id, label_id, estimated_hours, effective_hours, priority, created_at, updated_at, goal_id, task_depend_id, lock, use_case_id, archived, user_id) FROM stdin;
2	Reunión inicial con cliente	Necesitamos coordinar la reunión con J. Chartier ojalá antes del martes. \r\nSe decide para el Lunes a las 15:00 en el DCC.	\N	Administration	\N	2	6	\N	23	5	\N	1	2014-03-28 03:04:54.473789	2014-04-14 17:28:02.956323	\N	\N	f	\N	f	10
6	Crear las dos vistas iniciales de la app	Crear vistas XML de la app para el login y donde se mustra el logo	\N	Chore Android	\N	2	6	\N	30	5	\N	1	2014-04-01 00:17:01.679415	2014-04-14 17:42:22.02748	\N	\N	f	1	f	10
15	Modelo de base de datos	Una vez que lo ideemos, lo creamos en Rails y con el comando:\r\nrake erd\r\nSe puede crear un modelo como el pdf que ya está en la carpeta.	\N	Analysis	\N	2	5	\N	24	3	\N	1	2014-04-08 22:49:29.479385	2014-04-14 21:41:21.805251	\N	\N	f	\N	f	10
7	Crear API básica de autenticación	El servidor Rails debe ser capaz de recibir una combinación de user/pass por POST y retornar el JSON de un usuario.	\N	Chore Rails	\N	2	14	\N	26	2	\N	1	2014-04-01 00:18:22.13439	2014-04-14 21:41:54.091825	\N	\N	f	1	f	10
10	Primer approach SmartBoard	Los 8 del equipo queremos aprender a usar SmartBoard. La idea es que nuestros commits del git aparezcan acá en la tarea. Para esto hay que hacer un commit de prueba y poner en el mensaje #10 dentro del mensaje de commit. Ej: git commit -m "probando sm #10"	\N	Learning	\N	2	6	\N	32	1	\N	1	2014-04-02 18:58:23.865344	2014-04-14 21:48:08.581734	\N	\N	f	\N	f	10
12	Setup nombre y logo inicio TradeMedia	Ajustar las cosas básicas de la aplicación default a lo que necesitamos para el proyecto.	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-08 19:16:54.892214	2014-04-14 21:48:35.095289	\N	\N	f	2	f	10
23	Poder bloquear botones en los tablets		\N	Chore Android	\N	2	4	\N	30	2	\N	1	2014-04-15 20:19:28.493975	2014-04-15 20:19:28.493975	\N	\N	f	1	f	10
20	Crear mockups y digitalizarlos		\N	Analysis	\N	2	6	\N	24	3	\N	1	2014-04-08 22:56:46.625562	2014-04-14 21:48:43.345725	\N	\N	f	\N	f	10
5	Minuta Reunión Coaching	Escribir la minuta de la reunión de coaching y tenerla lista en el DropBox antes de la siguiente. Así se repetiría durante el semestre y puede cambiar la persona responsable.	\N	Administration	\N	2	6	\N	23	2	\N	1	2014-03-31 23:40:31.610569	2014-04-08 20:44:39.064603	\N	\N	f	\N	f	10
3	Organizar primera reunión de equipo		\N	Administration	\N	2	6	\N	23	3	\N	1	2014-03-28 03:55:21.078417	2014-04-02 23:04:50.701334	\N	\N	f	\N	f	10
17	Aprender más android y crear apps de prueba	Generar una app que tenga interacción con APIs en JSON	\N	Learning	\N	2	8	\N	32	5	\N	1	2014-04-08 22:53:37.452967	2014-04-14 23:12:48.714606	\N	\N	f	\N	f	10
4	Organizar equipos y ambiente de desarrollo	Se deben formar grupos para desarrollar en las distintas tecnologías(Rails y Android). Para eso se deben crear grupos de trabajo, donde es muy posible que se mezclen algunos que saben más con otros que saben menos. \r\n\r\nLos Grupos se definieron como: \r\nAndorid: Pancho, Felipe, Lucas y Max \r\nRails: Cristobal, Juank, Nicolás y Rodrigo	\N	Learning	\N	2	6	\N	32	3	\N	1	2014-03-31 00:41:34.330953	2014-04-07 18:21:02.832458	\N	\N	f	\N	f	10
13	Test run inicial de App Hello World en Tablets		\N	Chore Android	\N	2	6	\N	30	2	\N	1	2014-04-08 19:41:49.673778	2014-04-08 22:52:30.558393	\N	\N	f	\N	f	10
1	test	algo\r\n	\N	Feature	\N	1	1	\N	15	5	\N	4	2014-03-27 01:35:31.92774	2014-03-31 01:04:06.403269	\N	\N	f	\N	f	1
24	Reunión 3 Coaching		\N	Administration	\N	2	7	\N	23	10	\N	1	2014-04-16 00:39:16.79376	2014-04-16 00:39:16.79376	\N	\N	f	\N	f	11
25	Diseño BD		\N	Design	\N	2	7	\N	27	10	\N	1	2014-04-16 00:41:14.872158	2014-04-16 00:41:14.872158	\N	\N	f	\N	f	11
22	Diseñar modelo de API	Modelar el funcionamiento interno de la API que conectará el dispositivo Android con su contraparte web	\N	Design	\N	2	5	\N	27	2	\N	1	2014-04-14 23:13:33.184913	2014-04-14 23:13:47.132801	\N	\N	f	\N	f	7
14	Reunión 2 Coaching + reunión equipo		\N	Administration	\N	2	6	\N	23	2	\N	1	2014-04-08 20:45:22.175315	2014-04-09 00:44:16.288995	\N	\N	f	\N	f	10
18	Aprender Rails y crear apps simples	https://github.com/Brainshots/Basic-Guide	\N	Learning	\N	2	6	\N	32	5	\N	1	2014-04-08 22:54:26.109566	2014-04-15 15:57:54.93549	\N	\N	f	\N	f	10
26	Crear estructura de clases y modelos	Definir y crear la estructura de clases básica de Android.\r\nAgregar funcionalidades básicas a la misma.	\N	Chore Android	\N	2	8	\N	30	6	\N	1	2014-04-16 01:12:43.429435	2014-04-16 01:12:43.429435	\N	\N	f	1	f	7
19	Crear CRUD de clientes e invitaciones	Son los users pero con admin=false	\N	Chore Rails	\N	2	14	\N	26	4	\N	1	2014-04-08 22:55:29.43919	2014-04-15 19:11:40.963158	\N	\N	f	3	f	10
16	HTTP Request de autenticación y lectura de JSON de respuesta	Ya que las respuestas del servidor serán normalmente en JSON, la app debe poder leer fácilmente estos resultados de forma interna. Tal vez guardarlos en este formato también sea buena idea.	\N	Chore Android	\N	2	14	\N	30	3	\N	1	2014-04-08 22:51:50.033508	2014-04-10 02:46:51.689533	\N	\N	f	1	f	10
11	Despliegue en servidor cliente		\N	Administration	\N	2	7	\N	23	5	\N	1	2014-04-04 21:13:59.257079	2014-04-11 21:52:41.129506	\N	\N	f	\N	f	11
21	Solicitud de usuario y administración de clientes	Esta tarea incluye el tema de que TradeMedia debe poder aceptar esta solicitud de usuario a mano. Es en este momento que se le envía el correo de activación al usuario.	\N	Chore Rails	\N	2	14	\N	26	3	\N	1	2014-04-09 18:03:17.573124	2014-04-15 19:19:01.253531	\N	\N	f	3	f	10
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tasks_id_seq', 26, true);


--
-- Data for Name: test_cases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY test_cases (id, description, executed_at, approved, evaluation_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: test_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('test_cases_id_seq', 1, false);


--
-- Data for Name: use_case_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY use_case_groups (id, name, project_id, created_at, updated_at) FROM stdin;
1	Use Cases	1	2014-03-27 01:26:56.269952	2014-03-27 01:26:56.269952
2	Use Cases	2	2014-03-27 19:13:51.086911	2014-03-27 19:13:51.086911
3	Use Cases	3	2014-04-07 13:24:12.432404	2014-04-07 13:24:12.432404
4	MVP	2	2014-04-09 21:26:12.684438	2014-04-09 21:26:12.684438
\.


--
-- Name: use_case_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('use_case_groups_id_seq', 4, true);


--
-- Data for Name: use_case_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY use_case_templates (id, name, template_form, created_at, updated_at, project_id) FROM stdin;
1	RUP Template	{"atribuete1":{"name":"Scope","input_type":"input","data_type":"string","data_input":null},"atribuete2":{"name":"Primary Actor","input_type":"text_field_tag","data_type":"string","data_input":null},"atribuete3":{"name":"Basic Flow","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete4":{"name":"Alternate Flow 1","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete5":{"name":"Alternate Flow 2","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete6":{"name":"Alternate Flow 3","input_type":"text_area_tag","data_type":"text","data_input":null}}	2014-03-27 01:26:56.062023	2014-03-27 01:26:56.062023	1
2	RUP Template	{"atribuete1":{"name":"Scope","input_type":"input","data_type":"string","data_input":null},"atribuete2":{"name":"Primary Actor","input_type":"text_field_tag","data_type":"string","data_input":null},"atribuete3":{"name":"Basic Flow","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete4":{"name":"Alternate Flow 1","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete5":{"name":"Alternate Flow 2","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete6":{"name":"Alternate Flow 3","input_type":"text_area_tag","data_type":"text","data_input":null}}	2014-03-27 19:13:50.887239	2014-03-27 19:13:50.887239	2
3	RUP Template	{"atribuete1":{"name":"Scope","input_type":"input","data_type":"string","data_input":null},"atribuete2":{"name":"Primary Actor","input_type":"text_field_tag","data_type":"string","data_input":null},"atribuete3":{"name":"Basic Flow","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete4":{"name":"Alternate Flow 1","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete5":{"name":"Alternate Flow 2","input_type":"text_area_tag","data_type":"text","data_input":null},"atribuete6":{"name":"Alternate Flow 3","input_type":"text_area_tag","data_type":"text","data_input":null}}	2014-04-07 13:24:12.282166	2014-04-07 13:24:12.282166	3
\.


--
-- Name: use_case_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('use_case_templates_id_seq', 3, true);


--
-- Data for Name: use_cases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY use_cases (id, name, project_id, created_at, updated_at, use_case_template_id, data, use_case_group_id) FROM stdin;
1	El usuario debe poder descargar la app y linkearla a su cuenta en el servidor	2	2014-04-01 00:05:08.308693	2014-04-09 21:26:32.243228	2	{"atribuete2":"TradeMedia","atribuete3":"TradeMedia va al sitio físico de instalación y corre el setup inicial y registra el A-Mini o Tablet a la cuenta del cliente.","atribuete4":"Un cliente avanzado debe poder recibir el A-Mini o Tablet e instalar la app, ingresar sus credenciales y linkear el dispositivo a su cuenta.","atribuete5":"","atribuete6":""}	4
3	El cliente debe poder ver los usuarios de su empresa que tienen acceso y solicitar un nuevo usuario	2	2014-04-09 18:01:49.250738	2014-04-09 21:26:41.837628	2	{"atribuete2":"Cliente","atribuete3":"Un cliente con los permisos de administración de su empresa puede ver la lista de usuarios de ésta y también puede rellenar un formulario de registro solicitando de esta forma la inclusión de un nuevo usuario. \\r\\nEsta solicitud es procesada por TradeMedia y al aceptarla se le envía el correo de activación al usuario invitado.","atribuete4":"","atribuete5":"","atribuete6":""}	4
2	El cliente debe poder loguearse en el sitio web de administración de dispositivos de su empresa	2	2014-04-08 19:31:34.867037	2014-04-09 21:26:50.411038	2	{"atribuete2":"Cliente","atribuete3":"El cliente accede al sitio web e ingresa sus credenciales recibidas por correo con clave 'temporal' y obligándolo a cambiarla una vez logueado.","atribuete4":"El cliente ya tiene una cuenta y solo ingresa sus credenciales para acceder.","atribuete5":"","atribuete6":""}	4
4	El usuario debe poder subir contenido multimedia(limitado temp. a 10MB) al sitio	2	2014-04-09 21:29:19.047597	2014-04-09 21:29:19.047597	2	{"atribuete2":"Cliente","atribuete3":"Un usuario de una empresa debe poder subir fotos y videos a la plataforma si tiene los permisos correspondientes. ","atribuete4":"","atribuete5":"","atribuete6":""}	4
5	El cliente debe poder organizar sus contenidos multimedia en carpetas y renombrar archivos	2	2014-04-09 21:31:02.902695	2014-04-09 21:31:02.902695	2	{"atribuete2":"Cliente","atribuete3":"El contenido se debe poder subir directamente a una carpeta específica o moverse más adelante. También debe permitir cambiar el nombre de cualquier archivo.","atribuete4":"","atribuete5":"","atribuete6":""}	4
6	El cliente debe poder crear programaciones a partir del contenido multimedia	2	2014-04-09 21:33:24.773926	2014-04-09 21:33:24.773926	2	{"atribuete2":"Cliente","atribuete3":"El cliente debe poder seleccionar varios archivos multimedia y coordinarlos de manera secuencial, especificando la duración de las fotos y las veces que se repite un video.","atribuete4":"","atribuete5":"","atribuete6":""}	4
7	El cliente debe poder ver el estado de sus dispositivos	2	2014-04-09 21:38:18.917842	2014-04-09 21:38:18.917842	2	{"atribuete2":"Cliente","atribuete3":"El cliente debe ver en la lista de dispositivos si éstos están recibiendo órdenes y si tienen ya descargado el contenido necesario para reproducir la programación asignada.","atribuete4":"","atribuete5":"","atribuete6":""}	4
8	El cliente debe poder asignar programaciones a dispositivos y seleccionar su duración	2	2014-04-09 21:38:52.13749	2014-04-09 21:38:52.13749	2	{"atribuete2":"Cliente","atribuete3":"El cliente debe poder seleccionar una programación y asignársela a un dispositivo, especificando si se debe reproducir una cierta cantidad de veces o si se debe reproducir indefinidamente.","atribuete4":"","atribuete5":"","atribuete6":""}	4
\.


--
-- Name: use_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('use_cases_id_seq', 8, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, picture, curriculum, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, authentication_token, invitation_token, invitation_created_at, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_id, invited_by_type, provider, uid, avatar) FROM stdin;
13	lucasvalenzuela@gmail.com	$2a$10$FkkPcyX45JfiOC7Nw/KtmOTjCHu/z3WYjipRueSx0Ld0gW/RpyN9u	\N	\N	2014-04-15 01:02:21.071929	5	2014-04-15 01:02:21.088153	2014-04-15 00:14:34.321073	200.104.241.161	200.104.241.161	2014-03-27 22:04:47.210748	2014-04-15 01:02:21.089375	\N	\N	\N	\N	2014-03-30 19:49:02.150821	2014-03-27 22:04:47.210525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	asfura@gmail.com	$2a$10$Rn5N9JLCOQg6ZvrtLQ3Jd.6KWr4VYT9.bpUBC7Zqilr4Pce0Kpola	\N	\N	\N	3	2014-04-08 22:34:46.71523	2014-04-08 18:33:41.444795	127.0.0.1	127.0.0.1	2014-03-27 22:02:29.69843	2014-04-08 22:34:46.716796	Felipe Asfura	\N	\N	\N	2014-03-27 22:03:27.017018	2014-03-27 22:02:29.69818	\N	\N	\N	\N	\N	\N	\N	\N	\N	google_oauth2	108427519507772978919	\N
2	stgo.larrain@gmail.com	$2a$10$jj2vDb.36qZmoJgWSUhne.IJqSC1BwhhIA9.hVQHJJkphaO/Q6Ab6	\N	\N	\N	1	2014-03-27 17:42:17.959534	2014-03-27 17:42:17.959534	127.0.0.1	127.0.0.1	2014-03-27 17:40:59.555342	2014-03-27 17:42:17.962233	\N	\N	\N	\N	2014-03-27 17:42:13.25018	2014-03-27 17:40:59.554995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	franciscosandoval15@gmail.com	$2a$10$miVFffbFpu6O8Txml916uu9MofwEMZ.SdLhaWWgjX.ik9KVyMvQTa	\N	\N	\N	5	2014-04-08 22:40:02.52469	2014-04-08 22:38:33.588153	127.0.0.1	127.0.0.1	2014-03-27 22:03:59.904392	2014-04-08 22:40:02.526479	\N	\N	\N	\N	2014-03-27 22:48:32.45591	2014-03-27 22:03:59.904042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	milundguzzo@gmail.com	$2a$10$dGURpNp1ybSnOqz.I46tOeBjlkNoPvsW2O81rrAWnI7NnkZ/o.7ju	\N	\N	2014-04-07 13:23:37.660459	1	2014-04-07 13:23:37.701836	2014-04-07 13:23:37.701836	200.61.47.124	200.61.47.124	2014-04-07 13:20:31.177549	2014-04-07 13:23:37.704813	\N	\N	\N	\N	2014-04-07 13:23:31.971948	2014-04-07 13:20:31.163153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	reyarturo.risso@gmail.com	$2a$10$aF5PbINZ9fVtqs78wRM1Cuh6e7JmdwbbcoQ/DrcROVAmDRRJPp3km	\N	\N	\N	1	2014-03-29 15:10:09.906204	2014-03-29 15:10:09.906204	190.153.128.183	190.153.128.183	2014-03-29 15:09:38.911847	2014-03-29 15:10:09.907215	\N	\N	\N	\N	2014-03-29 15:09:38.901511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	maxfindel@gmail.com	$2a$10$4kZfkgG8LukdaiBdswpPy.w9E3txda9gxCm63vc9yeFvLpu1lR4Sy	\N	\N	2014-04-01 20:37:19.009651	6	2014-04-15 21:01:15.048949	2014-04-12 13:17:45.464021	127.0.0.1	190.101.58.167	2014-03-27 22:03:36.435321	2014-04-15 21:01:15.051729	\N	\N	\N	\N	2014-03-28 03:00:23.867377	2014-03-27 22:03:36.435089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	narisso@uc.cl	$2a$10$AClmM2a6A2fAJ4DLuTsUGO72mVyt3t.H.EMbItR7bT2BXcddrX4yq	\N	\N	\N	10	2014-04-03 00:26:08.056048	2014-03-31 01:01:28.351343	190.153.128.183	190.153.128.183	2014-03-27 01:26:15.679764	2014-04-03 00:26:08.061453	\N	\N	\N	\N	2014-03-27 01:26:34.688101	2014-03-27 01:26:15.679475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	rsfeir.n@gmail.com	$2a$10$xqfnDIvt8fyHAoZmxLDEe.jG61mVxND9oCuqWwHr8irkgIykaUWUa	\N	\N	2014-04-04 18:10:38.802926	7	2014-04-16 03:01:10.866984	2014-04-15 20:52:56.7149	200.28.227.159	127.0.0.1	2014-03-27 22:04:23.927092	2014-04-16 03:01:10.869871	\N	\N	\N	\N	2014-03-29 17:17:56.070087	2014-03-27 22:04:23.926855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	cijimenez90@gmail.com	$2a$10$kDU./GPZh67EISJsVB/kZeGLzt2pHAPkAal6Skdex7y6bw0G2E5/y	82e4737dd7492dac484e202a4f0283a3b469554dc861677298d0ac57ab110855	\N	2014-04-16 03:37:45.875461	14	2014-04-16 03:37:45.903435	2014-04-15 20:01:48.545031	190.160.46.178	127.0.0.1	2014-03-27 22:03:16.52187	2014-04-16 03:37:45.904513	\N	\N	\N	\N	2014-03-28 14:03:12.790757	2014-03-27 22:03:16.521553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	aneyem.academic@gmail.com	$2a$10$vBdCoh/xjp7MsBgi0kgovOLM2UPTxF6qh.BzCCafdZPYXAS7zSwmm	\N	\N	\N	15	2014-04-16 11:51:45.957421	2014-04-08 20:17:22.833983	146.155.13.106	127.0.0.1	2014-03-27 19:12:53.536532	2014-04-16 11:51:45.959999	\N	\N	\N	\N	2014-03-27 19:13:14.574533	2014-03-27 19:12:53.536097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	jrarriag@gmail.com	$2a$10$Na2b6YnZPMFPsOg0gW/oWuxwoa/.tMIMgkYRZRtaQTUe06LxAAK8e	\N	\N	\N	15	2014-04-14 22:11:37.574672	2014-04-14 20:37:48.825771	200.86.251.29	200.86.251.29	2014-03-27 22:02:01.703312	2014-04-14 22:11:37.577034	\N	\N	\N	\N	2014-03-28 22:45:07.367704	2014-03-27 22:02:01.702842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	nicolas.risso.c@gmail.com	$2a$10$HRSkSb5lyWEDM3wUNrlLN.s5VtkpunUfqJQHLC9Y0hjGWAdelibra	\N	\N	\N	28	2014-04-17 01:52:51.968359	2014-04-15 01:06:27.538475	190.153.128.183	190.153.128.183	2014-03-27 19:24:21.958116	2014-04-17 01:52:51.986197	Nicolas Risso	\N	\N	\N	2014-03-27 19:29:09.666509	2014-03-27 19:24:21.957788	\N	\N	\N	\N	\N	\N	\N	\N	\N	google_oauth2	102354521284744424317	\N
8	npcastrol@gmail.com	$2a$10$/gfOfYqxe85N2w3s/LLVxOZOjIB4zgjc.uPW.y3VzNp9nZbPvV.0O	\N	\N	\N	3	2014-04-04 17:41:24.855483	2014-04-01 20:44:19.929772	127.0.0.1	127.0.0.1	2014-03-27 22:02:58.764683	2014-04-04 17:41:24.857929	\N	\N	\N	\N	2014-03-27 22:48:31.273561	2014-03-27 22:02:58.764411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 15, true);


--
-- Name: bugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bugs
    ADD CONSTRAINT bugs_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: commits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY commits
    ADD CONSTRAINT commits_pkey PRIMARY KEY (id);


--
-- Name: document_project_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_project_requirements
    ADD CONSTRAINT document_project_requirements_pkey PRIMARY KEY (id);


--
-- Name: document_project_use_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_project_use_cases
    ADD CONSTRAINT document_project_use_cases_pkey PRIMARY KEY (id);


--
-- Name: document_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_projects
    ADD CONSTRAINT document_projects_pkey PRIMARY KEY (id);


--
-- Name: document_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_requirements
    ADD CONSTRAINT document_requirements_pkey PRIMARY KEY (id);


--
-- Name: document_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_tasks
    ADD CONSTRAINT document_tasks_pkey PRIMARY KEY (id);


--
-- Name: document_use_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_use_cases
    ADD CONSTRAINT document_use_cases_pkey PRIMARY KEY (id);


--
-- Name: goals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: project_role_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY project_role_users
    ADD CONSTRAINT project_role_users_pkey PRIMARY KEY (id);


--
-- Name: project_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY project_statuses
    ADD CONSTRAINT project_statuses_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: reported_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reported_hours
    ADD CONSTRAINT reported_hours_pkey PRIMARY KEY (id);


--
-- Name: requirement_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requirement_templates
    ADD CONSTRAINT requirement_templates_pkey PRIMARY KEY (id);


--
-- Name: requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: sub_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sub_tasks
    ADD CONSTRAINT sub_tasks_pkey PRIMARY KEY (id);


--
-- Name: task_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_users
    ADD CONSTRAINT task_users_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: test_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY test_cases
    ADD CONSTRAINT test_cases_pkey PRIMARY KEY (id);


--
-- Name: tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evaluations
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: use_case_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY use_case_groups
    ADD CONSTRAINT use_case_groups_pkey PRIMARY KEY (id);


--
-- Name: use_case_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY use_case_templates
    ADD CONSTRAINT use_case_templates_pkey PRIMARY KEY (id);


--
-- Name: use_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY use_cases
    ADD CONSTRAINT use_cases_pkey PRIMARY KEY (id);


--
-- Name: use_cases_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requirement_use_cases
    ADD CONSTRAINT use_cases_requirements_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_notifications_on_user_id ON notifications USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON users USING btree (invitation_token);


--
-- Name: index_users_on_invited_by_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_invited_by_id ON users USING btree (invited_by_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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


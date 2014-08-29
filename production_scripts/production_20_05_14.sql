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
11	8	28	Están listos los modelos y las relaciones. Faltaría crear las vistas y forms necesarios para el mvp.	t	2014-04-21 00:25:03.808146	2014-04-21 00:25:03.808146
12	6	30	Perdí mucho tiempo buscando las clases de bootstrap y aprendiendo la semántica identada con bootstrap.	t	2014-04-21 21:03:02.600004	2014-04-21 21:03:02.600004
13	9	27	Fue necesario instalar ImageMagick	t	2014-04-22 14:14:36.221334	2014-04-22 14:14:36.221334
14	12	27	Admite fotos y programación básica. Falta solo lectura de videos	t	2014-04-22 19:55:01.757914	2014-04-22 19:55:01.757914
15	6	37	Falta que se realice un Merge de la Branch de programming para agregar los path que faltan.	t	2014-04-24 20:31:49.534293	2014-04-24 20:31:49.534293
16	9	38	Los videos deben incluir la extension para ser subidos, de lo contrario habrá error	t	2014-04-25 17:13:57.202878	2014-04-25 17:13:57.202878
17	6	32	Se perdio el commit por merge. Se filtra dispositivos por empresa. Admin puede "Ver" como empresa	t	2014-04-25 19:30:37.783607	2014-04-25 19:30:37.783607
18	6	40	Esta la integracion con paperclip. Falta cambiar el show y edit.	t	2014-04-25 21:12:02.939704	2014-04-25 21:12:02.939704
19	6	41	Vistas de Grupos hechas, se perdió msg de commit por merge	t	2014-04-28 22:20:23.884591	2014-04-28 22:20:23.884591
20	6	54	Boton volver admin temporalmente en dropdown de config (.navright)	t	2014-05-02 22:21:10.259295	2014-05-02 22:21:10.259295
21	6	54	commit se perdio en merge	t	2014-05-02 22:23:37.051745	2014-05-02 22:23:37.051745
22	9	55	Commitie mal el id de la tarea: cristobal jimenez(cijimenez90@gmail.com) 8913b9: se agrego descripcion a las vistas de contents #51	t	2014-05-04 22:40:11.297975	2014-05-04 22:40:11.297975
23	6	45	Requisitos y Casos de uso.	t	2014-05-04 23:26:20.041581	2014-05-04 23:26:20.041581
24	6	65	para 3 columnas esta la base, solo hay que cambiar en la vista el uso de columnas	t	2014-05-16 17:41:00.685271	2014-05-16 17:41:00.685271
26	6	65	Contenido + dispositivos con esqueleto hecho.	t	2014-05-19 20:20:26.529789	2014-05-19 20:20:26.529789
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 26, true);


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
31	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e20c14b35f88701f7982f71404527af363b216ca	e20c14b35f88701f7982f71404527af363b216ca	Nicolas Castro	npcastrol@gmail.com	2014-04-15T16:19:22-03:00	Terminado comportamiento de usuario #21	21	2014-04-18 13:28:03.788124	2014-04-18 13:28:03.788124
32	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/5eb1700bc070afd85fb74a4bd7b8d81d744cb503	5eb1700bc070afd85fb74a4bd7b8d81d744cb503	cristobal jimenez	cijimenez90@gmail.com	2014-04-18T10:13:14-04:00	primera version de modelo de datos para programaciones creado #27	27	2014-04-18 14:13:45.968178	2014-04-18 14:13:45.968178
33	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/befce4d75fc3fb9788ad3db7301f9263a5c8032a	befce4d75fc3fb9788ad3db7301f9263a5c8032a	cristobal jimenez	cijimenez90@gmail.com	2014-04-18T12:46:10-04:00	- Ya se pueden subir fotos (.../contents)\n- Ya se genero el scaffold para programaciones\n- #27	27	2014-04-18 16:49:14.863098	2014-04-18 16:49:14.863098
34	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/2691371b4f98bc7d3c595494265b968d9cf06691	2691371b4f98bc7d3c595494265b968d9cf06691	Nicolas Castro	npcastrol@gmail.com	2014-04-20T20:44:30-03:00	Creo los grupos #28	28	2014-04-20 23:44:32.745387	2014-04-20 23:44:32.745387
35	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/7f966fca08e23ed008607a3ae214f6fbb4f1bc9f	7f966fca08e23ed008607a3ae214f6fbb4f1bc9f	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-20T21:13:01-03:00	base de capa de persistencia incluyendo clases base e implementaciones especificas para persistir DeviceInformation y Multimedia #29	29	2014-04-21 00:13:27.101262	2014-04-21 00:13:27.101262
36	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/f78506420a35585924dfb7b244ab1ea3a69bf417	f78506420a35585924dfb7b244ab1ea3a69bf417	Nicolas Castro	npcastrol@gmail.com	2014-04-20T21:23:46-03:00	Agrego relacion entre grupos y dispositivos. #28	28	2014-04-21 00:23:44.643127	2014-04-21 00:23:44.643127
37	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/753f07625ded72789cfe1e585260b76e4a897c5a	753f07625ded72789cfe1e585260b76e4a897c5a	rnsfeir	rsfeir91@hotmail.com	2014-04-20T22:00:47-03:00	Se pueden crear programaciones básicas de imagenes (.../programs) y visualizarlas como una lista #27	27	2014-04-21 01:04:45.713548	2014-04-21 01:04:45.713548
38	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/b3298dd8c4ecb7d5fbd5bb9a674ea9641b8ac4ae	b3298dd8c4ecb7d5fbd5bb9a674ea9641b8ac4ae	rnsfeir	rsfeir91@hotmail.com	2014-04-20T22:23:00-03:00	Update, cambios en algunas redirecciones de links #27	27	2014-04-21 01:23:27.689665	2014-04-21 01:23:27.689665
39	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/97226b2760bdddd55827e1a2efb81c8ed4754be4	97226b2760bdddd55827e1a2efb81c8ed4754be4	Nicolas Castro	npcastrol@gmail.com	2014-04-21T15:33:16-03:00	Ahora cuando se crea un grupo, se pasa la empresa del usuario logueado como hidden field. #28	28	2014-04-21 18:33:21.191951	2014-04-21 18:33:21.191951
40	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/3b1dce32c4157d28512cc323d2b63881754bcd41	3b1dce32c4157d28512cc323d2b63881754bcd41	Nicolas Castro	npcastrol@gmail.com	2014-04-21T16:30:30-03:00	Agrego de nuevo empresas a los dispositivos. Ademas mejoro la manera en que se muestran empresas, grupos y dispositivos. #28	28	2014-04-21 19:30:32.829416	2014-04-21 19:30:32.829416
41	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/8d280f8d1baee8c0d9954dceca74a616cf9a22f6	8d280f8d1baee8c0d9954dceca74a616cf9a22f6	Juan Carlos	juan@juan-VirtualBox.(none)	2014-04-21T17:03:23-04:00	Agregada nueva barra, y arreglos a la existente #30	30	2014-04-21 21:05:30.793887	2014-04-21 21:05:30.793887
42	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/6d11127456d779ddf7b3dacc04a1a144fd16585b	6d11127456d779ddf7b3dacc04a1a144fd16585b	Nicolas Castro	npcastrol@gmail.com	2014-04-22T10:03:41-03:00	Cuano se crea un dispositivo. Este recibe implicitamente la empresa del usuario solicitante #28	28	2014-04-22 13:10:15.747016	2014-04-22 13:10:15.747016
43	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/4b9e95d2933f95ebeb83bd0dc5b8ec441a5af524	4b9e95d2933f95ebeb83bd0dc5b8ec441a5af524	unknown	asfura@gmail.com	2014-04-22T15:16:48-03:00	Adicion de metodos y conexion entre vistas #26	26	2014-04-22 18:16:50.800713	2014-04-22 18:16:50.800713
44	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/6782e91dfe1c8337e964c8eff71fa4829890558c	6782e91dfe1c8337e964c8eff71fa4829890558c	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-22T15:32:01-03:00	arreglo de conflictos al hacer merge con master #29	29	2014-04-22 18:31:51.514515	2014-04-22 18:31:51.514515
45	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/6782e91dfe1c8337e964c8eff71fa4829890558c	6782e91dfe1c8337e964c8eff71fa4829890558c	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-22T15:32:01-03:00	arreglo de conflictos al hacer merge con master #29	29	2014-04-22 18:33:21.47583	2014-04-22 18:33:21.47583
46	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/c13200b99e8e3826f4757f3fd2a41434bb4f5ce9	c13200b99e8e3826f4757f3fd2a41434bb4f5ce9	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-22T16:12:11-03:00	primer modelo guardado (DeviceInformation) en LoginActivity #29	29	2014-04-22 19:11:55.806184	2014-04-22 19:11:55.806184
47	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/c13200b99e8e3826f4757f3fd2a41434bb4f5ce9	c13200b99e8e3826f4757f3fd2a41434bb4f5ce9	Francisco Sandoval	franciscosandoval15@gmail.com	2014-04-22T16:12:11-03:00	primer modelo guardado (DeviceInformation) en LoginActivity #29	29	2014-04-22 19:12:25.419383	2014-04-22 19:12:25.419383
48	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/3a7cf3152625439a0f3ea51e2c675e29300bb47d	3a7cf3152625439a0f3ea51e2c675e29300bb47d	Nicolas Castro	npcastrol@gmail.com	2014-04-22T16:15:01-03:00	Agrego lo mismo para update #33	33	2014-04-22 19:15:18.580923	2014-04-22 19:15:18.580923
49	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/95f89541dce1888c3c85e2f8a471a50d427d4cd6	95f89541dce1888c3c85e2f8a471a50d427d4cd6	unknown	asfura@gmail.com	2014-04-22T16:31:17-03:00	Descarga de imagen sencilla y cambio de imageholder #26	26	2014-04-22 19:31:40.623327	2014-04-22 19:31:40.623327
50	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/116bd7905964b62b8b723988d838ad6cb314bb01	116bd7905964b62b8b723988d838ad6cb314bb01	Nicolas Castro	npcastrol@gmail.com	2014-04-22T16:37:51-03:00	Agrego un helper que retorna el id de la empresa en sesion. Y guardo la empresa de los usuarios al momento del login. #32	32	2014-04-22 19:37:56.457211	2014-04-22 19:37:56.457211
51	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/febf8421c40c23ce07495228db0277941a5cd52e	febf8421c40c23ce07495228db0277941a5cd52e	unknown	asfura@gmail.com	2014-04-23T00:22:10-03:00	Fullscreen #26	26	2014-04-23 03:22:09.181027	2014-04-23 03:22:09.181027
52	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/3de125f93f98f61e9f142823399ec8ca791135d3	3de125f93f98f61e9f142823399ec8ca791135d3	Nicolas Castro	npcastrol@gmail.com	2014-04-24T14:58:48-03:00	Ocupo el nuevo helper current_enterprise al momento de crear usuarios empresas y dispositivos #32	32	2014-04-24 17:58:49.513551	2014-04-24 17:58:49.513551
55	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a02c04c526f9c0347116d7fb12d8565016a19411	a02c04c526f9c0347116d7fb12d8565016a19411	fjsandov	franciscosandoval15@gmail.com	2014-04-25T14:11:21-03:00	paginacion en users #41	41	2014-04-25 17:11:40.292497	2014-04-25 17:11:40.292497
58	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/3283f1d8be9a841e92641a1aff34295e6c2ecc73	3283f1d8be9a841e92641a1aff34295e6c2ecc73	rnsfeir	rsfeir91@hotmail.com	2014-04-25T13:59:40-03:00	Cambio de index con Bootstrap #34	34	2014-04-25 18:46:47.875165	2014-04-25 18:46:47.875165
62	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/778fee8ae16307377119d102c2aabc57f1db4704	778fee8ae16307377119d102c2aabc57f1db4704	Nicolas Castro	npcastrol@gmail.com	2014-04-26T14:26:36-03:00	Arreglo detalle de barra de navegacion #41	41	2014-04-26 17:26:20.667496	2014-04-26 17:26:20.667496
68	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e83db380bdaa1d838df38904f8355687473bd15d	e83db380bdaa1d838df38904f8355687473bd15d	Nicolas Castro	npcastrol@gmail.com	2014-04-28T10:36:53-04:00	Agrego diferencia entre dispositivos esperando activacion y el resto #39	39	2014-04-28 14:36:29.97802	2014-04-28 14:36:29.97802
70	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/b77c88787b6b39dd085d049e5c33d0b245a39cc8	b77c88787b6b39dd085d049e5c33d0b245a39cc8	Nicolas Castro	npcastrol@gmail.com	2014-04-28T12:11:50-04:00	- Solo se ofrecen dispositivos de la empresa actual en la edicion de grupos - Cambio en el show de grupos. #39	39	2014-04-28 16:11:28.79843	2014-04-28 16:11:28.79843
53	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a81f22cff1da5ef1682e76ead211052aea4dea6e	a81f22cff1da5ef1682e76ead211052aea4dea6e	Juan Carlos	juan@juan-VirtualBox.(none)	2014-04-24T16:33:32-04:00	Se dejo una barra de navegacion unica, Navegacion condicionada si es o no admin, falta merge de branches para agregar otros path #37	37	2014-04-24 20:33:35.428919	2014-04-24 20:33:35.428919
56	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/6131090c1fb54113701fc728feb1f2135278b7d9	6131090c1fb54113701fc728feb1f2135278b7d9	rnsfeir	rsfeir91@hotmail.com	2014-04-25T12:29:27-03:00	Se pueden subir videos y mostrarlos #38	38	2014-04-25 17:17:58.935964	2014-04-25 17:17:58.935964
59	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a66d064bcfa84935112d4d94c09f4b27fbbe5f3e	a66d064bcfa84935112d4d94c09f4b27fbbe5f3e	cristobal jimenez	cijimenez90@gmail.com	2014-04-25T15:06:01-04:00	primera sub-tarea lista #34	34	2014-04-25 19:06:10.81075	2014-04-25 19:06:10.81075
61	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/52afc6c941f33ac3f324faafd5d8b6c2ecca1056	52afc6c941f33ac3f324faafd5d8b6c2ecca1056	cristobal jimenez	cijimenez90@gmail.com	2014-04-25T15:55:54-04:00	tercera sub-tarea lista: se agrego boton para añadir contenido y se ligo a un modal vacio #34	34	2014-04-25 19:55:59.243541	2014-04-25 19:55:59.243541
65	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/39807a8152695742972f65a906563e3fdd16034d	39807a8152695742972f65a906563e3fdd16034d	Nicolas Castro	npcastrol@gmail.com	2014-04-26T16:17:55-03:00	Ahora los usuarios con multiples empresas pueden cambiar entre unas y otras. #40	40	2014-04-26 19:17:37.411443	2014-04-26 19:17:37.411443
54	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/92aaafcebaca4c1384bfeda357b135b2a709587c	92aaafcebaca4c1384bfeda357b135b2a709587c	Juan Carlos	juan@juan-VirtualBox.(none)	2014-04-25T13:06:54-04:00	Arreglos css de User, Integracion bootstrap a show de empresas y dispositivos #41	41	2014-04-25 17:06:56.268041	2014-04-25 17:06:56.268041
60	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/da697e1bb96ff11023c24f43df2b20abff7e7556	da697e1bb96ff11023c24f43df2b20abff7e7556	cristobal jimenez	cijimenez90@gmail.com	2014-04-25T15:38:07-04:00	segunda sub-tarea completada: se muestran modals vacios #34	34	2014-04-25 19:38:10.37509	2014-04-25 19:38:10.37509
63	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/540f21e125cee5c3c9aa46fd2bd914bc34f95b83	540f21e125cee5c3c9aa46fd2bd914bc34f95b83	Nicolas Castro	npcastrol@gmail.com	2014-04-26T15:01:35-03:00	Cambio barra de navegacion para que se paresca mas al mockup. #41	41	2014-04-26 18:01:16.957458	2014-04-26 18:01:16.957458
64	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/c198a50faa68ce8a7cea4b5feb1b49f36db5f5f4	c198a50faa68ce8a7cea4b5feb1b49f36db5f5f4	Nicolas Castro	npcastrol@gmail.com	2014-04-26T15:42:43-03:00	Arreglo detalles de orden en el html #41	41	2014-04-26 18:42:27.193929	2014-04-26 18:42:27.193929
67	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/b82806be25d84fcd1bfcf4ac8c3ca43ddf4241e5	b82806be25d84fcd1bfcf4ac8c3ca43ddf4241e5	Nicolas Castro	npcastrol@gmail.com	2014-04-28T10:31:38-04:00	Arreglo a la presentacion de dispositivos #41	41	2014-04-28 14:31:17.898765	2014-04-28 14:31:17.898765
71	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/4a74ca7c45aff6b8586e0aff4f908b5ef229dd14	4a74ca7c45aff6b8586e0aff4f908b5ef229dd14	Nicolas Castro	npcastrol@gmail.com	2014-04-28T12:14:29-04:00	Arreglo detalle en create de grupos #39	39	2014-04-28 16:14:04.934273	2014-04-28 16:14:04.934273
57	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/1baf7debfeb0e783f04ad7cc9a4de8ae63961c3f	1baf7debfeb0e783f04ad7cc9a4de8ae63961c3f	cijimenez90	cijimenez90@gmail.com	2014-04-25T13:54:25-04:00	Merge pull request #2 from iic2154-uc-cl/programming\n\nSe pueden subir videos y mostrarlos #38	38	2014-04-25 17:54:02.11938	2014-04-25 17:54:02.11938
66	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/39dfaa7c8ba7b64ea719c0423502bbb36d9bd685	39dfaa7c8ba7b64ea719c0423502bbb36d9bd685	Nicolas Castro	npcastrol@gmail.com	2014-04-28T10:16:41-04:00	Elimino la empresa de la lista de dispositivos. Es redundante con el nuevo manejo de empresas #39	39	2014-04-28 14:16:26.482263	2014-04-28 14:16:26.482263
69	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/d5e60b872313909b099de81bf2506ef5ef304f66	d5e60b872313909b099de81bf2506ef5ef304f66	Nicolas Castro	npcastrol@gmail.com	2014-04-28T11:22:27-04:00	Solo usuarios pueden crear empresas #40	40	2014-04-28 15:22:05.171602	2014-04-28 15:22:05.171602
72	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/0a2e9baa07d3989045d6953d7ef70ad32b581201	0a2e9baa07d3989045d6953d7ef70ad32b581201	rnsfeir	rsfeir91@hotmail.com	2014-04-28T13:08:40-04:00	modal de show #44	44	2014-04-28 17:08:45.378825	2014-04-28 17:08:45.378825
73	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/89f90f7c2256b9e85012e9578f4b3e347b80db2f	89f90f7c2256b9e85012e9578f4b3e347b80db2f	rnsfeir	rsfeir91@hotmail.com	2014-04-28T14:01:52-04:00	mejoras del modal #44	44	2014-04-28 18:01:45.219244	2014-04-28 18:01:45.219244
74	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/9d9c6b6cfc0399a599929cbcfa442ad974f85b98	9d9c6b6cfc0399a599929cbcfa442ad974f85b98	fjsandov	franciscosandoval15@gmail.com	2014-04-28T14:51:13-04:00	show de programa en la misma vista (ajax) y new en modal (ajax) #36	36	2014-04-28 18:51:19.819974	2014-04-28 18:51:19.819974
75	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/037645247723af8f7e75adcb4795fe29db1c8974	037645247723af8f7e75adcb4795fe29db1c8974	fjsandov	franciscosandoval15@gmail.com	2014-04-28T17:02:10-04:00	edit de programacion se pasó a modal #36	36	2014-04-28 21:01:39.071209	2014-04-28 21:01:39.071209
76	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/f512b3f89614cf268d17275b64cb88454d490885	f512b3f89614cf268d17275b64cb88454d490885	Nicolas Castro	npcastrol@gmail.com	2014-04-28T19:07:35-04:00	Arreglo icono de herramientas en el layout. #41	41	2014-04-28 23:07:17.378186	2014-04-28 23:07:17.378186
77	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/0b1b0aa9cfce03eaad169d34b45bb919cf9f9d96	0b1b0aa9cfce03eaad169d34b45bb919cf9f9d96	maxfindel	maxfindel@gmail.com	2014-04-28T20:53:57-04:00	 api update #15 y navigation	15	2014-04-29 00:50:57.148225	2014-04-29 00:50:57.148225
78	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a4b820ac5be51d0aa05af9bb15e3824f1850f6e9	a4b820ac5be51d0aa05af9bb15e3824f1850f6e9	maxfindel	maxfindel@gmail.com	2014-04-28T21:51:23-04:00	 api simplificada #36	36	2014-04-29 01:48:32.588531	2014-04-29 01:48:32.588531
79	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/cf67fa3629b6311abdcff96a8c80c5193357bda4	cf67fa3629b6311abdcff96a8c80c5193357bda4	maxfindel	maxfindel@gmail.com	2014-04-29T09:15:05-04:00	 devices api init #26	26	2014-04-29 13:11:57.481909	2014-04-29 13:11:57.481909
80	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/22fd60d22a6f319e717140243d6ac2f1a4681a61	22fd60d22a6f319e717140243d6ac2f1a4681a61	maxfindel	maxfindel@gmail.com	2014-04-29T11:24:23-04:00	 api devics funcional #26	26	2014-04-29 15:21:16.329993	2014-04-29 15:21:16.329993
81	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/788a9c1c90ef2e49f69c7ed1b7cab1b5470e026f	788a9c1c90ef2e49f69c7ed1b7cab1b5470e026f	Nicolas Castro	npcastrol@gmail.com	2014-04-29T14:47:20-04:00	Arreglo index de dispositivos, grupos y empresas. #41	41	2014-04-29 18:46:54.395717	2014-04-29 18:46:54.395717
82	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/74900ff0b6273f827ffb06538e952b00addde253	74900ff0b6273f827ffb06538e952b00addde253	fjsandov	franciscosandoval15@gmail.com	2014-04-29T22:27:11-04:00	fix de error de commit de modal con file (edit de content) #44	44	2014-04-30 02:30:01.156557	2014-04-30 02:30:01.156557
83	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/0ee4be12e7aee0f81f21b0cc831f8baa4db47488	0ee4be12e7aee0f81f21b0cc831f8baa4db47488	fjsandov	franciscosandoval15@gmail.com	2014-05-01T14:26:31-04:00	arreglo para que funcionen modals con forms que contienen archivos #46	46	2014-05-01 18:26:00.117823	2014-05-01 18:26:00.117823
84	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/16f9d8dc0e4cce2b45f238a4b719170295f4cd94	16f9d8dc0e4cce2b45f238a4b719170295f4cd94	fjsandov	franciscosandoval15@gmail.com	2014-05-01T20:07:44-04:00	ahora se pueden agregar contenidos a un programa (aun no eliminar ni reordenar) #36	36	2014-05-02 00:07:47.817878	2014-05-02 00:07:47.817878
85	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/3a483ac1ace43527e7eb640919631e74bb6a58b3	3a483ac1ace43527e7eb640919631e74bb6a58b3	unknown	asfura@gmail.com	2014-05-02T02:03:03-03:00	Proyecto mobil comenzado desde 0, copiadas las clases que existian #50	50	2014-05-02 05:02:56.13168	2014-05-02 05:02:56.13168
86	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/2e491c57a91b436b2c9161c07686a501607b11d2	2e491c57a91b436b2c9161c07686a501607b11d2	rnsfeir	rsfeir91@hotmail.com	2014-05-02T01:12:10-04:00	Se pueden subir videos e imagenes con los Modals, se corrigio el problema de las thumbnail #44	44	2014-05-02 05:13:09.670525	2014-05-02 05:13:09.670525
87	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/d71f3f808102f6d96117b5356e5e7f49feedc32c	d71f3f808102f6d96117b5356e5e7f49feedc32c	unknown	asfura@gmail.com	2014-05-02T04:54:48-03:00	algunos cambios para dejarla mas estable, si bien las playlist se crean no se pueden acceder desde la PlayerActivity #50	50	2014-05-02 07:54:26.138607	2014-05-02 07:54:26.138607
88	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/4a601826d9dbe165be309eadb7bb317cf025f6d1	4a601826d9dbe165be309eadb7bb317cf025f6d1	fjsandov	franciscosandoval15@gmail.com	2014-05-02T11:19:08-04:00	ahora se pueden borrar contenidos de las programaciones. Falta manejar videos (funciona con imagenes) #36	36	2014-05-02 15:18:48.008107	2014-05-02 15:18:48.008107
89	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e94b34b137e407924db2dfa54942c78faa110e05	e94b34b137e407924db2dfa54942c78faa110e05	fjsandov	franciscosandoval15@gmail.com	2014-05-02T12:48:33-04:00	ahora se consideran videos en edit y show de playlist #36	36	2014-05-02 16:48:10.227915	2014-05-02 16:48:10.227915
90	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/c5abfc71c56f471820b150cbe208e30e3f8a990e	c5abfc71c56f471820b150cbe208e30e3f8a990e	fjsandov	franciscosandoval15@gmail.com	2014-05-02T13:20:55-04:00	cambio de thumbnail de programaciones para considerar si parte con un video #36	36	2014-05-02 17:20:21.56057	2014-05-02 17:20:21.56057
91	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/87df87d73716e6091970ad727a676456228c8b89	87df87d73716e6091970ad727a676456228c8b89	cristobal jimenez	cijimenez90@gmail.com	2014-05-02T16:58:25-04:00	arreglos en css en contents #41	41	2014-05-02 20:58:02.962456	2014-05-02 20:58:02.962456
92	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/e16ceaaf09be70fa6253b3406a2494c6a9596811	e16ceaaf09be70fa6253b3406a2494c6a9596811	cristobal jimenez	cijimenez90@gmail.com	2014-05-02T17:40:28-04:00	ahora se muestran las imagenes mas grandes, no thumb #41	41	2014-05-02 21:41:24.066499	2014-05-02 21:41:24.066499
93	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/cc702ad3b640e9414d047a46328a0fa02f282a33	cc702ad3b640e9414d047a46328a0fa02f282a33	unknown	asfura@gmail.com	2014-05-02T23:51:11-03:00	Intentando mergear con downloader, recemos #50	50	2014-05-03 02:50:43.305674	2014-05-03 02:50:43.305674
94	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/4c9e6a7a797f195e9cc45971b91bc34ebed850ce	4c9e6a7a797f195e9cc45971b91bc34ebed850ce	luvalenz	Lucas@lucas-pc	2014-05-03T00:41:24-04:00	download manager listo #49	49	2014-05-03 04:40:45.387298	2014-05-03 04:40:45.387298
95	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/a93ea883d64df305eb921a18159310f70e7c3a7c	a93ea883d64df305eb921a18159310f70e7c3a7c	fjsandov	franciscosandoval15@gmail.com	2014-05-03T04:21:07-04:00	cambio de funcionamiento de contenidos en playlist para evitar errores al eliminar #36	36	2014-05-03 08:21:09.697855	2014-05-03 08:21:09.697855
99	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/29895a81c244cd1c7998ffea032484f9b3f58e4b	29895a81c244cd1c7998ffea032484f9b3f58e4b	fjsandov	franciscosandoval15@gmail.com	2014-05-03T22:32:20-04:00	los contenidos de playlist ahora son reordenables (drag and drop en vista de edicion) #36	36	2014-05-04 02:31:56.154352	2014-05-04 02:31:56.154352
100	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/f66f2e5092a9cd3417a4dd516461832788e5fe4c	f66f2e5092a9cd3417a4dd516461832788e5fe4c	Nicolas Castro	npcastrol@gmail.com	2014-05-03T23:15:33-04:00	Arreglo conflictos. Ademas ahora se pueden asignar dispositivos a una playlist. #53	53	2014-05-04 03:14:55.760415	2014-05-04 03:14:55.760415
101	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/8913b9b1b515596929d3fab25d9a7c9c9bf16bf1	8913b9b1b515596929d3fab25d9a7c9c9bf16bf1	cristobal jimenez	cijimenez90@gmail.com	2014-05-04T16:26:08-04:00	se agrego descripcion a las vistas de contents #51	51	2014-05-04 20:25:39.998659	2014-05-04 20:25:39.998659
96	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/28df4afdcd08be1f11a646e35c81a1f60628cd60	28df4afdcd08be1f11a646e35c81a1f60628cd60	fjsandov	franciscosandoval15@gmail.com	2014-05-03T05:21:34-04:00	ultimos cambios a edicion de playlist #36	36	2014-05-03 09:20:52.107	2014-05-03 09:20:52.107
103	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/505c9cafc2f280226ef2edce2bf6462b89ada31c	505c9cafc2f280226ef2edce2bf6462b89ada31c	fjsandov	franciscosandoval15@gmail.com	2014-05-04T18:45:01-04:00	botones con feedback de guardado en edicion de playlist #36	36	2014-05-04 22:44:35.871109	2014-05-04 22:44:35.871109
105	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/dafe2137336b77b57b5f99958ef81e72e65da133	dafe2137336b77b57b5f99958ef81e72e65da133	fjsandov	franciscosandoval15@gmail.com	2014-05-04T19:28:46-04:00	mano sobre li ordenables de edit de playlist #36	36	2014-05-04 23:28:11.605662	2014-05-04 23:28:11.605662
107	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/89c8c842b683b9f75cafd2ceee37aa1972918f01	89c8c842b683b9f75cafd2ceee37aa1972918f01	unknown	asfura@gmail.com	2014-05-05T23:40:08-03:00	Reproductor fuerza modo horizonal. Intenta conectar a internet cada 5 segundos. Desactivado botón de retroceso #50	50	2014-05-06 02:39:32.553514	2014-05-06 02:39:32.553514
97	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/da366251569af844b9140525df417df8b3472d13	da366251569af844b9140525df417df8b3472d13	Nicolas Castro	npcastrol@gmail.com	2014-05-03T12:54:39-04:00	Actualizo modelos 1 a n entre playlist y dispositivos. #53	53	2014-05-03 16:54:02.924099	2014-05-03 16:54:02.924099
102	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/fbfd74dd3367d33adc34ab767772e90a35aea0f9	fbfd74dd3367d33adc34ab767772e90a35aea0f9	fjsandov	franciscosandoval15@gmail.com	2014-05-04T18:10:24-04:00	agregando descripcion de contenidos a vista de edicion y show de playlists #36	36	2014-05-04 22:10:17.399903	2014-05-04 22:10:17.399903
104	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/77b817c64cc50369ff9e8b1d04b7b68d65431768	77b817c64cc50369ff9e8b1d04b7b68d65431768	fjsandov	franciscosandoval15@gmail.com	2014-05-04T19:18:37-04:00	nuevo flujo de new playlist #36	36	2014-05-04 23:18:17.262526	2014-05-04 23:18:17.262526
106	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/5d388230713f77d18a79cfea5602efeb6b748a78	5d388230713f77d18a79cfea5602efeb6b748a78	unknown	asfura@gmail.com	2014-05-05T22:35:04-03:00	App reproduce imagenes y video, pendiente actualizar la playlist #50	50	2014-05-06 01:34:32.405838	2014-05-06 01:34:32.405838
110	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/3ef4c84aa197eacb055d4d8322e4dc16bc4f7c00	3ef4c84aa197eacb055d4d8322e4dc16bc4f7c00	unknown	asfura@gmail.com	2014-05-06T15:48:06-03:00	Esconde la barra de navegacion #50	50	2014-05-06 18:47:29.616856	2014-05-06 18:47:29.616856
111	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/1f85805f49fd38abe01bece2ac84af0cf79ac32a	1f85805f49fd38abe01bece2ac84af0cf79ac32a	fjsandov	franciscosandoval15@gmail.com	2014-05-07T03:13:05-04:00	i18n en ingles y español de vistas de playlists #36	36	2014-05-07 07:12:31.041216	2014-05-07 07:12:31.041216
112	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/9043f65d1bed944e6321ca6dbc56dd859648d30e	9043f65d1bed944e6321ca6dbc56dd859648d30e	fjsandov	franciscosandoval15@gmail.com	2014-05-07T23:35:50-04:00	cambios css a vista de edicion de playlist para que se vea mejor en resoluciones bajas #36	36	2014-05-08 03:35:13.937846	2014-05-08 03:35:13.937846
114	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/118f4723ee92f475c19e74d1e8efc07f69282b8d	118f4723ee92f475c19e74d1e8efc07f69282b8d	unknown	asfura@gmail.com	2014-05-08T21:17:03-04:00	Aplicación presentada en Sprint 1 #50	50	2014-05-09 01:16:16.383751	2014-05-09 01:16:16.383751
116	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/fb0a24a92732c9b08cf26bd472aa795697d77703	fb0a24a92732c9b08cf26bd472aa795697d77703	Juan Carlos	juan@juan-VirtualBox.(none)	2014-05-16T13:38:24-04:00	css para poder hacer la doble o triple columna, aprovechando las col de bootstrap. #65	65	2014-05-16 17:37:15.639892	2014-05-16 17:37:15.639892
118	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/6a103233b20df7c61d364301b83b7c36fd3a328f	6a103233b20df7c61d364301b83b7c36fd3a328f	unknown	asfura@gmail.com	2014-05-19T15:26:22-04:00	Subiendo carpeta completa del sprint 1 #50	50	2014-05-19 19:25:28.600426	2014-05-19 19:25:28.600426
120	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/8875027ff27be657b5d9680198f84523e9b4063a	8875027ff27be657b5d9680198f84523e9b4063a	Juan Carlos	juan@juan-VirtualBox.(none)	2014-05-19T16:25:41-04:00	esqueleto vista contenidos #65	65	2014-05-19 20:24:58.447181	2014-05-19 20:24:58.447181
98	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/8242e964ac4b27bb16c711b9f5e9ae82941a8910	8242e964ac4b27bb16c711b9f5e9ae82941a8910	Nicolas Castro	npcastrol@gmail.com	2014-05-03T15:23:23-04:00	Listo CSS basico para asignacion de una playlist a dispositivos. #53	53	2014-05-03 19:22:53.961197	2014-05-03 19:22:53.961197
108	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/c0e8e76e7a855f5223442dab0ae9dac5d94b96e7	c0e8e76e7a855f5223442dab0ae9dac5d94b96e7	fjsandov	franciscosandoval15@gmail.com	2014-05-06T12:29:10-04:00	bugfix de elementos agregados (antes no se podia guardar duracion) #36	36	2014-05-06 16:28:30.835111	2014-05-06 16:28:30.835111
109	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/8933821c060caa5fc1e00810aeb76b2177943d69	8933821c060caa5fc1e00810aeb76b2177943d69	unknown	asfura@gmail.com	2014-05-06T14:45:23-03:00	Ya reproduce video e imagenes, falta actualizar la playlist onpull #50	50	2014-05-06 17:44:47.277597	2014-05-06 17:44:47.277597
113	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/2d7957bde8f9f253d6399a0abba263d47302a872	2d7957bde8f9f253d6399a0abba263d47302a872	fjsandov	franciscosandoval15@gmail.com	2014-05-08T00:46:47-04:00	arreglos css a algunas vistas y se agrego breadcrumbs a vistas de playlist #41	41	2014-05-08 04:46:15.877948	2014-05-08 04:46:15.877948
115	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/447835c0b4611cfd77796468e39eeee30e40e2fe	447835c0b4611cfd77796468e39eeee30e40e2fe	Juan Carlos	juan@juan-VirtualBox.(none)	2014-05-15T17:19:29-04:00	Navegacion con Tabs #65	65	2014-05-15 21:18:34.49173	2014-05-15 21:18:34.49173
117	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/d26b20d7b227e55781a1dbab90decaf4624c089b	d26b20d7b227e55781a1dbab90decaf4624c089b	Nicolas Castro	npcastrol@gmail.com	2014-05-17T16:30:33-04:00	Corrijo error al crear usuario como admin. Falta revisar configuracion de mails entre produccion y development. #35	35	2014-05-17 20:29:19.056345	2014-05-17 20:29:19.056345
119	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Web/commit/78fb95a6f57cf9c2b95c2eb46b67c456491bf9ea	78fb95a6f57cf9c2b95c2eb46b67c456491bf9ea	Juan Carlos	juan@juan-VirtualBox.(none)	2014-05-19T15:56:51-04:00	layout para dispositivos + css  #65	65	2014-05-19 19:55:51.406386	2014-05-19 19:55:51.406386
121	https://github.com/iic2154-uc-cl/2014-1-Grupo4-Mobile/commit/e3b44e9f27e3eaed1e2f6eb9514cee60539bfbf8	e3b44e9f27e3eaed1e2f6eb9514cee60539bfbf8	luvalenz	Lucas@lucas-pc	2014-05-20T10:08:57-04:00	Booter listo. La aplicación inicia al prender el dispositivo #73	73	2014-05-20 14:07:25.745429	2014-05-20 14:07:25.745429
\.


--
-- Name: commits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('commits_id_seq', 121, true);


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
5	Modelo ER		https://db.tt/eZhrBDC3	2	2014-04-19 20:00:39.15423	2014-04-19 20:00:39.15423	0	web
\.


--
-- Name: document_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_projects_id_seq', 5, true);


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
24	/projects/2/boards	You were assigned to a new task	6	t	2014-04-08 20:45:22.16009	2014-04-08 21:41:57.509436	\N
27	/projects/2/boards	You were assigned to a new task	7	f	2014-04-08 22:53:37.433722	2014-04-08 22:53:37.433722	\N
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
45	/projects/2/boards	You were assigned to a new task	13	f	2014-04-16 00:39:05.08523	2014-04-16 00:39:05.08523	\N
46	/projects/2/boards	You were assigned to a new task	7	f	2014-04-16 00:39:16.724798	2014-04-16 00:39:16.724798	\N
47	/projects/2/boards	You were assigned to a new task	11	f	2014-04-16 00:39:16.747374	2014-04-16 00:39:16.747374	\N
52	/projects/2/boards	You were assigned to a new task	13	f	2014-04-16 00:39:16.785	2014-04-16 00:39:16.785	\N
53	/projects/2/boards	You were assigned to a new task	7	f	2014-04-16 00:41:14.82122	2014-04-16 00:41:14.82122	\N
54	/projects/2/boards	You were assigned to a new task	11	f	2014-04-16 00:41:14.835041	2014-04-16 00:41:14.835041	\N
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
41	/projects/2/boards	You were assigned to a new task	8	t	2014-04-16 00:39:05.06137	2014-04-19 17:03:32.890052	\N
48	/projects/2/boards	You were assigned to a new task	8	t	2014-04-16 00:39:16.75478	2014-04-19 18:38:52.739987	\N
55	/projects/2/boards	You were assigned to a new task	8	t	2014-04-16 00:41:14.842597	2014-04-19 18:39:00.057511	\N
63	/projects/2/boards	You were assigned to a new task	12	t	2014-04-18 12:59:28.998736	2014-04-19 20:08:14.42253	\N
64	/projects/2/boards	You were assigned to a new task	8	f	2014-04-20 23:13:46.658133	2014-04-20 23:13:46.658133	\N
25	/projects/2/boards	You were assigned to a new task	13	t	2014-04-08 20:45:22.166582	2014-04-21 00:00:53.848506	\N
66	/projects/2/boards	You were assigned to a new task	11	f	2014-04-21 00:11:43.523297	2014-04-21 00:11:43.523297	\N
28	/projects/2/boards	You were assigned to a new task	13	t	2014-04-08 22:53:37.445993	2014-04-21 16:54:05.788331	\N
65	/projects/2/boards	You were assigned to a new task	6	t	2014-04-20 23:13:46.682343	2014-04-21 21:11:42.062053	\N
67	/projects/2/boards	You were assigned to a new task	6	t	2014-04-21 21:01:12.090336	2014-04-21 21:11:46.987268	\N
69	/projects/2/boards	You were assigned to a new task	8	f	2014-04-22 17:32:46.944855	2014-04-22 17:32:46.944855	\N
73	/projects/2/boards	You were assigned to a new task	8	f	2014-04-22 22:18:38.984408	2014-04-22 22:18:38.984408	\N
72	/projects/2/boards	You were assigned to a new task	12	t	2014-04-22 22:17:37.129564	2014-04-25 03:57:39.724433	\N
50	/projects/2/boards	You were assigned to a new task	9	t	2014-04-16 00:39:16.766693	2014-04-28 18:03:40.644523	\N
43	/projects/2/boards	You were assigned to a new task	9	t	2014-04-16 00:39:05.073309	2014-04-28 18:03:42.913222	\N
62	/projects/2/boards	You were assigned to a new task	9	t	2014-04-18 12:59:28.96631	2014-04-28 18:03:43.757305	\N
71	/projects/2/boards	You were assigned to a new task	9	t	2014-04-22 22:17:37.072956	2014-04-28 18:03:45.307569	\N
40	/projects/2/boards	You were assigned to a new task	11	t	2014-04-16 00:39:05.055762	2014-05-07 02:54:24.913915	\N
70	/projects/2/boards	You were assigned to a new task	8	t	2014-04-22 17:39:00.275954	2014-05-20 01:30:14.279426	\N
75	/projects/2/boards	You were assigned to a new task	6	t	2014-04-22 22:27:43.962607	2014-04-22 22:47:00.175032	\N
91	/projects/2/boards	You were assigned to a new task	10	t	2014-04-25 20:43:32.857092	2014-04-27 15:29:35.734726	\N
74	/projects/2/boards	You were assigned to a new task	8	t	2014-04-22 22:27:43.952447	2014-05-20 01:30:09.502753	\N
78	/projects/2/boards	You were assigned to a new task	11	f	2014-04-22 22:37:37.600387	2014-04-22 22:37:37.600387	\N
79	/projects/2/boards	You were assigned to a new task	8	f	2014-04-22 22:37:37.61156	2014-04-22 22:37:37.61156	\N
80	/projects/2/boards	You were assigned to a new task	9	f	2014-04-22 22:37:37.615435	2014-04-22 22:37:37.615435	\N
83	/projects/2/boards	You were assigned to a new task	7	f	2014-04-22 22:49:18.883923	2014-04-22 22:49:18.883923	\N
84	/projects/2/boards	You were assigned to a new task	11	f	2014-04-22 22:49:18.894894	2014-04-22 22:49:18.894894	\N
85	/projects/2/boards	You were assigned to a new task	8	f	2014-04-22 22:49:18.902172	2014-04-22 22:49:18.902172	\N
87	/projects/2/boards	You were assigned to a new task	9	f	2014-04-22 22:49:18.914094	2014-04-22 22:49:18.914094	\N
90	/projects/2/boards	You were assigned to a new task	13	f	2014-04-22 22:49:18.93066	2014-04-22 22:49:18.93066	\N
86	/projects/2/boards	You were assigned to a new task	10	t	2014-04-22 22:49:18.906777	2014-04-23 09:32:53.743453	\N
82	/projects/2/boards	You were assigned to a new task	6	t	2014-04-22 22:37:37.623402	2014-04-24 15:33:01.358709	\N
77	/projects/2/boards	You were assigned to a new task	6	t	2014-04-22 22:29:23.613864	2014-04-24 15:33:04.346633	\N
89	/projects/2/boards	You were assigned to a new task	6	t	2014-04-22 22:49:18.926046	2014-04-24 15:33:06.826965	\N
88	/projects/2/boards	You were assigned to a new task	12	t	2014-04-22 22:49:18.918692	2014-04-25 03:57:45.104694	\N
81	/projects/2/boards	You were assigned to a new task	12	t	2014-04-22 22:37:37.619436	2014-04-25 03:57:48.435417	\N
92	/projects/2/boards	You were assigned to a new task	9	f	2014-04-28 14:28:19.27469	2014-04-28 14:28:19.27469	\N
93	/projects/2/boards	You were assigned to a new task	12	t	2014-04-28 14:28:19.289397	2014-05-02 00:05:15.168242	\N
76	/projects/2/boards	You were assigned to a new task	8	t	2014-04-22 22:29:23.603341	2014-05-20 01:30:00.670522	\N
68	/projects/2/boards	You were assigned to a new task	10	t	2014-04-22 14:45:22.345941	2014-04-23 09:32:44.351203	\N
94	/projects/2/boards	You were assigned to a new task	7	f	2014-04-28 15:20:27.696238	2014-04-28 15:20:27.696238	\N
95	/projects/2/boards	You were assigned to a new task	11	f	2014-04-28 15:20:27.716168	2014-04-28 15:20:27.716168	\N
96	/projects/2/boards	You were assigned to a new task	8	f	2014-04-28 15:20:27.723243	2014-04-28 15:20:27.723243	\N
98	/projects/2/boards	You were assigned to a new task	9	f	2014-04-28 15:20:27.735156	2014-04-28 15:20:27.735156	\N
101	/projects/2/boards	You were assigned to a new task	13	f	2014-04-28 15:20:27.753512	2014-04-28 15:20:27.753512	\N
100	/projects/2/boards	You were assigned to a new task	6	t	2014-04-28 15:20:27.747122	2014-04-28 17:52:48.557035	\N
102	/projects/2/boards	You were assigned to a new task	11	f	2014-04-28 18:53:54.182706	2014-04-28 18:53:54.182706	\N
103	/projects/2/boards	You were assigned to a new task	7	f	2014-04-28 18:55:36.188059	2014-04-28 18:55:36.188059	\N
104	/projects/2/boards	You were assigned to a new task	11	f	2014-04-28 18:55:36.19893	2014-04-28 18:55:36.19893	\N
106	/projects/2/boards	You were assigned to a new task	13	f	2014-04-28 18:55:36.212511	2014-04-28 18:55:36.212511	\N
97	/projects/2/boards	You were assigned to a new task	10	t	2014-04-28 15:20:27.729578	2014-04-29 00:38:46.461267	\N
108	/projects/2/boards	You were assigned to a new task	13	f	2014-04-29 18:25:11.40802	2014-04-29 18:25:11.40802	\N
109	/projects/2/boards	You were assigned to a new task	11	f	2014-04-29 18:27:21.699339	2014-04-29 18:27:21.699339	\N
111	/projects/2/boards	You were assigned to a new task	13	f	2014-04-29 18:27:21.715542	2014-04-29 18:27:21.715542	\N
112	/projects/2/boards	You were assigned to a new task	7	f	2014-04-30 01:24:57.469908	2014-04-30 01:24:57.469908	\N
113	/projects/2/boards	You were assigned to a new task	11	f	2014-04-30 01:24:57.481249	2014-04-30 01:24:57.481249	\N
116	/projects/2/boards	You were assigned to a new task	9	f	2014-04-30 01:24:57.503671	2014-04-30 01:24:57.503671	\N
105	/projects/2/boards	You were assigned to a new task	10	t	2014-04-28 18:55:36.206446	2014-04-30 19:11:19.277882	\N
107	/projects/2/boards	You were assigned to a new task	10	t	2014-04-29 01:04:32.565793	2014-04-30 19:11:22.843265	\N
110	/projects/2/boards	You were assigned to a new task	10	t	2014-04-29 18:27:21.711679	2014-04-30 19:11:25.920801	\N
115	/projects/2/boards	You were assigned to a new task	10	t	2014-04-30 01:24:57.497158	2014-04-30 19:11:28.786984	\N
118	/projects/2/boards	You were assigned to a new task	7	f	2014-05-01 18:30:31.364856	2014-05-01 18:30:31.364856	\N
119	/projects/2/boards	You were assigned to a new task	11	f	2014-05-01 18:30:31.421357	2014-05-01 18:30:31.421357	\N
120	/projects/2/boards	You were assigned to a new task	8	f	2014-05-01 18:30:31.429017	2014-05-01 18:30:31.429017	\N
122	/projects/2/boards	You were assigned to a new task	9	f	2014-05-01 18:30:31.440905	2014-05-01 18:30:31.440905	\N
125	/projects/2/boards	You were assigned to a new task	13	f	2014-05-01 18:30:31.458054	2014-05-01 18:30:31.458054	\N
99	/projects/2/boards	You were assigned to a new task	12	t	2014-04-28 15:20:27.74153	2014-05-02 00:05:19.625576	\N
123	/projects/2/boards	You were assigned to a new task	12	t	2014-05-01 18:30:31.446054	2014-05-02 00:05:23.57203	\N
117	/projects/2/boards	You were assigned to a new task	12	t	2014-04-30 01:24:57.509117	2014-05-02 00:05:27.506975	\N
124	/projects/2/boards	You were assigned to a new task	6	t	2014-05-01 18:30:31.452809	2014-05-02 19:00:48.42586	\N
126	/projects/2/boards	You were assigned to a new task	8	f	2014-05-02 19:46:12.039548	2014-05-02 19:46:12.039548	\N
127	/projects/2/boards	You were assigned to a new task	6	t	2014-05-02 22:19:02.461737	2014-05-02 22:38:42.662168	\N
128	/projects/2/boards	You were assigned to a new task	9	f	2014-05-04 20:00:10.473141	2014-05-04 20:00:10.473141	\N
129	/projects/2/boards	You were assigned to a new task	9	f	2014-05-06 03:12:49.132948	2014-05-06 03:12:49.132948	\N
121	/projects/2/boards	You were assigned to a new task	10	t	2014-05-01 18:30:31.434232	2014-05-06 03:14:31.913673	\N
131	/projects/2/boards	You were assigned to a new task	7	f	2014-05-07 02:53:10.337316	2014-05-07 02:53:10.337316	\N
132	/projects/2/boards	You were assigned to a new task	11	f	2014-05-07 02:53:10.352457	2014-05-07 02:53:10.352457	\N
133	/projects/2/boards	You were assigned to a new task	8	f	2014-05-07 02:53:10.357734	2014-05-07 02:53:10.357734	\N
135	/projects/2/boards	You were assigned to a new task	9	f	2014-05-07 02:53:10.369649	2014-05-07 02:53:10.369649	\N
138	/projects/2/boards	You were assigned to a new task	13	f	2014-05-07 02:53:10.392107	2014-05-07 02:53:10.392107	\N
139	/projects/2/boards	You were assigned to a new task	7	f	2014-05-07 02:53:20.35009	2014-05-07 02:53:20.35009	\N
140	/projects/2/boards	You were assigned to a new task	11	f	2014-05-07 02:53:20.367815	2014-05-07 02:53:20.367815	\N
141	/projects/2/boards	You were assigned to a new task	8	f	2014-05-07 02:53:20.373198	2014-05-07 02:53:20.373198	\N
143	/projects/2/boards	You were assigned to a new task	9	f	2014-05-07 02:53:20.385173	2014-05-07 02:53:20.385173	\N
146	/projects/2/boards	You were assigned to a new task	13	f	2014-05-07 02:53:20.419579	2014-05-07 02:53:20.419579	\N
136	/projects/2/boards	You were assigned to a new task	12	t	2014-05-07 02:53:10.380132	2014-05-07 02:53:59.025496	\N
144	/projects/2/boards	You were assigned to a new task	12	t	2014-05-07 02:53:20.391615	2014-05-07 02:54:03.932167	\N
147	/projects/2/boards	You were assigned to a new task	7	f	2014-05-07 04:41:10.994354	2014-05-07 04:41:10.994354	\N
148	/projects/2/boards	You were assigned to a new task	11	f	2014-05-07 04:41:11.022239	2014-05-07 04:41:11.022239	\N
149	/projects/2/boards	You were assigned to a new task	8	f	2014-05-07 04:41:11.029279	2014-05-07 04:41:11.029279	\N
151	/projects/2/boards	You were assigned to a new task	9	f	2014-05-07 04:41:11.044321	2014-05-07 04:41:11.044321	\N
137	/projects/2/boards	You were assigned to a new task	6	t	2014-05-07 02:53:10.385619	2014-05-07 17:02:33.552727	\N
130	/projects/2/boards	You were assigned to a new task	10	t	2014-05-07 00:41:52.208121	2014-05-08 15:46:35.6917	\N
134	/projects/2/boards	You were assigned to a new task	10	t	2014-05-07 02:53:10.364149	2014-05-08 15:46:39.308053	\N
142	/projects/2/boards	You were assigned to a new task	10	t	2014-05-07 02:53:20.379653	2014-05-08 15:46:43.00488	\N
150	/projects/2/boards	You were assigned to a new task	10	t	2014-05-07 04:41:11.03721	2014-05-08 15:46:46.209633	\N
152	/projects/2/boards	You were assigned to a new task	12	t	2014-05-07 04:41:11.049204	2014-05-08 19:57:28.875607	\N
145	/projects/2/boards	You were assigned to a new task	6	t	2014-05-07 02:53:20.40912	2014-05-15 04:53:44.651723	\N
153	/projects/2/boards	You were assigned to a new task	6	t	2014-05-07 04:41:11.056392	2014-05-15 04:53:54.696762	\N
114	/projects/2/boards	You were assigned to a new task	8	t	2014-04-30 01:24:57.491737	2014-05-20 01:30:19.07199	\N
154	/projects/2/boards	You were assigned to a new task	13	f	2014-05-07 04:41:11.061224	2014-05-07 04:41:11.061224	\N
155	/projects/2/boards	You were assigned to a new task	7	f	2014-05-09 01:20:05.021853	2014-05-09 01:20:05.021853	\N
156	/projects/2/boards	You were assigned to a new task	11	f	2014-05-09 01:20:05.078306	2014-05-09 01:20:05.078306	\N
157	/projects/2/boards	You were assigned to a new task	8	f	2014-05-09 01:20:05.085845	2014-05-09 01:20:05.085845	\N
159	/projects/2/boards	You were assigned to a new task	9	f	2014-05-09 01:20:05.097797	2014-05-09 01:20:05.097797	\N
162	/projects/2/boards	You were assigned to a new task	13	f	2014-05-09 01:20:05.115915	2014-05-09 01:20:05.115915	\N
158	/projects/2/boards	You were assigned to a new task	10	t	2014-05-09 01:20:05.091934	2014-05-09 18:36:54.197211	\N
170	/projects/2/boards	You were assigned to a new task	11	f	2014-05-13 22:17:43.816686	2014-05-13 22:17:43.816686	\N
171	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:22:35.307742	2014-05-13 22:22:35.307742	\N
172	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:22:40.1476	2014-05-13 22:22:40.1476	\N
173	/projects/2/boards	You were assigned to a new task	11	f	2014-05-13 22:23:05.558489	2014-05-13 22:23:05.558489	\N
174	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:50.669272	2014-05-13 22:24:50.669272	\N
175	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:50.712209	2014-05-13 22:24:50.712209	\N
176	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:50.909534	2014-05-13 22:24:50.909534	\N
177	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:50.916379	2014-05-13 22:24:50.916379	\N
178	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:52.141851	2014-05-13 22:24:52.141851	\N
179	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:52.152375	2014-05-13 22:24:52.152375	\N
180	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:55.338146	2014-05-13 22:24:55.338146	\N
181	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:55.34862	2014-05-13 22:24:55.34862	\N
182	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:56.545365	2014-05-13 22:24:56.545365	\N
183	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:56.556648	2014-05-13 22:24:56.556648	\N
184	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:58.166794	2014-05-13 22:24:58.166794	\N
185	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:58.176778	2014-05-13 22:24:58.176778	\N
186	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:24:58.215605	2014-05-13 22:24:58.215605	\N
187	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:24:58.223281	2014-05-13 22:24:58.223281	\N
189	/projects/2/boards	You were assigned to a new task	9	f	2014-05-13 22:46:42.724928	2014-05-13 22:46:42.724928	\N
163	/projects/2/boards	You were assigned to a new task	10	t	2014-05-13 22:12:24.101891	2014-05-13 22:49:22.183047	\N
164	/projects/2/boards	You were assigned to a new task	10	t	2014-05-13 22:13:29.967281	2014-05-13 22:49:25.961765	\N
165	/projects/2/boards	You were assigned to a new task	10	t	2014-05-13 22:13:36.545324	2014-05-13 22:49:28.881681	\N
188	/projects/2/boards	You were assigned to a new task	10	t	2014-05-13 22:42:07.075915	2014-05-13 22:49:32.010404	\N
191	/projects/2/boards	You were assigned to a new task	7	f	2014-05-13 22:53:44.559574	2014-05-13 22:53:44.559574	\N
192	/projects/2/boards	You were assigned to a new task	13	f	2014-05-13 22:53:44.572483	2014-05-13 22:53:44.572483	\N
193	/projects/2/boards	You were assigned to a new task	8	f	2014-05-13 23:09:42.662635	2014-05-13 23:09:42.662635	\N
194	/projects/2/boards	You were assigned to a new task	9	f	2014-05-13 23:32:16.746725	2014-05-13 23:32:16.746725	\N
195	/projects/2/boards	You were assigned to a new task	9	f	2014-05-13 23:33:35.093474	2014-05-13 23:33:35.093474	\N
196	/projects/2/boards	You were assigned to a new task	9	f	2014-05-13 23:34:16.693469	2014-05-13 23:34:16.693469	\N
160	/projects/2/boards	You were assigned to a new task	12	t	2014-05-09 01:20:05.103916	2014-05-14 04:45:30.102276	\N
167	/projects/2/boards	You were assigned to a new task	12	t	2014-05-13 22:16:01.974782	2014-05-14 04:45:35.166852	\N
168	/projects/2/boards	You were assigned to a new task	12	t	2014-05-13 22:16:05.448746	2014-05-14 04:45:38.769511	\N
190	/projects/2/boards	You were assigned to a new task	12	t	2014-05-13 22:46:42.78481	2014-05-14 04:45:42.895287	\N
161	/projects/2/boards	You were assigned to a new task	6	t	2014-05-09 01:20:05.10973	2014-05-15 04:53:45.615858	\N
166	/projects/2/boards	You were assigned to a new task	6	t	2014-05-13 22:14:35.743632	2014-05-15 04:53:53.433045	\N
169	/projects/2/boards	You were assigned to a new task	6	t	2014-05-13 22:16:30.827628	2014-05-15 04:53:55.50304	\N
197	/projects/2/boards	You were assigned to a new task	8	f	2014-05-17 20:30:29.400061	2014-05-17 20:30:29.400061	\N
198	/projects/2/boards	You were assigned to a new task	8	f	2014-05-19 19:32:34.710091	2014-05-19 19:32:34.710091	\N
199	/projects/2/boards	You were assigned to a new task	11	f	2014-05-20 00:48:47.163702	2014-05-20 00:48:47.163702	\N
200	/projects/2/boards	You were assigned to a new task	8	f	2014-05-20 00:48:47.19341	2014-05-20 00:48:47.19341	\N
202	/projects/2/boards	You were assigned to a new task	13	f	2014-05-20 00:48:47.205264	2014-05-20 00:48:47.205264	\N
203	/projects/2/boards	You were assigned to a new task	13	f	2014-05-20 04:43:54.627892	2014-05-20 04:43:54.627892	\N
204	/projects/2/boards	You were assigned to a new task	7	f	2014-05-20 04:44:49.682995	2014-05-20 04:44:49.682995	\N
205	/projects/2/boards	You were assigned to a new task	7	f	2014-05-20 04:45:45.661893	2014-05-20 04:45:45.661893	\N
206	/projects/2/boards	You were assigned to a new task	11	f	2014-05-20 04:45:45.67371	2014-05-20 04:45:45.67371	\N
207	/projects/2/boards	You were assigned to a new task	13	f	2014-05-20 04:45:45.680395	2014-05-20 04:45:45.680395	\N
201	/projects/2/boards	You were assigned to a new task	10	t	2014-05-20 00:48:47.200355	2014-05-20 19:25:33.283766	\N
208	/projects/2/boards	You were assigned to a new task	7	f	2014-05-20 19:45:27.161559	2014-05-20 19:45:27.161559	\N
209	/projects/2/boards	You were assigned to a new task	11	f	2014-05-20 19:45:27.195614	2014-05-20 19:45:27.195614	\N
210	/projects/2/boards	You were assigned to a new task	8	f	2014-05-20 19:45:27.202605	2014-05-20 19:45:27.202605	\N
212	/projects/2/boards	You were assigned to a new task	9	f	2014-05-20 19:45:27.214592	2014-05-20 19:45:27.214592	\N
213	/projects/2/boards	You were assigned to a new task	12	f	2014-05-20 19:45:27.219482	2014-05-20 19:45:27.219482	\N
214	/projects/2/boards	You were assigned to a new task	6	f	2014-05-20 19:45:27.226531	2014-05-20 19:45:27.226531	\N
215	/projects/2/boards	You were assigned to a new task	13	f	2014-05-20 19:45:27.231418	2014-05-20 19:45:27.231418	\N
211	/projects/2/boards	You were assigned to a new task	10	t	2014-05-20 19:45:27.207472	2014-05-20 19:45:42.633511	\N
216	/projects/2/boards	You were assigned to a new task	10	t	2014-05-20 20:00:49.429402	2014-05-20 20:01:04.225711	\N
217	/projects/2/boards	You were assigned to a new task	7	f	2014-05-20 20:09:23.078351	2014-05-20 20:09:23.078351	\N
218	/projects/2/boards	You were assigned to a new task	13	f	2014-05-20 20:09:23.103978	2014-05-20 20:09:23.103978	\N
219	/projects/2/boards	You were assigned to a new task	12	f	2014-05-20 20:10:45.354832	2014-05-20 20:10:45.354832	\N
221	/projects/2/boards	You were assigned to a new task	6	f	2014-05-20 20:16:45.35066	2014-05-20 20:16:45.35066	\N
220	/projects/2/boards	You were assigned to a new task	10	t	2014-05-20 20:16:45.337555	2014-05-20 20:17:39.579062	\N
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notifications_id_seq', 221, true);


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
86	10	26	4	2014-04-29 13:11:28.693463	2014-04-29 15:20:29.400453
32	8	21	3	2014-04-14 15:53:52.605996	2014-04-15 19:18:52.907807
25	11	16	5	2014-04-10 02:43:11.568124	2014-04-15 19:39:51.230344
37	11	25	1	2014-04-16 00:41:28.052915	2014-04-16 00:41:28.052915
38	11	24	1	2014-04-16 00:41:35.308293	2014-04-16 00:41:35.308293
39	7	24	2	2014-04-16 01:12:59.345328	2014-04-16 01:12:59.345328
40	7	25	1	2014-04-16 01:13:09.875166	2014-04-16 01:13:09.875166
41	12	24	1	2014-04-16 03:02:10.906145	2014-04-16 03:02:10.906145
42	12	25	1	2014-04-16 03:02:23.894313	2014-04-16 03:02:23.894313
44	8	24	2	2014-04-16 18:44:16.124298	2014-04-16 18:44:16.124298
45	9	24	2	2014-04-18 12:55:24.419754	2014-04-18 12:55:24.419754
23	13	17	4	2014-04-09 20:48:06.700812	2014-04-21 00:01:38.226504
47	13	24	2	2014-04-21 00:02:20.93549	2014-04-21 00:02:20.93549
89	7	42	2	2014-04-29 18:29:01.470613	2014-04-29 18:29:01.470613
117	11	60	2	2014-05-07 04:41:53.30644	2014-05-07 04:41:53.30644
52	6	30	3	2014-04-21 21:03:10.525122	2014-04-21 21:03:10.525122
90	7	45	1	2014-04-29 18:58:31.828971	2014-04-29 18:58:31.828971
53	6	28	1	2014-04-22 04:25:46.366291	2014-04-22 04:25:46.366291
49	8	28	5	2014-04-21 00:24:05.054927	2014-04-22 13:04:04.760034
54	10	24	2	2014-04-22 14:41:34.219748	2014-04-22 14:41:34.219748
55	10	25	2	2014-04-22 14:43:13.239746	2014-04-22 14:43:13.239746
56	10	31	3	2014-04-22 14:45:38.060103	2014-04-22 14:45:38.060103
33	10	7	7	2014-04-14 17:27:51.015804	2014-04-22 15:21:26.573507
46	9	27	6	2014-04-18 16:49:46.045906	2014-04-22 16:20:53.237831
48	11	29	7	2014-04-21 00:18:33.150037	2014-04-22 19:24:23.917308
43	7	26	5	2014-04-16 15:02:31.687705	2014-04-22 19:33:16.396246
50	12	27	7	2014-04-21 00:46:18.405221	2014-04-22 19:53:48.182487
60	6	42	3	2014-04-22 22:51:37.986346	2014-04-22 22:51:37.986346
61	9	42	3	2014-04-22 22:52:31.324068	2014-04-22 22:52:31.324068
59	10	15	3	2014-04-22 20:06:33.889718	2014-04-23 09:33:43.875356
62	10	42	3	2014-04-23 09:34:17.004438	2014-04-23 09:34:17.004438
63	11	42	3	2014-04-23 15:53:43.636012	2014-04-24 04:49:44.053496
64	8	42	3	2014-04-24 17:40:44.153291	2014-04-24 17:40:44.153291
58	8	32	2	2014-04-22 20:01:05.440236	2014-04-24 18:08:02.566053
65	6	37	1	2014-04-24 20:10:17.744251	2014-04-24 20:10:17.744251
66	12	42	1	2014-04-25 05:54:46.852523	2014-04-25 05:54:46.852523
68	12	38	2	2014-04-25 17:18:48.649242	2014-04-25 17:18:48.649242
70	6	32	2	2014-04-25 19:34:41.651676	2014-04-25 19:34:41.651676
71	10	43	2	2014-04-25 20:43:39.311186	2014-04-25 20:43:39.311186
73	9	34	5	2014-04-25 21:25:02.42067	2014-04-25 21:25:02.42067
72	6	40	2	2014-04-25 21:12:20.653291	2014-04-25 22:04:01.152985
57	8	33	2	2014-04-22 18:50:36.058473	2014-04-29 19:53:26.220142
75	8	40	1	2014-04-26 19:17:37.366138	2014-04-26 19:17:37.366138
51	13	26	8	2014-04-21 16:54:27.104388	2014-04-27 00:21:53.814384
76	13	42	2	2014-04-27 00:25:25.561381	2014-04-27 00:25:25.561381
77	8	39	2	2014-04-28 14:58:54.655824	2014-04-28 15:54:58.630975
69	12	34	5	2014-04-25 18:47:19.669283	2014-04-28 18:02:31.288552
79	9	44	3	2014-04-28 18:03:56.289846	2014-04-28 18:03:56.289846
82	11	47	1	2014-04-28 18:55:52.235552	2014-04-28 18:55:52.235552
67	6	41	4	2014-04-25 17:07:55.163599	2014-04-28 22:13:30.105746
109	10	54	3	2014-05-05 00:23:38.749564	2014-05-08 15:45:20.287446
83	10	47	1	2014-04-29 00:42:08.381758	2014-04-29 00:42:08.381758
84	10	48	2	2014-04-29 01:04:52.85116	2014-04-29 01:04:52.85116
91	13	47	1	2014-04-30 01:20:59.997872	2014-04-30 01:20:59.997872
92	13	51	3	2014-04-30 01:26:01.271206	2014-04-30 01:26:01.271206
93	7	51	3	2014-04-30 20:16:20.148477	2014-04-30 20:16:20.148477
81	11	46	6	2014-04-28 18:54:21.212263	2014-05-01 18:28:35.503286
94	11	52	2	2014-05-01 18:30:46.449979	2014-05-01 18:30:46.449979
95	12	52	2	2014-05-02 00:06:12.71088	2014-05-02 00:06:12.71088
96	12	44	5	2014-05-02 00:07:42.957949	2014-05-02 00:07:42.957949
108	10	53	2	2014-05-05 00:22:39.256954	2014-05-05 00:22:39.256954
97	7	52	1	2014-05-02 04:59:04.459538	2014-05-02 04:59:04.459538
110	10	55	1	2014-05-05 00:24:04.952526	2014-05-05 00:24:04.952526
99	6	54	1	2014-05-02 22:20:28.971961	2014-05-02 22:20:28.971961
100	9	41	4	2014-05-02 23:37:08.964791	2014-05-02 23:37:08.964791
87	13	49	20	2014-04-29 18:25:54.129792	2014-05-03 04:39:47.447945
119	8	60	1	2014-05-07 20:15:44.713783	2014-05-07 20:15:44.713783
127	7	60	6	2014-05-09 01:17:06.230224	2014-05-09 01:17:06.230224
125	11	41	1	2014-05-08 04:46:41.583138	2014-05-08 04:46:41.583138
78	10	45	7	2014-04-28 15:20:35.476881	2014-05-08 15:45:10.288238
101	8	53	5	2014-05-03 16:54:22.788387	2014-05-04 02:52:48.386503
102	10	52	2	2014-05-04 15:43:03.125712	2014-05-04 15:43:03.125712
103	8	52	2	2014-05-04 18:24:51.75647	2014-05-04 18:24:51.75647
104	8	35	2	2014-05-04 22:27:36.03415	2014-05-04 22:27:36.03415
74	8	41	5	2014-04-26 18:02:40.046712	2014-05-04 22:30:37.199182
105	9	55	5	2014-05-04 22:40:29.102813	2014-05-04 22:40:29.102813
112	12	41	2	2014-05-06 01:02:17.612607	2014-05-06 01:02:17.612607
111	12	45	4	2014-05-06 01:01:46.592378	2014-05-06 20:50:47.663194
114	9	52	4	2014-05-06 20:52:54.133762	2014-05-06 20:52:54.133762
115	9	45	1	2014-05-06 20:54:38.304816	2014-05-06 20:54:38.304816
116	12	58	3	2014-05-07 02:53:34.110133	2014-05-07 02:53:34.110133
118	6	60	2	2014-05-07 17:02:47.853226	2014-05-07 17:02:47.853226
98	6	52	4	2014-05-02 18:59:56.054029	2014-05-07 17:02:57.082166
106	6	45	10	2014-05-04 23:25:51.085148	2014-05-09 00:40:06.760815
121	13	45	4	2014-05-07 21:46:05.503767	2014-05-07 21:46:05.503767
122	13	52	3	2014-05-07 21:48:29.105603	2014-05-07 21:48:29.105603
124	7	23	1	2014-05-08 02:29:13.97102	2014-05-08 02:29:13.97102
123	13	60	6	2014-05-07 21:49:23.172298	2014-05-07 21:49:30.823404
88	7	50	19	2014-04-29 18:28:14.358407	2014-05-08 02:30:54.647043
80	11	36	17	2014-04-28 18:52:14.628249	2014-05-08 04:47:10.247318
85	10	36	3	2014-04-29 01:48:15.717206	2014-05-08 15:45:32.35514
107	10	41	3	2014-05-05 00:20:28.649346	2014-05-08 15:46:01.646019
126	12	60	2	2014-05-08 19:31:36.098506	2014-05-08 19:31:36.098506
120	8	45	5	2014-05-07 20:35:15.610818	2014-05-08 23:45:17.84908
128	7	62	5	2014-05-09 01:21:03.423532	2014-05-09 01:21:03.423532
130	10	62	8	2014-05-09 18:36:46.747415	2014-05-09 18:36:46.747415
129	11	62	3	2014-05-09 05:32:01.725389	2014-05-09 05:33:05.996917
113	11	45	5	2014-05-06 20:38:02.03717	2014-05-09 05:33:25.381971
131	13	62	4	2014-05-11 00:10:08.22835	2014-05-11 00:10:08.22835
132	8	62	3	2014-05-14 02:13:38.793136	2014-05-14 02:13:38.793136
133	12	62	4	2014-05-14 04:45:15.312694	2014-05-14 04:45:15.312694
134	6	62	4	2014-05-15 04:51:54.945216	2014-05-15 04:52:27.765074
135	6	65	6	2014-05-15 21:23:00.452476	2014-05-19 20:38:52.24594
138	13	71	4	2014-05-20 00:45:06.350766	2014-05-20 14:27:07.744276
147	10	92	3	2014-05-20 19:56:03.389782	2014-05-20 19:56:03.389782
136	12	66	7	2014-05-18 23:30:26.866734	2014-05-20 04:54:29.495493
143	10	96	2	2014-05-20 19:45:34.497352	2014-05-20 19:45:34.497352
144	10	63	2	2014-05-20 19:53:27.693073	2014-05-20 19:53:27.693073
137	8	91	4	2014-05-19 23:21:32.456662	2014-05-19 23:21:32.456662
139	13	92	2	2014-05-20 00:49:13.813133	2014-05-20 00:49:13.813133
140	13	73	1	2014-05-20 14:23:14.110226	2014-05-20 14:23:14.110226
142	11	92	3	2014-05-20 18:37:42.092011	2014-05-20 18:37:42.092011
148	11	72	3	2014-05-20 19:56:40.146416	2014-05-20 19:56:40.146416
145	7	94	4	2014-05-20 19:55:06.312408	2014-05-20 19:56:41.658468
141	9	87	5	2014-05-20 16:31:46.697352	2014-05-20 16:32:30.096925
146	7	72	1	2014-05-20 19:55:15.702837	2014-05-20 19:55:15.702837
\.


--
-- Name: reported_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reported_hours_id_seq', 148, true);


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
26	8	1	2014-04-09 21:39:01.048705	2014-04-09 21:39:01.048705
27	\N	16	2014-04-18 13:18:32.706266	2014-04-18 13:18:32.706266
28	\N	17	2014-04-18 13:19:14.856296	2014-04-18 13:19:14.856296
29	9	1	2014-04-22 17:37:36.919002	2014-04-22 17:37:36.919002
30	\N	18	2014-05-04 19:56:28.488702	2014-05-04 19:56:28.488702
31	10	12	2014-05-04 20:50:26.301117	2014-05-04 20:50:26.301117
33	11	12	2014-05-04 20:57:10.057154	2014-05-04 20:57:10.057154
34	12	12	2014-05-04 21:00:50.37297	2014-05-04 21:00:50.37297
35	\N	19	2014-05-04 21:35:59.971148	2014-05-04 21:35:59.971148
36	7	10	2014-05-04 22:32:28.799479	2014-05-04 22:32:28.799479
37	8	11	2014-05-04 23:05:42.98374	2014-05-04 23:05:42.98374
38	\N	20	2014-05-04 23:13:55.955616	2014-05-04 23:13:55.955616
\.


--
-- Name: requirement_use_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requirement_use_cases_id_seq', 38, true);


--
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requirements (id, name, type, data, template_id, created_at, updated_at, description, project_id) FROM stdin;
1	La solución debe permitir administrar dispositivos Android remotamente y proyectarlo a pantallas externas	\N	\N	\N	2014-04-01 00:06:02.068656	2014-04-07 21:38:42.571232		2
9	La solución debe permitir subir contenido digital y manejar una biblioteca online	\N	\N	\N	2014-04-07 21:42:53.894702	2014-04-07 21:42:53.894702		2
10	La solución debe permitir analizar toda la información que genere valor que se pueda rescatar de los dispositivos	\N	\N	\N	2014-04-07 21:44:17.237321	2014-04-07 21:44:17.237321		2
13	La solución debe permitir a TradeMedia administrar a sus clientes y éstos a sus usuarios y permisos	\N	\N	\N	2014-04-07 21:46:34.574869	2014-04-07 21:46:34.574869		2
11	La solución debe permitir crear playlists a partir de contenidos	\N	\N	\N	2014-04-07 21:45:04.729925	2014-04-29 01:07:07.593123	Pueden haber playlists con un solo contenido (reproducir un video)	2
12	La solución debe permitir calendarizar playlists en los dispositivos	\N	\N	\N	2014-04-07 21:46:03.045163	2014-04-29 01:07:27.134881	Y replicar calendarizaciones en otros dispositivos.	2
15	La solución debe funcionar con mala señal de internet o cuando la conexión es inestable (No Funcional)	\N	\N	\N	2014-04-08 19:38:14.638944	2014-05-04 21:18:10.163671		2
14	La solución debe permitir mostrar contenido simultáneamente en una pantalla(No Funcional)	\N	\N	\N	2014-04-07 21:47:31.692803	2014-05-04 21:32:29.460199		2
19	La solución debe permitir crear templates	\N	\N	\N	2014-05-04 21:35:59.94568	2014-05-04 21:35:59.94568	Se deben poder crear layouts distintos para las playlists.	2
8	La solución debe permitir administrar la forma y horarios en que se consultan los datos(No Funcional)	\N	\N	\N	2014-04-07 21:42:09.327084	2014-05-04 22:25:00.865264	No la consulta de requests/órdenes	2
18	La solución debe permitir distintos roles de usuario(No Funcional)	\N	\N	\N	2014-05-04 19:56:28.300048	2014-05-04 22:59:25.754534	Deben existir distintos roles de usuarios, y estos deben desplegar módulos limitados según funcionalidad asignada al rol	2
20	La solución debe tener Intenacionalización de Idioma(No Funcional)	\N	\N	\N	2014-05-04 23:13:55.940762	2014-05-04 23:16:33.53074		2
\.


--
-- Name: requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requirements_id_seq', 20, true);


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
8	Filtro de contenido	Los usuarios solo deben cosas (contenido, programas, ususarios etc..) de la empresa actual que están ocupando.	\N	32	2014-04-22 22:15:47.02429	2014-04-22 22:15:47.02429
9	Unir barras en una sola		t	37	2014-04-22 22:21:48.721691	2014-04-24 20:09:53.66689
10	Añadir Links condicionados a admin		t	37	2014-04-22 22:23:20.709925	2014-04-24 20:09:59.668664
11	Agregar todas las rutas para usuario		t	37	2014-04-22 22:23:40.435551	2014-04-24 20:10:05.120894
13	Botones de Acciones Usuarios		t	41	2014-04-25 17:11:05.895142	2014-04-25 17:11:06.725171
35	Cambios modelo	Hacer cambios necesarios para que el modelo soporte ambos tipos de listas	\N	86	2014-05-19 19:30:01.920213	2014-05-19 19:30:01.920213
15	Mostrar modal	El primer paso es que caiga el modal, da lo mismo que no muestre nada	t	34	2014-04-25 17:40:51.133071	2014-04-25 19:35:25.523826
16	Modal para nuevo contenido		t	34	2014-04-25 17:41:12.048169	2014-04-25 19:54:50.489269
36	Cambios api	Cambiar el json entregado a la aplicación android. Se debe entregar simultáneamente la playlist activa y la inactiva.	\N	86	2014-05-19 19:30:33.811354	2014-05-19 19:30:33.811354
7	Cambio de empresa actual	Usuarios con múltiples empresas deben poder cambiar de empresas en una vista especial.	t	32	2014-04-22 22:14:57.628355	2014-04-28 02:05:31.312811
14	Listar	Agregamos los botones y la miniatura	t	34	2014-04-25 17:40:03.347055	2014-04-28 14:26:53.178024
20	Manejo de logos		t	40	2014-04-25 22:04:23.046775	2014-04-28 14:59:58.484573
21	Asignación de usuarios	Ver como se maneja la asignación de usuarios a una nueva empresa. 	\N	40	2014-04-28 15:00:35.329659	2014-04-28 15:00:35.329659
22	Permisos de creacion de empresas	Solo admins deben poder crear empresas. 	t	40	2014-04-28 15:01:07.435804	2014-04-28 15:22:10.018244
24	Asignación de dispositivos	- solo mostrar dispositivos de la empresa\r\n- hacer cambio de grupo si se selecciona un dispositivo que ya tenia\r\n- eliminar del grupo los que no hayan sido seleccionados en edit	t	39	2014-04-28 15:35:37.272083	2014-04-28 15:54:15.938104
23	Arreglar show de grupos	Tiene que mostrar los dispositivos actuales del grupo	t	39	2014-04-28 15:34:18.141495	2014-04-28 16:11:32.257912
25	Arreglo edit	Por ahora, los checkbox del edit tienen que venir con los dispositivos ya agregados.	\N	33	2014-04-29 16:48:18.446594	2014-04-29 16:48:18.446594
26	Boton Volver a admin	Cuando admin "ve" como empresa, debe tener un boton volver a admin	t	54	2014-05-02 22:20:23.378798	2014-05-02 22:20:24.318897
28	Boton asignar en playlist_index	Abre modal con todas las opciones de devices (checkbox para asignar)	\N	53	2014-05-03 16:42:06.408934	2014-05-03 16:42:06.408934
27	Actualizar modelos	Simplemente agregar un program_id a devices.	t	53	2014-05-03 16:41:31.982088	2014-05-03 16:54:08.297509
29	Boton asignar playlist en devices	Abre modal con radio button para asignar una playlist.	t	53	2014-05-03 16:42:44.634419	2014-05-03 21:22:07.512844
30	se acae al enviar correo inicial en prod		\N	21	2014-05-08 15:45:51.270609	2014-05-08 15:45:51.270609
31	navegación superior en forma de TABS		t	65	2014-05-15 21:16:40.608104	2014-05-15 21:17:24.654352
34	Crear Layout de 2 Columnas		t	65	2014-05-15 21:17:23.858157	2014-05-16 17:35:44.274019
\.


--
-- Name: sub_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_tasks_id_seq', 36, true);


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
71	27	9	\N	\N	2014-04-18 12:59:29.037731	2014-04-18 12:59:29.037731
72	27	12	\N	\N	2014-04-18 12:59:29.047558	2014-04-18 12:59:29.047558
73	28	8	\N	\N	2014-04-20 23:13:46.734959	2014-04-20 23:13:46.734959
74	28	6	\N	\N	2014-04-20 23:13:46.738671	2014-04-20 23:13:46.738671
75	29	11	\N	\N	2014-04-21 00:11:43.541845	2014-04-21 00:11:43.541845
76	30	6	\N	\N	2014-04-21 21:01:12.132392	2014-04-21 21:01:12.132392
77	25	10	\N	\N	2014-04-22 14:42:59.05371	2014-04-22 14:42:59.05371
78	31	10	\N	\N	2014-04-22 14:45:22.376926	2014-04-22 14:45:22.376926
79	32	8	\N	\N	2014-04-22 17:32:46.989294	2014-04-22 17:32:46.989294
80	33	8	\N	\N	2014-04-22 17:39:00.300138	2014-04-22 17:39:00.300138
81	32	6	\N	\N	2014-04-22 22:16:19.370351	2014-04-22 22:16:19.370351
82	34	9	\N	\N	2014-04-22 22:17:37.15385	2014-04-22 22:17:37.15385
83	34	12	\N	\N	2014-04-22 22:17:37.156076	2014-04-22 22:17:37.156076
84	35	8	\N	\N	2014-04-22 22:18:39.020894	2014-04-22 22:18:39.020894
85	36	9	\N	\N	2014-04-22 22:20:31.226172	2014-04-22 22:20:31.226172
86	36	12	\N	\N	2014-04-22 22:20:31.228341	2014-04-22 22:20:31.228341
87	38	9	\N	\N	2014-04-22 22:21:43.126147	2014-04-22 22:21:43.126147
88	37	6	\N	\N	2014-04-22 22:24:14.301911	2014-04-22 22:24:14.301911
89	39	8	\N	\N	2014-04-22 22:27:43.974632	2014-04-22 22:27:43.974632
90	39	6	\N	\N	2014-04-22 22:27:43.97675	2014-04-22 22:27:43.97675
91	40	8	\N	\N	2014-04-22 22:29:23.622661	2014-04-22 22:29:23.622661
92	40	6	\N	\N	2014-04-22 22:29:23.624697	2014-04-22 22:29:23.624697
93	41	11	\N	\N	2014-04-22 22:37:37.632964	2014-04-22 22:37:37.632964
94	41	8	\N	\N	2014-04-22 22:37:37.63519	2014-04-22 22:37:37.63519
95	41	9	\N	\N	2014-04-22 22:37:37.637103	2014-04-22 22:37:37.637103
96	41	12	\N	\N	2014-04-22 22:37:37.639023	2014-04-22 22:37:37.639023
97	41	6	\N	\N	2014-04-22 22:37:37.640927	2014-04-22 22:37:37.640927
98	42	7	\N	\N	2014-04-22 22:49:18.944255	2014-04-22 22:49:18.944255
99	42	11	\N	\N	2014-04-22 22:49:18.946469	2014-04-22 22:49:18.946469
100	42	8	\N	\N	2014-04-22 22:49:18.948392	2014-04-22 22:49:18.948392
101	42	10	\N	\N	2014-04-22 22:49:18.950333	2014-04-22 22:49:18.950333
102	42	9	\N	\N	2014-04-22 22:49:18.952283	2014-04-22 22:49:18.952283
103	42	12	\N	\N	2014-04-22 22:49:18.960878	2014-04-22 22:49:18.960878
104	42	6	\N	\N	2014-04-22 22:49:18.962902	2014-04-22 22:49:18.962902
105	42	13	\N	\N	2014-04-22 22:49:18.964758	2014-04-22 22:49:18.964758
106	38	12	\N	\N	2014-04-25 15:59:35.152638	2014-04-25 15:59:35.152638
107	43	10	\N	\N	2014-04-25 20:43:32.90018	2014-04-25 20:43:32.90018
108	44	9	\N	\N	2014-04-28 14:28:19.315066	2014-04-28 14:28:19.315066
109	44	12	\N	\N	2014-04-28 14:28:19.317224	2014-04-28 14:28:19.317224
110	45	7	\N	\N	2014-04-28 15:20:27.792868	2014-04-28 15:20:27.792868
111	45	11	\N	\N	2014-04-28 15:20:27.796703	2014-04-28 15:20:27.796703
112	45	8	\N	\N	2014-04-28 15:20:27.798725	2014-04-28 15:20:27.798725
113	45	10	\N	\N	2014-04-28 15:20:27.800603	2014-04-28 15:20:27.800603
114	45	9	\N	\N	2014-04-28 15:20:27.802517	2014-04-28 15:20:27.802517
115	45	12	\N	\N	2014-04-28 15:20:27.804438	2014-04-28 15:20:27.804438
116	45	6	\N	\N	2014-04-28 15:20:27.806306	2014-04-28 15:20:27.806306
117	45	13	\N	\N	2014-04-28 15:20:27.808364	2014-04-28 15:20:27.808364
118	44	11	\N	\N	2014-04-28 18:02:51.199227	2014-04-28 18:02:51.199227
119	36	11	\N	\N	2014-04-28 18:17:35.433096	2014-04-28 18:17:35.433096
120	46	11	\N	\N	2014-04-28 18:53:54.229207	2014-04-28 18:53:54.229207
121	47	7	\N	\N	2014-04-28 18:55:36.227666	2014-04-28 18:55:36.227666
122	47	11	\N	\N	2014-04-28 18:55:36.229896	2014-04-28 18:55:36.229896
123	47	10	\N	\N	2014-04-28 18:55:36.231806	2014-04-28 18:55:36.231806
124	47	13	\N	\N	2014-04-28 18:55:36.233695	2014-04-28 18:55:36.233695
125	48	10	\N	\N	2014-04-29 01:04:32.586219	2014-04-29 01:04:32.586219
126	36	10	\N	\N	2014-04-29 01:48:02.220972	2014-04-29 01:48:02.220972
127	26	10	\N	\N	2014-04-29 13:11:20.573358	2014-04-29 13:11:20.573358
128	49	13	\N	\N	2014-04-29 18:25:11.467431	2014-04-29 18:25:11.467431
129	50	11	\N	\N	2014-04-29 18:27:21.72817	2014-04-29 18:27:21.72817
130	50	10	\N	\N	2014-04-29 18:27:21.730111	2014-04-29 18:27:21.730111
131	50	13	\N	\N	2014-04-29 18:27:21.73216	2014-04-29 18:27:21.73216
132	50	7	\N	\N	2014-04-29 18:28:01.402972	2014-04-29 18:28:01.402972
133	51	7	\N	\N	2014-04-30 01:24:57.521833	2014-04-30 01:24:57.521833
134	51	11	\N	\N	2014-04-30 01:24:57.524138	2014-04-30 01:24:57.524138
135	51	8	\N	\N	2014-04-30 01:24:57.526047	2014-04-30 01:24:57.526047
136	51	10	\N	\N	2014-04-30 01:24:57.527929	2014-04-30 01:24:57.527929
137	51	9	\N	\N	2014-04-30 01:24:57.529775	2014-04-30 01:24:57.529775
138	51	12	\N	\N	2014-04-30 01:24:57.531729	2014-04-30 01:24:57.531729
139	51	13	\N	\N	2014-04-30 01:25:47.10866	2014-04-30 01:25:47.10866
140	52	7	\N	\N	2014-05-01 18:30:31.500593	2014-05-01 18:30:31.500593
141	52	11	\N	\N	2014-05-01 18:30:31.514788	2014-05-01 18:30:31.514788
142	52	8	\N	\N	2014-05-01 18:30:31.516718	2014-05-01 18:30:31.516718
143	52	10	\N	\N	2014-05-01 18:30:31.518623	2014-05-01 18:30:31.518623
144	52	9	\N	\N	2014-05-01 18:30:31.520516	2014-05-01 18:30:31.520516
145	52	12	\N	\N	2014-05-01 18:30:31.522389	2014-05-01 18:30:31.522389
146	52	6	\N	\N	2014-05-01 18:30:31.524339	2014-05-01 18:30:31.524339
147	52	13	\N	\N	2014-05-01 18:30:31.526214	2014-05-01 18:30:31.526214
149	54	6	\N	\N	2014-05-02 22:19:02.488676	2014-05-02 22:19:02.488676
151	41	10	\N	\N	2014-05-05 00:20:22.837529	2014-05-05 00:20:22.837529
155	56	9	\N	\N	2014-05-06 03:12:49.16135	2014-05-06 03:12:49.16135
158	58	7	\N	\N	2014-05-07 02:53:10.404643	2014-05-07 02:53:10.404643
159	58	11	\N	\N	2014-05-07 02:53:10.406898	2014-05-07 02:53:10.406898
160	58	8	\N	\N	2014-05-07 02:53:10.408756	2014-05-07 02:53:10.408756
161	58	10	\N	\N	2014-05-07 02:53:10.410682	2014-05-07 02:53:10.410682
162	58	9	\N	\N	2014-05-07 02:53:10.412568	2014-05-07 02:53:10.412568
163	58	12	\N	\N	2014-05-07 02:53:10.414424	2014-05-07 02:53:10.414424
164	58	6	\N	\N	2014-05-07 02:53:10.416337	2014-05-07 02:53:10.416337
165	58	13	\N	\N	2014-05-07 02:53:10.418197	2014-05-07 02:53:10.418197
166	59	7	\N	\N	2014-05-07 02:53:20.437264	2014-05-07 02:53:20.437264
167	59	11	\N	\N	2014-05-07 02:53:20.439206	2014-05-07 02:53:20.439206
168	59	8	\N	\N	2014-05-07 02:53:20.441105	2014-05-07 02:53:20.441105
169	59	10	\N	\N	2014-05-07 02:53:20.442959	2014-05-07 02:53:20.442959
170	59	9	\N	\N	2014-05-07 02:53:20.444773	2014-05-07 02:53:20.444773
171	59	12	\N	\N	2014-05-07 02:53:20.446634	2014-05-07 02:53:20.446634
172	59	6	\N	\N	2014-05-07 02:53:20.448446	2014-05-07 02:53:20.448446
173	59	13	\N	\N	2014-05-07 02:53:20.450294	2014-05-07 02:53:20.450294
148	53	8	\N	\N	2014-05-02 19:46:12.094347	2014-05-02 19:46:12.094347
150	55	9	\N	\N	2014-05-04 20:00:10.506458	2014-05-04 20:00:10.506458
154	55	10	\N	\N	2014-05-05 00:23:57.786346	2014-05-05 00:23:57.786346
152	53	10	\N	\N	2014-05-05 00:22:31.650981	2014-05-05 00:22:31.650981
153	54	10	\N	\N	2014-05-05 00:23:30.518513	2014-05-05 00:23:30.518513
156	56	11	\N	\N	2014-05-06 20:49:11.16563	2014-05-06 20:49:11.16563
157	57	10	\N	\N	2014-05-07 00:41:52.241237	2014-05-07 00:41:52.241237
174	60	7	\N	\N	2014-05-07 04:41:11.106019	2014-05-07 04:41:11.106019
175	60	11	\N	\N	2014-05-07 04:41:11.109659	2014-05-07 04:41:11.109659
176	60	8	\N	\N	2014-05-07 04:41:11.111601	2014-05-07 04:41:11.111601
177	60	10	\N	\N	2014-05-07 04:41:11.113506	2014-05-07 04:41:11.113506
178	60	9	\N	\N	2014-05-07 04:41:11.115416	2014-05-07 04:41:11.115416
179	60	12	\N	\N	2014-05-07 04:41:11.117281	2014-05-07 04:41:11.117281
180	60	6	\N	\N	2014-05-07 04:41:11.119216	2014-05-07 04:41:11.119216
181	60	13	\N	\N	2014-05-07 04:41:11.121103	2014-05-07 04:41:11.121103
182	61	7	\N	\N	2014-05-08 16:31:24.959145	2014-05-08 16:31:24.959145
183	62	7	\N	\N	2014-05-09 01:20:05.203967	2014-05-09 01:20:05.203967
184	62	11	\N	\N	2014-05-09 01:20:05.20768	2014-05-09 01:20:05.20768
185	62	8	\N	\N	2014-05-09 01:20:05.209589	2014-05-09 01:20:05.209589
186	62	10	\N	\N	2014-05-09 01:20:05.211519	2014-05-09 01:20:05.211519
187	62	9	\N	\N	2014-05-09 01:20:05.213407	2014-05-09 01:20:05.213407
188	62	12	\N	\N	2014-05-09 01:20:05.215334	2014-05-09 01:20:05.215334
189	62	6	\N	\N	2014-05-09 01:20:05.217336	2014-05-09 01:20:05.217336
190	62	13	\N	\N	2014-05-09 01:20:05.219242	2014-05-09 01:20:05.219242
191	63	10	\N	\N	2014-05-13 22:12:24.213514	2014-05-13 22:12:24.213514
192	64	10	\N	\N	2014-05-13 22:13:36.649506	2014-05-13 22:13:36.649506
193	65	6	\N	\N	2014-05-13 22:14:35.758414	2014-05-13 22:14:35.758414
194	66	12	\N	\N	2014-05-13 22:16:05.468021	2014-05-13 22:16:05.468021
195	67	6	\N	\N	2014-05-13 22:16:30.869831	2014-05-13 22:16:30.869831
196	69	11	\N	\N	2014-05-13 22:17:44.024712	2014-05-13 22:17:44.024712
197	71	13	\N	\N	2014-05-13 22:22:40.161781	2014-05-13 22:22:40.161781
198	72	11	\N	\N	2014-05-13 22:23:05.574967	2014-05-13 22:23:05.574967
199	73	7	\N	\N	2014-05-13 22:24:50.732656	2014-05-13 22:24:50.732656
200	73	13	\N	\N	2014-05-13 22:24:50.734753	2014-05-13 22:24:50.734753
201	74	7	\N	\N	2014-05-13 22:24:50.926772	2014-05-13 22:24:50.926772
202	74	13	\N	\N	2014-05-13 22:24:50.928751	2014-05-13 22:24:50.928751
203	75	7	\N	\N	2014-05-13 22:24:52.163524	2014-05-13 22:24:52.163524
204	75	13	\N	\N	2014-05-13 22:24:52.165565	2014-05-13 22:24:52.165565
205	76	7	\N	\N	2014-05-13 22:24:55.35793	2014-05-13 22:24:55.35793
206	76	13	\N	\N	2014-05-13 22:24:55.359899	2014-05-13 22:24:55.359899
207	77	7	\N	\N	2014-05-13 22:24:56.565685	2014-05-13 22:24:56.565685
208	77	13	\N	\N	2014-05-13 22:24:56.567617	2014-05-13 22:24:56.567617
209	78	7	\N	\N	2014-05-13 22:24:58.187635	2014-05-13 22:24:58.187635
210	78	13	\N	\N	2014-05-13 22:24:58.1896	2014-05-13 22:24:58.1896
211	79	7	\N	\N	2014-05-13 22:24:58.23239	2014-05-13 22:24:58.23239
212	79	13	\N	\N	2014-05-13 22:24:58.234303	2014-05-13 22:24:58.234303
213	80	10	\N	\N	2014-05-13 22:42:07.129659	2014-05-13 22:42:07.129659
214	82	9	\N	\N	2014-05-13 22:46:42.805047	2014-05-13 22:46:42.805047
215	82	12	\N	\N	2014-05-13 22:46:42.80718	2014-05-13 22:46:42.80718
216	84	7	\N	\N	2014-05-13 22:53:44.58856	2014-05-13 22:53:44.58856
217	84	13	\N	\N	2014-05-13 22:53:44.590664	2014-05-13 22:53:44.590664
218	86	8	\N	\N	2014-05-13 23:09:42.691488	2014-05-13 23:09:42.691488
219	87	9	\N	\N	2014-05-13 23:32:16.781225	2014-05-13 23:32:16.781225
220	88	9	\N	\N	2014-05-13 23:33:35.109678	2014-05-13 23:33:35.109678
221	89	9	\N	\N	2014-05-13 23:34:16.710955	2014-05-13 23:34:16.710955
222	90	8	\N	\N	2014-05-17 20:30:29.535635	2014-05-17 20:30:29.535635
223	91	8	\N	\N	2014-05-19 19:32:34.762202	2014-05-19 19:32:34.762202
224	92	11	\N	\N	2014-05-20 00:48:47.21834	2014-05-20 00:48:47.21834
225	92	8	\N	\N	2014-05-20 00:48:47.220641	2014-05-20 00:48:47.220641
226	92	10	\N	\N	2014-05-20 00:48:47.222631	2014-05-20 00:48:47.222631
227	92	13	\N	\N	2014-05-20 00:48:47.224607	2014-05-20 00:48:47.224607
228	93	13	\N	\N	2014-05-20 04:43:54.696552	2014-05-20 04:43:54.696552
229	94	7	\N	\N	2014-05-20 04:44:49.700094	2014-05-20 04:44:49.700094
230	95	7	\N	\N	2014-05-20 04:45:45.69018	2014-05-20 04:45:45.69018
231	95	11	\N	\N	2014-05-20 04:45:45.69219	2014-05-20 04:45:45.69219
232	95	13	\N	\N	2014-05-20 04:45:45.694064	2014-05-20 04:45:45.694064
233	72	7	\N	\N	2014-05-20 19:38:40.192112	2014-05-20 19:38:40.192112
234	72	13	\N	\N	2014-05-20 19:38:40.208224	2014-05-20 19:38:40.208224
235	96	7	\N	\N	2014-05-20 19:45:27.250946	2014-05-20 19:45:27.250946
236	96	11	\N	\N	2014-05-20 19:45:27.25426	2014-05-20 19:45:27.25426
237	96	8	\N	\N	2014-05-20 19:45:27.256147	2014-05-20 19:45:27.256147
238	96	10	\N	\N	2014-05-20 19:45:27.257973	2014-05-20 19:45:27.257973
239	96	9	\N	\N	2014-05-20 19:45:27.259883	2014-05-20 19:45:27.259883
240	96	12	\N	\N	2014-05-20 19:45:27.261751	2014-05-20 19:45:27.261751
241	96	6	\N	\N	2014-05-20 19:45:27.263614	2014-05-20 19:45:27.263614
242	96	13	\N	\N	2014-05-20 19:45:27.265486	2014-05-20 19:45:27.265486
243	97	10	\N	\N	2014-05-20 20:00:49.480807	2014-05-20 20:00:49.480807
244	98	7	\N	\N	2014-05-20 20:09:23.113479	2014-05-20 20:09:23.113479
245	98	13	\N	\N	2014-05-20 20:09:23.115675	2014-05-20 20:09:23.115675
246	99	12	\N	\N	2014-05-20 20:10:45.369293	2014-05-20 20:10:45.369293
247	100	10	\N	\N	2014-05-20 20:16:45.367737	2014-05-20 20:16:45.367737
248	100	6	\N	\N	2014-05-20 20:16:45.376037	2014-05-20 20:16:45.376037
\.


--
-- Name: task_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('task_users_id_seq', 248, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tasks (id, name, description, task_father_id, task_type, status_update_at, project_id, status_id, requirement_id, label_id, estimated_hours, effective_hours, priority, created_at, updated_at, goal_id, task_depend_id, lock, use_case_id, archived, user_id) FROM stdin;
2	Reunión inicial con cliente	Necesitamos coordinar la reunión con J. Chartier ojalá antes del martes. \r\nSe decide para el Lunes a las 15:00 en el DCC.	\N	Administration	\N	2	6	\N	23	5	\N	1	2014-03-28 03:04:54.473789	2014-04-14 17:28:02.956323	\N	\N	f	\N	f	10
15	Modelo de base de datos	Una vez que lo ideemos, lo creamos en Rails y con el comando:\r\nrake erd\r\nSe puede crear un modelo como el pdf que ya está en la carpeta.	\N	Analysis	\N	2	6	\N	24	3	\N	1	2014-04-08 22:49:29.479385	2014-04-29 00:41:44.589271	\N	\N	f	\N	f	10
33	Mejora en la interfaz de grupos y dispositivos	Tiene que haber una manera básica, más amigable para agregar dispositivos a un grupo.	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-22 17:39:00.296852	2014-05-04 15:43:44.13167	\N	\N	f	9	f	8
19	Crear CRUD de clientes e invitaciones	Son los users pero con admin=false	\N	Chore Rails	\N	2	6	\N	26	4	\N	1	2014-04-08 22:55:29.43919	2014-04-30 19:11:56.043821	\N	\N	f	3	f	10
12	Setup nombre y logo inicio TradeMedia	Ajustar las cosas básicas de la aplicación default a lo que necesitamos para el proyecto.	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-08 19:16:54.892214	2014-04-14 21:48:35.095289	\N	\N	f	2	f	10
20	Crear mockups y digitalizarlos		\N	Analysis	\N	2	6	\N	24	3	\N	1	2014-04-08 22:56:46.625562	2014-04-14 21:48:43.345725	\N	\N	f	\N	f	10
5	Minuta Reunión Coaching	Escribir la minuta de la reunión de coaching y tenerla lista en el DropBox antes de la siguiente. Así se repetiría durante el semestre y puede cambiar la persona responsable.	\N	Administration	\N	2	6	\N	23	2	\N	1	2014-03-31 23:40:31.610569	2014-04-08 20:44:39.064603	\N	\N	f	\N	f	10
3	Organizar primera reunión de equipo		\N	Administration	\N	2	6	\N	23	3	\N	1	2014-03-28 03:55:21.078417	2014-04-02 23:04:50.701334	\N	\N	f	\N	f	10
28	Crear Grupos y administración de dispositivos	Hay que cambiar el modelo al que se discutió en la última reunión (15/04). Para esto hay que agregar el modelo de grupos y con este hacer la administración de dispositivos. 	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-20 23:13:46.694133	2014-04-30 19:11:50.860672	\N	\N	f	7	f	8
4	Organizar equipos y ambiente de desarrollo	Se deben formar grupos para desarrollar en las distintas tecnologías(Rails y Android). Para eso se deben crear grupos de trabajo, donde es muy posible que se mezclen algunos que saben más con otros que saben menos. \r\n\r\nLos Grupos se definieron como: \r\nAndorid: Pancho, Felipe, Lucas y Max \r\nRails: Cristobal, Juank, Nicolás y Rodrigo	\N	Learning	\N	2	6	\N	32	3	\N	1	2014-03-31 00:41:34.330953	2014-04-07 18:21:02.832458	\N	\N	f	\N	f	10
13	Test run inicial de App Hello World en Tablets		\N	Chore Android	\N	2	6	\N	30	2	\N	1	2014-04-08 19:41:49.673778	2014-04-08 22:52:30.558393	\N	\N	f	\N	f	10
1	test	algo\r\n	\N	Feature	\N	1	1	\N	15	5	\N	4	2014-03-27 01:35:31.92774	2014-03-31 01:04:06.403269	\N	\N	f	\N	f	1
14	Reunión 2 Coaching + reunión equipo		\N	Administration	\N	2	6	\N	23	2	\N	1	2014-04-08 20:45:22.175315	2014-04-09 00:44:16.288995	\N	\N	f	\N	f	10
18	Aprender Rails y crear apps simples	https://github.com/Brainshots/Basic-Guide	\N	Learning	\N	2	6	\N	32	5	\N	1	2014-04-08 22:54:26.109566	2014-04-15 15:57:54.93549	\N	\N	f	\N	f	10
16	HTTP Request de autenticación y lectura de JSON de respuesta	Ya que las respuestas del servidor serán normalmente en JSON, la app debe poder leer fácilmente estos resultados de forma interna. Tal vez guardarlos en este formato también sea buena idea.	\N	Chore Android	\N	2	6	\N	30	3	\N	1	2014-04-08 22:51:50.033508	2014-04-30 19:12:00.146088	\N	\N	f	1	f	10
27	Scaffold inicial de programaciones y contenidos		\N	Chore Rails	\N	2	6	\N	26	8	\N	1	2014-04-18 12:59:29.009692	2014-04-22 22:13:39.73608	\N	\N	f	4	f	9
6	Crear las dos vistas iniciales de la app	Crear vistas XML de la app para el login y donde se mustra el logo	\N	Chore Android	\N	2	6	\N	30	5	\N	1	2014-04-01 00:17:01.679415	2014-04-30 19:12:04.197014	\N	\N	f	1	f	10
40	Flujo Final Empresas	FLujo debe ser acorde a Mockup	\N	Administration	\N	2	6	\N	26	2	\N	1	2014-04-22 22:29:23.619625	2014-04-30 19:12:15.616841	\N	\N	f	\N	f	6
21	Solicitud de usuario y administración de clientes	Esta tarea incluye el tema de que TradeMedia debe poder aceptar esta solicitud de usuario a mano. Es en este momento que se le envía el correo de activación al usuario.	\N	Chore Rails	\N	2	14	\N	26	3	\N	1	2014-04-09 18:03:17.573124	2014-05-17 20:29:24.488504	\N	\N	f	3	f	10
26	Crear estructura de clases y modelos	Definir y crear la estructura de clases básica de Android.\r\nAgregar funcionalidades básicas a la misma.	\N	Chore Android	\N	2	6	\N	30	6	\N	1	2014-04-16 01:12:43.429435	2014-05-05 00:23:17.771529	\N	\N	f	1	f	7
24	Reunión 3 Coaching		\N	Administration	\N	2	6	\N	23	10	\N	1	2014-04-16 00:39:16.79376	2014-04-22 14:41:58.803354	\N	\N	f	\N	f	11
10	Primer approach SmartBoard	Los 8 del equipo queremos aprender a usar SmartBoard. La idea es que nuestros commits del git aparezcan acá en la tarea. Para esto hay que hacer un commit de prueba y poner en el mensaje #10 dentro del mensaje de commit. Ej: git commit -m "probando sm #10"	\N	Learning	\N	2	6	\N	32	1	\N	1	2014-04-02 18:58:23.865344	2014-04-21 01:26:21.126365	\N	\N	f	\N	f	10
17	Aprender más android y crear apps de prueba	Generar una app que tenga interacción con APIs en JSON	\N	Learning	\N	2	6	\N	32	5	\N	1	2014-04-08 22:53:37.452967	2014-04-22 14:42:08.875202	\N	\N	f	\N	f	10
22	Diseñar modelo de API	Modelar el funcionamiento interno de la API que conectará el dispositivo Android con su contraparte web	\N	Design	\N	2	6	\N	27	2	\N	1	2014-04-14 23:13:33.184913	2014-04-22 14:42:32.439218	\N	\N	f	\N	f	7
11	Despliegue en servidor cliente		\N	Administration	\N	2	6	\N	23	5	\N	1	2014-04-04 21:13:59.257079	2014-04-22 14:43:41.26695	\N	\N	f	\N	f	11
7	Crear API básica de autenticación	El servidor Rails debe ser capaz de recibir una combinación de user/pass por POST y retornar el JSON de un usuario.	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-01 00:18:22.13439	2014-04-22 15:21:42.156575	\N	\N	f	1	f	10
32	Manejo de Empresas	La aplicación debe diferenciar entre usuarios con una o varias empresas. Hay que agregar un helper current_enterprise, que permita controlar bajo que empresa esta trabajando. 	\N	Chore Rails	\N	2	6	\N	26	4	\N	1	2014-04-22 17:32:46.966908	2014-05-04 15:44:07.130439	\N	\N	f	2	f	8
34	Flujo final de creación de contenidos	La idea es juntar todo el scaffold (las 5 vistas) en una sola vista con modals. Guiarse con el flujo que va a proponer Max	\N	Chore Rails	\N	2	6	\N	26	4	\N	1	2014-04-22 22:17:37.149305	2014-05-04 19:58:45.602513	\N	\N	f	4	f	9
25	Diseño BD		\N	Design	\N	2	6	\N	27	10	\N	1	2014-04-16 00:41:14.872158	2014-04-25 18:07:58.275937	\N	\N	f	\N	f	11
38	Poder subir videos pequeños	Lograr subir no solo fotos, sino que tambien videos	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-22 22:21:24.632606	2014-04-25 17:18:57.734105	\N	\N	f	4	f	9
23	Poder bloquear botones en los tablets		\N	Chore Android	\N	2	4	\N	30	2	\N	1	2014-04-15 20:19:28.493975	2014-04-29 23:52:57.642372	\N	\N	f	1	f	10
29	Crear capa de persistencia	Crear una capa que permita persistir los modelos de forma que por ejemplo, no se pierda la información de las programaciones o el access_token al cerrar la aplicación.	\N	Chore Android	\N	2	6	\N	30	8	\N	1	2014-04-21 00:11:43.538387	2014-05-05 00:23:13.530096	\N	\N	f	\N	f	11
35	Solicitud de usuarios empresas  múltiples	Hay que revisar como se va a manejar la creación de usuarios a múltiples empresas. O en el caso de que uno ya exista y se quiera agregar para una empresa distinta.	\N	Chore Rails	\N	2	14	\N	26	2	\N	1	2014-04-22 22:18:39.017215	2014-05-17 20:29:22.614874	\N	\N	f	3	f	8
37	Diferenciar Barra de Admin con Barra de User	La barra de Navegación Debe ser distinta para usuarios y admins.\r\n\r\nAdmins debe tener:\r\nUsuarios, Empresas	\N	Chore Rails	\N	2	6	\N	26	1	\N	1	2014-04-22 22:20:38.549761	2014-05-04 15:43:48.023541	\N	\N	f	\N	f	6
39	Flujo final Vista de Dispositivos	Vista de dispositivos debe seguir vista del Mockup	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-22 22:27:43.971344	2014-05-04 15:44:02.077548	\N	\N	f	\N	f	6
36	Flujo final de creacion de programas	La idea es juntar todo el scaffold (las 5 vistas) en una sola vista con modals. Guiarse con el flujo que va a proponer Max	\N	Chore Rails	\N	2	6	\N	26	4	\N	1	2014-04-22 22:19:27.719765	2014-05-08 15:45:38.346443	\N	\N	f	6	f	9
31	Reunión Semanal con Cliente 2	Reunión que debería volverse costumbre todos los lunes.	\N	Administration	\N	2	6	\N	23	3	\N	1	2014-04-22 14:45:22.373986	2014-04-23 09:34:02.11594	\N	\N	f	\N	f	10
42	Reunión Coaching 4		\N	Administration	\N	2	6	\N	23	2	\N	1	2014-04-22 22:49:18.941046	2014-04-25 20:43:06.485399	\N	\N	f	\N	f	6
41	Arreglos Css		\N	Design	\N	2	6	\N	27	8	\N	1	2014-04-22 22:37:37.629697	2014-05-08 15:46:08.645275	\N	\N	f	\N	f	6
44	Crear modals para vistas de contenidos	Crear modal edit:\r\n* Modal de edicion (AJAX):\r\nHacer el modal en vista show \r\n * Default modal:\r\n    crear modal default que sea #trademedia-modal .modal-dialog .... Que incluya un loader (loading.gif/clase loading) assets/images \r\n*Incluir preview en caso de video en modal de edicion	\N	Chore Rails	\N	2	6	\N	26	4	\N	1	2014-04-28 14:28:19.297161	2014-05-05 00:24:46.79265	\N	\N	f	6	f	9
43	Supervisión y refactoring Rails		\N	Administration	\N	2	6	\N	23	2	\N	1	2014-04-25 20:43:32.891559	2014-04-25 20:43:45.616303	\N	\N	f	\N	f	10
80	Poder filtrar dispositivos con tags	Los tag serán selectores y organizadores. Es una solución para ocupar poco espacio y dar mucha flexibilidad.	\N	Administration	\N	2	4	\N	23	3	\N	1	2014-05-13 22:42:07.126351	2014-05-13 22:42:07.126351	\N	\N	f	\N	f	10
48	Reunión Cliente 3	Se hizo un demo básico de Web. Android fue difícil de mostrar.	\N	Administration	\N	2	6	\N	23	2	\N	1	2014-04-29 01:04:32.583093	2014-04-29 01:05:31.701131	\N	\N	f	\N	f	10
47	Reunion de flujo Android	Reunion para acordar flujo logico de aplicacion android	\N	Chore Android	\N	2	6	\N	30	1	\N	1	2014-04-28 18:55:36.223279	2014-04-29 23:53:17.51554	\N	\N	f	\N	f	11
51	Reunión coaching 4 + reunión equipo		\N	Administration	\N	2	6	\N	23	3	\N	5	2014-04-30 01:24:57.518388	2014-04-30 01:25:04.313326	\N	\N	f	\N	f	13
45	Documentos Sprint 1	https://drive.google.com/#folders/0B_EL3NEh8P-7Sl85c3R3MExPVzg	\N	Administration	\N	2	6	\N	23	12	\N	1	2014-04-28 15:20:27.770771	2014-05-09 18:37:14.192267	\N	\N	f	\N	f	10
30	Crear Barra de Navegación Fija	Arreglar Barra de navegación actual, Agregar nueva Barra con los  módulos correspondientes	\N	Chore Rails	\N	2	6	\N	26	2	\N	1	2014-04-21 21:01:12.113774	2014-04-30 19:12:28.047428	\N	\N	f	\N	f	6
49	Crear downloader en android	Crear clases necesarias para descargar archivos en android	\N	Chore Android	\N	2	6	\N	30	10	\N	4	2014-04-29 18:25:11.456554	2014-05-02 01:22:41.002715	\N	\N	f	\N	f	13
85	Cambio entre playlist inactiva/activa con touch	La idea es poder tener un video reproduciendose y que al hacer click te muestre una encuesta Web. Debe poder volver al video tras x mins de inactividad.	\N	Chore Android	\N	2	4	\N	30	4	\N	1	2014-05-13 23:07:56.797669	2014-05-13 23:07:56.797669	\N	\N	f	\N	f	10
46	Modals con ajax	Crear un modal generico que funcione para desplegar formularios por ajax	\N	Chore Rails	\N	2	6	\N	26	6	\N	1	2014-04-28 18:53:54.202456	2014-05-05 00:22:54.69533	\N	\N	f	\N	f	11
54	Cambios en Flujo y Navegabilidad		\N	Chore Rails	\N	2	8	\N	26	3	\N	1	2014-05-02 22:19:02.484966	2014-05-05 00:23:30.539787	\N	\N	f	\N	f	6
52	Reunión 5 Coaching	Reunión de Coaching del martes 29 de Abril y posterior reunion con cliente.	\N	Administration	\N	2	6	\N	23	1	\N	1	2014-05-01 18:30:31.470837	2014-05-07 21:48:44.974434	\N	\N	f	\N	f	11
50	Crear nueva App	Se debe crear una nueva version de la palicación desde cero.\r\nRealizar app funcional para sprint 1	\N	Administration	\N	2	6	\N	30	18	\N	1	2014-04-29 18:27:21.725171	2014-05-08 03:02:46.86468	\N	\N	f	1	f	7
55	Arreglos css vista contents		\N	Design	\N	2	6	\N	27	2	\N	1	2014-05-04 20:00:10.502935	2014-05-08 15:46:14.204732	\N	\N	f	\N	f	9
53	Asignación de playlists a dispositivos	Al editar o aceptar un dispositivo se debe poder asignar una playlist de todas las de la lista (a través de un modal). En la vista de playlist se deben por asignar varios dispositivos de la lista a una playlist.	\N	Chore Rails	\N	2	6	\N	26	4	\N	1	2014-05-02 19:46:12.075844	2014-05-08 15:46:20.585355	\N	\N	f	8	f	8
56	El contenido (contents) no depende de una empresa	Se debe mostrar el contenido de la empresa y al subirse se deben guardar con current_enterprise	\N	Bug	\N	2	6	\N	28	1	\N	1	2014-05-06 03:12:49.157323	2014-05-08 15:59:47.134007	\N	\N	f	4	f	10
57	No se setea la imagen de la empresa bien en la API		\N	Bug	\N	2	6	\N	28	1	\N	1	2014-05-07 00:41:52.236565	2014-05-08 15:59:53.165191	\N	\N	f	\N	f	10
61	Se cae la reproducción en android con una playlist de un solo video	Se cae la reproducción en android con una playlist de un solo video	\N	Bug	\N	2	6	\N	28	2	\N	1	2014-05-08 15:01:02.670849	2014-05-08 21:24:51.983199	\N	\N	f	\N	f	10
60	Presentación a Cliente	Presentación del dia martes 6 de mayo previo a entrega de Sprint 1.	\N	Administration	\N	2	6	\N	23	2	\N	1	2014-05-07 04:41:11.081203	2014-05-09 01:17:40.027689	\N	\N	f	\N	f	11
91	Timeline para creación de playlists	Se debe implementar una timeline que facilite la creación playlists activas e inactivas.	\N	Chore Rails	\N	2	8	\N	26	4	\N	1	2014-05-19 19:32:34.745597	2014-05-19 19:32:34.745597	\N	\N	f	\N	f	8
69	Implementación y diseño de Full Calendar js		\N	Chore Rails	\N	2	4	\N	26	3	\N	1	2014-05-13 22:17:43.878722	2014-05-13 22:17:43.878722	\N	\N	f	10	f	10
73	Hacer booter para poder iniciar la app al prender		\N	Chore Android	\N	2	6	\N	30	3	\N	1	2014-05-13 22:24:50.720921	2014-05-20 14:21:43.953681	\N	\N	f	\N	f	13
81	[low_priority] Poder mover y modificar paneles en el dashboard	Lo importante es mostrar la info, pero sería genial poder personalizarlo.	\N	Administration	\N	2	4	\N	26	4	\N	5	2014-05-13 22:44:25.258805	2014-05-13 22:44:45.876054	\N	\N	f	\N	f	10
82	Envío de Contingengia/Emergencia	Es una vista aparte que te permite:\r\n1. Seleccionar una imagen(modificables por admin)\r\n2. Seleccionar dispositivos y duración\r\n3. Confirmar y enviar	\N	Chore Rails	\N	2	4	\N	26	5	\N	1	2014-05-13 22:46:42.791327	2014-05-13 22:46:42.791327	\N	\N	f	\N	f	10
62	Presentación Sprint 1	Preparar y presentar el sprint 1.\r\nAsistir a las presentaciones de los otros grupos.\r\nTrabajo desde las 12 a las 18 para algunos, variando de persona a persona.	\N	Administration	\N	2	6	\N	23	56	\N	1	2014-05-09 01:20:05.127795	2014-05-15 04:52:36.413268	\N	\N	f	\N	f	7
83	[low_priority] Poder tener un Dashboard con información importante	Se requiere información de dispositivos, última distribuciones, usuarios, actividades y programaciones.	\N	Administration	\N	2	4	\N	26	4	\N	4	2014-05-13 22:52:31.725696	2014-05-13 22:52:48.419368	\N	\N	f	\N	f	10
68	Crear templates con líneas de tiempo	Es la misma vista que al crear una playlist normal, pero te permite seleccionar zonas donde se reproducirá el contenido.	\N	Chore Rails	\N	2	4	\N	26	3	\N	1	2014-05-13 22:17:24.703246	2014-05-13 22:55:24.391905	\N	\N	f	\N	f	13
72	Implementar Google Cloud Messages	En todas las partes donde se hace polling, hay que hacerlo de forma instantanea. Incluye lo de las alertas de emergencia	\N	Chore Android	\N	2	8	\N	30	5	\N	1	2014-05-13 22:23:05.571978	2014-05-20 19:38:18.435955	\N	\N	f	8	f	10
67	Manejo de usuarios y permisos		\N	Chore Rails	\N	2	7	\N	26	3	\N	1	2014-05-13 22:16:30.866842	2014-05-20 20:10:56.229433	\N	\N	f	\N	f	13
71	Reanudar descargas		\N	Chore Android	\N	2	6	\N	30	1	\N	1	2014-05-13 22:22:40.158485	2014-05-20 00:44:50.558086	\N	\N	f	\N	f	13
66	Drag & Drop para crear contenidos		\N	Chore Rails	\N	2	8	\N	26	4	\N	1	2014-05-13 22:16:05.46514	2014-05-20 19:30:57.267483	\N	\N	f	4	f	10
63	Manejo de Carpetas en dispositivos	Debe tener un scroller para el lado si se van agregando demasiadas carpetas.	\N	Chore Rails	\N	2	8	\N	26	3	\N	1	2014-05-13 22:12:24.193341	2014-05-20 19:31:45.062986	\N	\N	f	9	f	10
87	Investigación distintos SDK (1ª actividad)	Se listarán los distintos SDK que podrían servir y los dispositivos compatibles, para poder ver cómo se aplica.	\N	Analysis	\N	2	8	\N	24	5	\N	1	2014-05-13 23:32:16.777843	2014-05-20 19:44:21.011233	\N	\N	f	\N	f	10
84	Poder enviar información extra al instaar disp.	Que al registrar un dispositivo se pueda enviar si es H o V, la resolución, un comentario, etc	\N	Chore Android	\N	2	7	\N	30	4	\N	1	2014-05-13 22:53:44.580601	2014-05-20 20:11:06.963619	\N	\N	f	\N	f	10
88	Validación de features SDK	Se verá si en estos SDK a investigar pueden interactuar con una API y cuáles features de Android son posibles de implementar	\N	Analysis	\N	2	7	\N	24	5	\N	1	2014-05-13 23:33:35.106531	2014-05-15 00:14:49.508721	\N	\N	f	\N	f	10
86	Se debe poder manejar playlists inactivas	Al crear una playlist, se debe poder crear una timeline alterna (activa), que se muestra al hacer click y se devuelve al modo inactivo tras un tiempo seteable.	\N	Chore Rails	\N	2	8	\N	26	4	\N	1	2014-05-13 23:09:42.686504	2014-05-19 18:52:11.392994	\N	\N	f	\N	f	10
64	Manejo de contenidos en carpetas	También aplica para playlists.\r\n\r\nDebe tener un scroller para el lado si se van agregando demasiadas carpetas.\r\n\r\nEn la vista de crear playlists, al clickear las carpetas en donde está organizado el contenido, se muestran los contenidos corresp en la lista derecha.\r\n\r\nEn la lista derecha se deben poder filtrar con un buscador.	\N	Chore Rails	\N	2	7	\N	26	3	\N	1	2014-05-13 22:13:36.63411	2014-05-20 20:11:16.789282	\N	\N	f	5	f	10
89	Plan desarrollo SDK Ciclo 3	Se creará un primer plan para desarrollarlo en el ciclo 3 o descartar el SDK en su defecto	\N	Administration	\N	2	7	\N	24	5	\N	1	2014-05-13 23:34:16.707523	2014-05-15 00:14:28.373279	\N	\N	f	\N	f	10
90	Revisar configuracion de mailing development y produccion	Hay que revisar las configuraciones de mail para que sean correctas. Y para que sean distintas en development y produccion	\N	Chore Rails	\N	2	8	\N	26	1	\N	1	2014-05-17 20:30:29.486924	2014-05-17 20:30:29.486924	\N	\N	f	\N	f	8
93	Integrar Downloader		\N	Chore Android	\N	2	6	\N	30	2	\N	1	2014-05-20 04:43:54.693006	2014-05-20 14:05:04.550056	\N	\N	f	\N	f	7
94	Testear performance de multiples videos simultaneamente	Reproducir y probar multiples videos simultaneamente para el desarrollo de las templates	\N	Chore Android	\N	2	8	\N	30	4	\N	1	2014-05-20 04:44:49.696877	2014-05-20 19:31:46.886334	\N	\N	f	\N	f	7
65	Implementación de diseño nuevo básico	Solo el esqueleto para que todos puedan trabajar como correspone con el diseño nuevo	\N	Design	\N	2	14	\N	27	5	\N	1	2014-05-13 22:14:35.753046	2014-05-19 20:39:09.412248	\N	\N	f	\N	f	10
92	Reunión con cliente [13/05]		\N	Administration	\N	2	6	\N	23	2	\N	1	2014-05-20 00:48:47.214832	2014-05-20 18:37:27.801354	\N	\N	f	\N	f	13
96	Reunión 1 coaching Ciclo 2		\N	Administration	\N	2	7	\N	23	6	\N	1	2014-05-20 19:45:27.241305	2014-05-20 19:45:27.241305	\N	\N	f	\N	f	10
98	Poder reproducir contenido Web		\N	Chore Android	\N	2	4	\N	30	2	\N	1	2014-05-20 20:09:23.110037	2014-05-20 20:09:23.110037	\N	\N	f	4	f	10
99	Se debe poder crear contenido Web con preview	Así como se pueden subir fotos y videos, se deben poder guadar páginas web para poder asignarse más adelante a playlists	\N	Chore Rails	\N	2	7	\N	26	4	\N	1	2014-05-20 20:10:45.366247	2014-05-20 20:10:45.366247	\N	\N	f	\N	f	10
97	Hacer un renamo completo a la App de Rails		\N	Bug	\N	2	7	\N	28	1	\N	1	2014-05-20 20:00:49.477032	2014-05-20 20:11:08.832766	\N	\N	f	\N	f	10
100	Implementación de testing unitario con Rspec y Capybara	Es muy importante tenerlo para la siguiente entrega de ciclo	\N	Chore Rails	\N	2	4	\N	26	3	\N	1	2014-05-20 20:16:45.364232	2014-05-20 20:16:45.364232	\N	\N	f	\N	f	10
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tasks_id_seq', 100, true);


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
9	El usuario debe poder administrar los dispositivos de una empresa en grupos de dispositivos	2	2014-04-22 17:37:11.56535	2014-04-29 01:08:22.226344	2	{"atribuete2":"User","atribuete3":"El usuario crea un grupo, y agrega dispositivos a este, de manera de dar una misma programación a todos.","atribuete4":"El usuario edita un grupo de dispositivos agregando y/o quitando dispositivos a este.","atribuete5":"","atribuete6":""}	4
8	El cliente debe poder asignar playlists a dispositivos y seleccionar su duración	2	2014-04-09 21:38:52.13749	2014-04-29 01:08:43.222414	2	{"atribuete2":"Cliente","atribuete3":"El cliente debe poder seleccionar una playlist y asignársela a un dispositivo, especificando si se debe reproducir una cierta cantidad de veces o si se debe reproducir indefinidamente.","atribuete4":"","atribuete5":"","atribuete6":""}	4
6	El cliente debe poder crear playlists a partir del contenido multimedia	2	2014-04-09 21:33:24.773926	2014-04-29 01:09:06.618503	2	{"atribuete2":"Cliente","atribuete3":"El cliente debe poder seleccionar varios archivos multimedia y coordinarlos de manera secuencial, especificando la duración de las fotos y las veces que se repite un video.","atribuete4":"","atribuete5":"","atribuete6":""}	4
1	El usuario debe poder descargar la app y linkearla a su cuenta en el servidor	2	2014-04-01 00:05:08.308693	2014-04-09 21:26:32.243228	2	{"atribuete2":"TradeMedia","atribuete3":"TradeMedia va al sitio físico de instalación y corre el setup inicial y registra el A-Mini o Tablet a la cuenta del cliente.","atribuete4":"Un cliente avanzado debe poder recibir el A-Mini o Tablet e instalar la app, ingresar sus credenciales y linkear el dispositivo a su cuenta.","atribuete5":"","atribuete6":""}	4
3	El cliente debe poder ver los usuarios de su empresa que tienen acceso y solicitar un nuevo usuario	2	2014-04-09 18:01:49.250738	2014-04-09 21:26:41.837628	2	{"atribuete2":"Cliente","atribuete3":"Un cliente con los permisos de administración de su empresa puede ver la lista de usuarios de ésta y también puede rellenar un formulario de registro solicitando de esta forma la inclusión de un nuevo usuario. \\r\\nEsta solicitud es procesada por TradeMedia y al aceptarla se le envía el correo de activación al usuario invitado.","atribuete4":"","atribuete5":"","atribuete6":""}	4
2	El cliente debe poder loguearse en el sitio web de administración de dispositivos de su empresa	2	2014-04-08 19:31:34.867037	2014-04-09 21:26:50.411038	2	{"atribuete2":"Cliente","atribuete3":"El cliente accede al sitio web e ingresa sus credenciales recibidas por correo con clave 'temporal' y obligándolo a cambiarla una vez logueado.","atribuete4":"El cliente ya tiene una cuenta y solo ingresa sus credenciales para acceder.","atribuete5":"","atribuete6":""}	4
4	El usuario debe poder subir contenido multimedia(limitado temp. a 10MB) al sitio	2	2014-04-09 21:29:19.047597	2014-04-09 21:29:19.047597	2	{"atribuete2":"Cliente","atribuete3":"Un usuario de una empresa debe poder subir fotos y videos a la plataforma si tiene los permisos correspondientes. ","atribuete4":"","atribuete5":"","atribuete6":""}	4
5	El cliente debe poder organizar sus contenidos multimedia en carpetas y renombrar archivos	2	2014-04-09 21:31:02.902695	2014-04-09 21:31:02.902695	2	{"atribuete2":"Cliente","atribuete3":"El contenido se debe poder subir directamente a una carpeta específica o moverse más adelante. También debe permitir cambiar el nombre de cualquier archivo.","atribuete4":"","atribuete5":"","atribuete6":""}	4
7	El cliente debe poder ver el estado de sus dispositivos	2	2014-04-09 21:38:18.917842	2014-04-09 21:38:18.917842	2	{"atribuete2":"Cliente","atribuete3":"El cliente debe ver en la lista de dispositivos si éstos están recibiendo órdenes y si tienen ya descargado el contenido necesario para reproducir la programación asignada.","atribuete4":"","atribuete5":"","atribuete6":""}	4
10	El cliente debe poder crear calendarización	2	2014-05-04 20:50:20.020361	2014-05-04 20:51:54.604069	2	{"atribuete2":"Cliente","atribuete3":"El usuario Crea un nuevo calendario. Para ello debe definir el plazo en el cual la playlist es viable.","atribuete4":"Cleinte puede crear un calendario vacío para que otros trabajen en él.","atribuete5":"","atribuete6":""}	2
11	El cliente debe poder editar una Calendarización	2	2014-05-04 20:56:59.51262	2014-05-04 20:56:59.51262	2	{"atribuete2":"Cliente","atribuete3":"El cliente abre un calendario existente, y luego puede agregar o quitar playlists, y editar los rangos donde se reprducen","atribuete4":"Si 2 usuarios trabajaron en horarios que coinciden, solo se guarda la primera en guardar, la segunda debe revisar conflictos.","atribuete5":"","atribuete6":""}	2
12	El cliente debe poder agregar calendarización a dispositvos	2	2014-05-04 21:00:47.594119	2014-05-04 21:00:47.594119	2	{"atribuete2":"Cliente-Admin","atribuete3":"El Cliente asocia un dispositivo(o grupo) con un calendario, y este último se debe guardar en el dispositivo remoto.","atribuete4":"","atribuete5":"","atribuete6":""}	2
\.


--
-- Name: use_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('use_cases_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, picture, curriculum, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, authentication_token, invitation_token, invitation_created_at, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_id, invited_by_type, provider, uid, avatar) FROM stdin;
9	cijimenez90@gmail.com	$2a$10$kDU./GPZh67EISJsVB/kZeGLzt2pHAPkAal6Skdex7y6bw0G2E5/y	82e4737dd7492dac484e202a4f0283a3b469554dc861677298d0ac57ab110855	\N	2014-05-08 20:22:06.410216	34	2014-05-20 16:31:07.533984	2014-05-19 16:06:14.749193	127.0.0.1	127.0.0.1	2014-03-27 22:03:16.52187	2014-05-20 16:31:07.536669	\N	\N	\N	\N	2014-03-28 14:03:12.790757	2014-03-27 22:03:16.521553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	franciscosandoval15@gmail.com	$2a$10$miVFffbFpu6O8Txml916uu9MofwEMZ.SdLhaWWgjX.ik9KVyMvQTa	\N	\N	\N	8	2014-05-20 18:12:52.305612	2014-05-01 18:25:14.944133	127.0.0.1	200.86.253.5	2014-03-27 22:03:59.904392	2014-05-20 18:12:52.307433	\N	\N	\N	\N	2014-03-27 22:48:32.45591	2014-03-27 22:03:59.904042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	npcastrol@gmail.com	$2a$10$/gfOfYqxe85N2w3s/LLVxOZOjIB4zgjc.uPW.y3VzNp9nZbPvV.0O	\N	\N	\N	10	2014-05-14 02:12:30.938586	2014-05-02 19:41:51.772939	200.86.238.78	200.86.238.78	2014-03-27 22:02:58.764683	2014-05-14 02:12:30.940619	Nicolas Castro	\N	\N	\N	2014-03-27 22:48:31.273561	2014-03-27 22:02:58.764411	\N	\N	\N	\N	\N	\N	\N	\N	\N	google_oauth2	118309755597592354466	\N
2	stgo.larrain@gmail.com	$2a$10$jj2vDb.36qZmoJgWSUhne.IJqSC1BwhhIA9.hVQHJJkphaO/Q6Ab6	\N	\N	\N	1	2014-03-27 17:42:17.959534	2014-03-27 17:42:17.959534	127.0.0.1	127.0.0.1	2014-03-27 17:40:59.555342	2014-03-27 17:42:17.962233	\N	\N	\N	\N	2014-03-27 17:42:13.25018	2014-03-27 17:40:59.554995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	nicolas.risso.c@gmail.com	$2a$10$HRSkSb5lyWEDM3wUNrlLN.s5VtkpunUfqJQHLC9Y0hjGWAdelibra	\N	\N	\N	39	2014-05-15 12:35:47.765387	2014-05-15 03:38:48.749745	127.0.0.1	190.153.128.183	2014-03-27 19:24:21.958116	2014-05-15 12:35:47.766938	Nicolas Risso	\N	\N	\N	2014-03-27 19:29:09.666509	2014-03-27 19:24:21.957788	\N	\N	\N	\N	\N	\N	\N	\N	\N	google_oauth2	102354521284744424317	\N
15	milundguzzo@gmail.com	$2a$10$dGURpNp1ybSnOqz.I46tOeBjlkNoPvsW2O81rrAWnI7NnkZ/o.7ju	\N	\N	2014-04-07 13:23:37.660459	1	2014-04-07 13:23:37.701836	2014-04-07 13:23:37.701836	200.61.47.124	200.61.47.124	2014-04-07 13:20:31.177549	2014-04-07 13:23:37.704813	\N	\N	\N	\N	2014-04-07 13:23:31.971948	2014-04-07 13:20:31.163153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	reyarturo.risso@gmail.com	$2a$10$aF5PbINZ9fVtqs78wRM1Cuh6e7JmdwbbcoQ/DrcROVAmDRRJPp3km	\N	\N	\N	1	2014-03-29 15:10:09.906204	2014-03-29 15:10:09.906204	190.153.128.183	190.153.128.183	2014-03-29 15:09:38.911847	2014-03-29 15:10:09.907215	\N	\N	\N	\N	2014-03-29 15:09:38.901511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	narisso@uc.cl	$2a$10$AClmM2a6A2fAJ4DLuTsUGO72mVyt3t.H.EMbItR7bT2BXcddrX4yq	\N	\N	\N	10	2014-04-03 00:26:08.056048	2014-03-31 01:01:28.351343	190.153.128.183	190.153.128.183	2014-03-27 01:26:15.679764	2014-04-03 00:26:08.061453	\N	\N	\N	\N	2014-03-27 01:26:34.688101	2014-03-27 01:26:15.679475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	jrarriag@gmail.com	$2a$10$Na2b6YnZPMFPsOg0gW/oWuxwoa/.tMIMgkYRZRtaQTUe06LxAAK8e	\N	\N	\N	42	2014-05-19 19:53:14.644162	2014-05-16 17:35:20.780084	127.0.0.1	200.86.251.29	2014-03-27 22:02:01.703312	2014-05-19 19:53:14.646377	\N	\N	\N	\N	2014-03-28 22:45:07.367704	2014-03-27 22:02:01.702842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	asfura@gmail.com	$2a$10$Rn5N9JLCOQg6ZvrtLQ3Jd.6KWr4VYT9.bpUBC7Zqilr4Pce0Kpola	\N	\N	\N	9	2014-05-20 04:43:05.35573	2014-05-09 01:16:28.425244	186.106.244.47	186.107.99.201	2014-03-27 22:02:29.69843	2014-05-20 04:43:05.357691	Felipe Asfura	\N	\N	\N	2014-03-27 22:03:27.017018	2014-03-27 22:02:29.69818	\N	\N	\N	\N	\N	\N	\N	\N	\N	google_oauth2	108427519507772978919	\N
12	rsfeir.n@gmail.com	$2a$10$xqfnDIvt8fyHAoZmxLDEe.jG61mVxND9oCuqWwHr8irkgIykaUWUa	\N	\N	\N	18	2014-05-20 04:54:05.996405	2014-05-18 20:21:23.568685	190.21.112.237	190.21.103.180	2014-03-27 22:04:23.927092	2014-05-20 04:54:05.998977	\N	\N	\N	\N	2014-03-29 17:17:56.070087	2014-03-27 22:04:23.926855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	lucasvalenzuela@gmail.com	$2a$10$FkkPcyX45JfiOC7Nw/KtmOTjCHu/z3WYjipRueSx0Ld0gW/RpyN9u	\N	\N	2014-04-15 01:02:21.071929	28	2014-05-20 14:04:37.427155	2014-05-20 00:44:39.282387	127.0.0.1	186.105.189.5	2014-03-27 22:04:47.210748	2014-05-20 14:04:37.432982	Lucas Valenzuela Pugh	\N	\N	\N	2014-03-30 19:49:02.150821	2014-03-27 22:04:47.210525	\N	\N	\N	\N	\N	\N	\N	\N	\N	google_oauth2	111773267451325394766	\N
10	maxfindel@gmail.com	$2a$10$4kZfkgG8LukdaiBdswpPy.w9E3txda9gxCm63vc9yeFvLpu1lR4Sy	\N	\N	2014-05-04 13:28:23.804891	15	2014-05-13 04:16:58.193315	2014-05-13 02:23:49.506882	190.47.112.130	190.47.112.130	2014-03-27 22:03:36.435321	2014-05-13 04:16:58.195509	\N	\N	\N	\N	2014-03-28 03:00:23.867377	2014-03-27 22:03:36.435089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	aneyem.academic@gmail.com	$2a$10$vBdCoh/xjp7MsBgi0kgovOLM2UPTxF6qh.BzCCafdZPYXAS7zSwmm	\N	\N	\N	17	2014-05-20 14:25:50.007288	2014-04-29 21:13:47.172918	146.155.13.106	127.0.0.1	2014-03-27 19:12:53.536532	2014-05-20 14:25:50.009275	\N	\N	\N	\N	2014-03-27 19:13:14.574533	2014-03-27 19:12:53.536097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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


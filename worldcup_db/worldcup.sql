--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 4, 2, 161, 162);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 2, 0, 163, 164);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 2, 1, 162, 164);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 1, 0, 161, 163);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 3, 2, 162, 165);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 2, 0, 164, 166);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 2, 1, 163, 167);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 2, 0, 161, 168);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 2, 1, 164, 169);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 1, 0, 166, 170);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 3, 2, 163, 171);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 2, 0, 167, 172);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 2, 1, 162, 173);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 2, 1, 165, 174);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 2, 1, 168, 175);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 4, 3, 161, 176);
INSERT INTO public.games VALUES (49, 2014, 'Final', 1, 0, 177, 176);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 3, 0, 178, 167);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 1, 0, 176, 178);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 7, 1, 177, 167);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 1, 0, 178, 179);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 1, 0, 176, 163);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 2, 1, 167, 169);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 1, 0, 177, 161);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 2, 1, 167, 180);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 2, 0, 169, 168);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 2, 0, 161, 181);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 2, 1, 177, 182);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 2, 1, 178, 172);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 2, 1, 179, 183);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 1, 0, 176, 170);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 2, 1, 163, 184);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (161, 'France');
INSERT INTO public.teams VALUES (162, 'Croatia');
INSERT INTO public.teams VALUES (163, 'Belgium');
INSERT INTO public.teams VALUES (164, 'England');
INSERT INTO public.teams VALUES (165, 'Russia');
INSERT INTO public.teams VALUES (166, 'Sweden');
INSERT INTO public.teams VALUES (167, 'Brazil');
INSERT INTO public.teams VALUES (168, 'Uruguay');
INSERT INTO public.teams VALUES (169, 'Colombia');
INSERT INTO public.teams VALUES (170, 'Switzerland');
INSERT INTO public.teams VALUES (171, 'Japan');
INSERT INTO public.teams VALUES (172, 'Mexico');
INSERT INTO public.teams VALUES (173, 'Denmark');
INSERT INTO public.teams VALUES (174, 'Spain');
INSERT INTO public.teams VALUES (175, 'Portugal');
INSERT INTO public.teams VALUES (176, 'Argentina');
INSERT INTO public.teams VALUES (177, 'Germany');
INSERT INTO public.teams VALUES (178, 'Netherlands');
INSERT INTO public.teams VALUES (179, 'Costa Rica');
INSERT INTO public.teams VALUES (180, 'Chile');
INSERT INTO public.teams VALUES (181, 'Nigeria');
INSERT INTO public.teams VALUES (182, 'Algeria');
INSERT INTO public.teams VALUES (183, 'Greece');
INSERT INTO public.teams VALUES (184, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 184, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    diameter_in_thousands_lyrs integer,
    distance_from_earth_in_millions_lyrs numeric(5,2),
    contains_earth boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_kms numeric(5,1),
    year_discovered integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_octillion_kgs numeric(5,1),
    diameter_in_kms integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_to_earth_in_lyrs integer,
    galaxy_id integer NOT NULL,
    earth_orbits boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_more_info (
    star_more_info_id integer NOT NULL,
    description text,
    star_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.star_more_info OWNER TO freecodecamp;

--
-- Name: star_more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: star_more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_more_info_more_info_id_seq OWNED BY public.star_more_info.star_more_info_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_more_info star_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_more_info ALTER COLUMN star_more_info_id SET DEFAULT nextval('public.star_more_info_more_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 105, NULL, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 260, 2.50, false);
INSERT INTO public.galaxy VALUES (3, 'Markarian 231', 'quasar', 186, 581.00, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'elliptical', 132, 53.50, false);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'dwarf', 32, 0.16, false);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 'ring', 148, 612.80, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476.0, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Io', 3643.2, 1610, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 3121.6, 1610, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268.2, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820.6, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Mimas', 396.4, 1789, 6);
INSERT INTO public.moon VALUES (7, 'Titan', 5149.5, 1655, 6);
INSERT INTO public.moon VALUES (8, 'Ariel', 1157.8, 1851, 7);
INSERT INTO public.moon VALUES (9, 'Titania', 1577.8, 1787, 7);
INSERT INTO public.moon VALUES (10, 'Triton', 2706.8, 1846, 8);
INSERT INTO public.moon VALUES (11, 'Phobos', 22.5, 1877, 4);
INSERT INTO public.moon VALUES (12, 'Deimos', 12.4, 1877, 4);
INSERT INTO public.moon VALUES (13, 'Rhea', 1527.6, 1672, 6);
INSERT INTO public.moon VALUES (14, 'Amalthea', 167.0, 1892, 5);
INSERT INTO public.moon VALUES (15, 'Himalia', 139.6, 1904, 5);
INSERT INTO public.moon VALUES (16, 'Enceladus', 504.2, 1789, 6);
INSERT INTO public.moon VALUES (17, 'Dione', 1122.8, 1684, 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', 270.0, 1848, 6);
INSERT INTO public.moon VALUES (19, 'Pheobe', 213.0, 1898, 6);
INSERT INTO public.moon VALUES (20, 'Elara', 86.0, 1905, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.3, 4879, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.9, 12104, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6.0, 12756, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.6, 6792, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898.0, 142984, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568.0, 120536, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 86.8, 51118, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 102.0, 49528, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-42b', 16.4, 9695, 6);
INSERT INTO public.planet VALUES (10, 'Kepler-42d', 5.4, 8547, 6);
INSERT INTO public.planet VALUES (11, 'Proxima Centaurib', 6.4, 16583, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1b', 8.2, 14286, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'G2V', NULL, 1, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M5.5e', 4, 1, false);
INSERT INTO public.star VALUES (3, 'HD 219134', 'K3V', 21, 1, false);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 'M8V', 40, 1, false);
INSERT INTO public.star VALUES (5, 'HD 10180', 'G1V', 127, 1, false);
INSERT INTO public.star VALUES (6, 'Kepler-42', 'M5V', 126, 1, false);


--
-- Data for Name: star_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_more_info VALUES (1, 'our home star', 1, NULL);
INSERT INTO public.star_more_info VALUES (2, NULL, 2, NULL);
INSERT INTO public.star_more_info VALUES (3, NULL, 3, NULL);
INSERT INTO public.star_more_info VALUES (4, NULL, 4, NULL);
INSERT INTO public.star_more_info VALUES (5, NULL, 5, NULL);
INSERT INTO public.star_more_info VALUES (6, NULL, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_more_info_more_info_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star_more_info star_more_info_more_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_more_info
    ADD CONSTRAINT star_more_info_more_info_id_key UNIQUE (star_more_info_id);


--
-- Name: star_more_info star_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_more_info
    ADD CONSTRAINT star_more_info_pkey PRIMARY KEY (star_more_info_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_more_info star_more_info_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_more_info
    ADD CONSTRAINT star_more_info_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


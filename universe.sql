--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    galaxy_types text,
    distance_from_earth numeric,
    has_supermassive_blackhole boolean NOT NULL
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
    name character varying(50) NOT NULL,
    year_of_discovery integer,
    distance_from_planet numeric,
    has_liquid_water boolean NOT NULL,
    planet_id integer
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
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    planet_types text,
    has_atmosphere boolean NOT NULL,
    star_id integer
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(30) NOT NULL,
    spacecraft_type text,
    launch_date date,
    is_manned boolean NOT NULL,
    mission_description text
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_planetary_system boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2.5, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 0.0, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3.0, false);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Irregular', 12.0, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23.0, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 500.0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', -400000000, 384400, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 9877, false, 2);
INSERT INTO public.moon VALUES (3, 'Ganymede', 1610, 1070400, false, 3);
INSERT INTO public.moon VALUES (4, 'Titan', 1655, 1221865, true, 5);
INSERT INTO public.moon VALUES (5, 'Enceladus', 1789, 238037, true, 5);
INSERT INTO public.moon VALUES (6, 'Miranda', 1948, 129390, false, 6);
INSERT INTO public.moon VALUES (7, 'Europa', 1610, 671100, false, 3);
INSERT INTO public.moon VALUES (8, 'Triton', 1846, 354759, true, 7);
INSERT INTO public.moon VALUES (9, 'Deimos', 1877, 23460, false, 2);
INSERT INTO public.moon VALUES (10, 'Callisto', 1610, 1882709, false, 3);
INSERT INTO public.moon VALUES (11, 'Oberon', 1787, 583520, false, 8);
INSERT INTO public.moon VALUES (12, 'Rhea', 1672, 527068, false, 5);
INSERT INTO public.moon VALUES (13, 'Tethys', 1684, 294619, false, 5);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1671, 3560820, false, 5);
INSERT INTO public.moon VALUES (15, 'Ariel', 1851, 190900, false, 9);
INSERT INTO public.moon VALUES (16, 'Umbriel', 1851, 266000, false, 9);
INSERT INTO public.moon VALUES (17, 'Dione', 1684, 377396, false, 5);
INSERT INTO public.moon VALUES (18, 'Hyperion', 1848, 1481000, false, 5);
INSERT INTO public.moon VALUES (19, 'Charon', 1978, 19591, false, 10);
INSERT INTO public.moon VALUES (20, 'Phoebe', 1899, 12947631, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1.0, 'Terrestial', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 1.5, 'Terrestial', false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 5.2, 'Gas Giant', true, 1);
INSERT INTO public.planet VALUES (4, 'Venus', false, 0.7, 'Terrestial', true, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 9.5, 'Gas Giant', true, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 30.1, 'Ice Giant', true, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', false, 0.4, 'Terrestial', false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 19.2, 'Ice Giant', true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-438b', true, 640.0, 'Terrestial', false, 4);
INSERT INTO public.planet VALUES (10, 'HD 219134 b', false, 21.2, 'Super-Earth', false, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', true, 39.6, 'Terrestial', true, 5);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', true, 20.4, 'Terrestial', true, 2);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Space probe', '1977-09-05', false, 'Exploration of the outer Solar System');
INSERT INTO public.spacecraft VALUES (2, 'Apollo 11', 'Lunar mission', '1969-07-16', true, 'First crewed mission to land on the Moon');
INSERT INTO public.spacecraft VALUES (3, 'Dragon Crew-1', 'Spacecraft', '2020-11-16', true, 'First operational crewed flight of SpaceX Crew Dragon spacecraft to the ISS');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 0.0, true, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 240, 8.6, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, 642, false, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 6, 4.2, true, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 6, 4.3, true, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 6, 4.3, true, 2);


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
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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
-- PostgreSQL database dump complete
--


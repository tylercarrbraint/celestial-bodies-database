--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Debian 12.22-1.pgdg120+1)
-- Dumped by pg_dump version 12.22 (Debian 12.22-1.pgdg120+1)

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

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    brightest_star character varying(60)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_types text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    has_life boolean
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    diameter_in_km integer,
    is_spherical boolean
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_types text,
    has_life boolean,
    is_spherical boolean
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,4),
    is_spherical boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'The hunter, contains Betelgeuse and Rigel', 'Rigel');
INSERT INTO public.constellation VALUES (2, 'Centaurus', 'Contains the nearest star system to the Sun', 'Alpha Centauri');
INSERT INTO public.constellation VALUES (3, 'Dorado', 'The swordfish, holds most of the Large Magellanic Cloud', 'Alpha Doradus');
INSERT INTO public.constellation VALUES (4, 'Andromeda', 'Home to the Andromeda Galaxy', 'Alpha Andromedae');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 13600, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.73, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 0.16, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 13000, 0.20, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 13250, 29.30, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s only natural satellite', 3475, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Larger moon of Mars, irregular potato shape', 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smaller moon of Mars', 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Most volcanically active body in the solar system', 3643, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Ice shell over a subsurface ocean', 3122, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the solar system', 5268, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered ancient surface', 4821, true);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 'Small reddish inner moon', 167, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 'Largest irregular moon of Jupiter', 140, false);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 'Thick atmosphere and methane lakes', 5150, true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 'Water geysers at the south pole', 504, true);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'Second largest moon of Saturn', 1527, true);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 'Two-tone surface, one bright and one dark side', 1469, true);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 'Icy moon with wispy terrain', 1123, true);
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 'Almost pure water ice', 1062, true);
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 'Large Herschel crater', 396, true);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 'Largest moon of Uranus', 1578, true);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 'Outermost major moon of Uranus', 1523, true);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 'Dark cratered surface', 1169, true);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 'Brightest moon of Uranus', 1158, true);
INSERT INTO public.moon VALUES (21, 'Miranda', 7, 'Extreme patchwork terrain', 472, true);
INSERT INTO public.moon VALUES (22, 'Triton', 8, 'Retrograde orbit, likely captured Kuiper belt object', 2707, true);
INSERT INTO public.moon VALUES (23, 'Nereid', 8, 'Highly eccentric orbit', 340, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 'Super-Earth', false, true);
INSERT INTO public.planet VALUES (11, 'Proxima d', 2, 'Sub-Earth', false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 4, 'Terrestrial', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 0.0000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 4.2465, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10, 548.0000, true);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 1, 7600, 40.7000, true);
INSERT INTO public.star VALUES (5, 'S Doradus', 4, 5, 160000.0000, true);
INSERT INTO public.star VALUES (6, 'V1 Cepheid', 2, 50, 2537000.0000, true);
INSERT INTO public.star VALUES (7, 'SN 1987A Progenitor', 4, 20, 168000.0000, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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


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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    num_stars_in_billions integer,
    type character varying(50)
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
    description text,
    planet_id integer,
    largest_moon boolean NOT NULL,
    only_moon boolean
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
    description text,
    star_id integer,
    num_moons integer,
    is_dwarf boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    num_planets integer,
    age_in_billion_years numeric(4,2),
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '101955 Bennu', 'Passes close to Earth about every six years.', 1);
INSERT INTO public.asteroid VALUES (2, '10199 Chariklo', 'First asteroid found to have a ring system.', 1);
INSERT INTO public.asteroid VALUES (3, '2019 OK', 'Football-field-sized.', 1);
INSERT INTO public.asteroid VALUES (4, '243 Ida', 'Ida is the first asteroid found to have a moon.', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 'Gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 2, 1000, 'SA(s)b');
INSERT INTO public.galaxy VALUES ('Butterfly', 'Two falaxies which look limilar to a butterfly.', 6, NULL, 'SA(rs)bc / SA(rs)bc');
INSERT INTO public.galaxy VALUES ('Backward', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', 5, NULL, 'SA(r)ab');
INSERT INTO public.galaxy VALUES ('Triangulum', 'A spiral galaxy 2.73 million light-years from Earth.', 4, 40, 'SA(s)cd');
INSERT INTO public.galaxy VALUES ('Pinwheel', 'Discovered by Pierre Mechain in 1781.', 3, 1000, 'SAB(rs)cd');
INSERT INTO public.galaxy VALUES ('Milky Way', '100,000 - 180,000 light-years in diameter.', 1, 100, 'sb, Sbc, or SB(rs)bc');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Only moon of Earth', 1, true, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Named after the Roman got of dread. Deimos is the smaller of Mars two moons.', 4, false, false);
INSERT INTO public.moon VALUES (3, 'Phobos', 'The larger mood of Mars, gouged and nearly shattered by a giant crater.', 4, true, false);
INSERT INTO public.moon VALUES (4, 'Charon', 'At half the size of Pluto, Charon is the largest of Plutos moons and the largest known satellite relative to its parent body.', 9, true, false);
INSERT INTO public.moon VALUES (5, 'Hydra', 'Hydra was discovered in June, 2005 by Hal Weaver and a large team of astronomers using the Hubble Space Telescope.', 9, false, false);
INSERT INTO public.moon VALUES (6, 'Kerberos', 'Plutos tiny moon Kerberos appears to be smaller than scientists expected and has a highly-reflective surface.', 9, false, false);
INSERT INTO public.moon VALUES (7, 'Nix', 'Nix was discovered in June 2005 by Hal Weaver and a large team of astronomers using the Hubble Space Telescope.', 9, false, false);
INSERT INTO public.moon VALUES (8, 'Styx', 'Styx was discovered on June 26, 2012 by a large team led by Mark Showalter using the Hubble Space Telescope.', 9, false, false);
INSERT INTO public.moon VALUES (9, 'IO', 'Io is the most volcanically active body in the solar system.', 5, false, false);
INSERT INTO public.moon VALUES (10, 'Europa', 'Europa might be the best place to look for environments where life could exist.', 5, false, false);
INSERT INTO public.moon VALUES (12, 'Callisto', 'Callisto is the most heavily cratered object in our solar system.', 5, false, false);
INSERT INTO public.moon VALUES (11, 'Ganymede', 'Ganymede is the largest satellite in our solar system. It is larger than Mercury and Pluto, and three-quarters the size of Mars.', 5, true, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Enceladus is Saturns sixth largest moon, but it is one of the most scientifically compelling bodies in our solar system.', 6, false, false);
INSERT INTO public.moon VALUES (14, 'Titan', 'Saturns largest moon, Titan has an earthlike cycle of liquids flowing across its surface.', 6, true, false);
INSERT INTO public.moon VALUES (16, 'Daphins', 'Daphnis was discovered by the Cassini mission team on 1 May 2005', 6, false, false);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Ariel was discovered Oct, 24, 1851 by William Lassell.', 7, false, false);
INSERT INTO public.moon VALUES (19, 'Triton', 'Triton is the only known satellite in our solar system to have a surface made mainly of nitrogen ice.', 8, false, false);
INSERT INTO public.moon VALUES (20, 'Proteus', 'Proteus was discovered in 1989 by the Voyager 2 spacecraft.', 8, false, false);
INSERT INTO public.moon VALUES (15, 'Atlas', 'Atlas was discovered in 1980 by R. Terrile and the Voyager 1 team.', 6, false, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Oberon was discovered in Jan 11, 1878 by William Herschel.', 7, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Habitable', 1, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Smallest planet in our solar system and closest to the Sun.', 1, 0, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 'Venus spins slowly in the opposite direction from most planets. A thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system.', 1, 0, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is a dusty, cold, desert world with a very thin atmosphere.', 1, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is more than twice as massive than the other planets of our solar system combined.', 1, 79, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system.', 1, 62, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus, the seventh planet from the Sun, rotates at a nearly 90-degree angle from the plane of its orbit.', 1, 27, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune, the eighth and most distant major planet orbiting our Sun is dark, cold and whipped by supersonic winds.', 1, 14, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Pluto is a complex world of ice mountains and frozed plains.', 1, 5, true);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Ceres makes up almost a third of the asteroid belts total mass, but it is still far smaller than Earths moon.', 1, 0, true);
INSERT INTO public.planet VALUES (11, 'Makemake', 'Makemake is located in the Kuiper Belt, a donut-shaped region of ivy bodies beyond the orbit of Neptune.', 1, 0, true);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Haumea is roughly the same size and Pluto. It is one of the fastest rotating large objects in our solar system distorting to planet to look like a football.', 1, 2, true);
INSERT INTO public.planet VALUES (13, 'Eris', 'Eris is about the same size as Pluto but is three times farther from the Sun.', 1, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sol', 1, 1, 8, 4.50, 'Yellow Dwarf');
INSERT INTO public.star VALUES ('Proxima Centauri', 1, 2, NULL, 4.85, 'Red Dwarf');
INSERT INTO public.star VALUES ('Alpha Centauri', 1, 3, NULL, 5.30, '1.1 times the mass and 1.5 times the luminosity of the Sun.');
INSERT INTO public.star VALUES ('Banards Star', 1, 4, NULL, 10.00, 'Red Dwarf');
INSERT INTO public.star VALUES ('Sirius', 1, 5, NULL, NULL, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES ('Epsilon Eridani', 1, 6, NULL, NULL, 'Known to astronomers since at least the 2nd century AD.');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: asteroid name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

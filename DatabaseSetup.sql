--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2 (Ubuntu 10.2-1.pgdg14.04+1)
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: school; Type: TYPE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TYPE school AS ENUM (
    'Abjuration',
    'Conjuration',
    'Divination',
    'Enchantment',
    'Illusion',
    'Necromancy',
    'Transmutation',
    'Evocation'
);


ALTER TYPE school OWNER TO nsqpyyfcspnlrm;

--
-- Name: size; Type: TYPE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TYPE size AS ENUM (
    'Small',
    'Medium',
    'Large'
);


ALTER TYPE size OWNER TO nsqpyyfcspnlrm;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: character; Type: TABLE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TABLE "character" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    level integer NOT NULL,
    char_stats integer,
    char_race integer NOT NULL,
    char_class integer NOT NULL,
    description character varying(1000),
    spells json,
    align character varying(2)
);


ALTER TABLE "character" OWNER TO nsqpyyfcspnlrm;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE SEQUENCE character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE character_id_seq OWNER TO nsqpyyfcspnlrm;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER SEQUENCE character_id_seq OWNED BY "character".id;


--
-- Name: class; Type: TABLE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TABLE class (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    hit_die integer NOT NULL,
    description character varying(300),
    features json NOT NULL
);


ALTER TABLE class OWNER TO nsqpyyfcspnlrm;

--
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE SEQUENCE class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE class_id_seq OWNER TO nsqpyyfcspnlrm;

--
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER SEQUENCE class_id_seq OWNED BY class.id;


--
-- Name: race; Type: TABLE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TABLE race (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    speed integer NOT NULL,
    race_size size NOT NULL,
    features json NOT NULL
);


ALTER TABLE race OWNER TO nsqpyyfcspnlrm;

--
-- Name: race_id_seq; Type: SEQUENCE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE SEQUENCE race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE race_id_seq OWNER TO nsqpyyfcspnlrm;

--
-- Name: race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER SEQUENCE race_id_seq OWNED BY race.id;


--
-- Name: spells; Type: TABLE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TABLE spells (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    cantrip boolean,
    ritual boolean,
    spell_school school NOT NULL,
    level integer NOT NULL,
    description character varying NOT NULL,
    "time" character varying NOT NULL,
    duration character varying NOT NULL,
    range character varying(100) NOT NULL
);


ALTER TABLE spells OWNER TO nsqpyyfcspnlrm;

--
-- Name: spells_id_seq; Type: SEQUENCE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE SEQUENCE spells_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spells_id_seq OWNER TO nsqpyyfcspnlrm;

--
-- Name: spells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER SEQUENCE spells_id_seq OWNED BY spells.id;


--
-- Name: stats; Type: TABLE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TABLE stats (
    character_id integer NOT NULL,
    strength integer NOT NULL,
    dexterity integer NOT NULL,
    constitution integer NOT NULL,
    intelligence integer NOT NULL,
    wisdom integer NOT NULL,
    charisma integer NOT NULL,
    health integer,
    initiative integer,
    armor_class integer,
    skills json
);


ALTER TABLE stats OWNER TO nsqpyyfcspnlrm;

--
-- Name: user; Type: TABLE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(60) NOT NULL
);


ALTER TABLE "user" OWNER TO nsqpyyfcspnlrm;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: nsqpyyfcspnlrm
--

CREATE SEQUENCE user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO nsqpyyfcspnlrm;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: character id; Type: DEFAULT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "character" ALTER COLUMN id SET DEFAULT nextval('character_id_seq'::regclass);


--
-- Name: class id; Type: DEFAULT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY class ALTER COLUMN id SET DEFAULT nextval('class_id_seq'::regclass);


--
-- Name: race id; Type: DEFAULT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY race ALTER COLUMN id SET DEFAULT nextval('race_id_seq'::regclass);


--
-- Name: spells id; Type: DEFAULT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY spells ALTER COLUMN id SET DEFAULT nextval('spells_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: nsqpyyfcspnlrm
--

COPY "character" (id, user_id, name, level, char_stats, char_race, char_class, description, spells, align) FROM stdin;
1	1	Kevin	6	\N	1	1	\N	\N	\N
2	2	Misandra	1	2	4	1	\N	null	CE
3	2	Barbra	1	3	11	3	\N	["16","18","57","19","21"]	LG
4	2	Ricky	1	4	14	2	\N	["2","39","85","112"]	NG
\.


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: nsqpyyfcspnlrm
--

COPY class (id, name, hit_die, description, features) FROM stdin;
1	Barbarian	12	\N	{"primary":1,"proficiency":2,"saving":[1,3],"skills":[2,2,4,8,11,12,18],"armor":[1,2,4],"weapons":[1,2],"features":["On your turn you can enter a rage as a bonus action - while raging you gain the following effects if not wearing heavy armor:Advantage on Strength checks and saving throws You can bonus rage damage when attacking with melee weapons using strengthYou have resistance to bludgeoning, piercing, and slashing damageRages last for 1 minute and once exhausted your rage amount you must take a long rest.","Unarmored Defense - If you are not wearing armor, your armor class equals 10 + your dexterity modifier + your constitution modifier. You can still use a shield","Rages \\u003d 2","Rage damage +2",null]}
2	Bard	8	\N	{"primary":[6],"saving":[2,6],"cantrip":[2,1,39,2,41,3,4,5,70,6,7,8],"spells":[2,9,10,11,72,73,74,75,80,51,83,76,77,78,79,85,112,82,12,13,146,14],"skills":[3],"armor":[1],"weapons":[1],"features":["Bardic Inspiration - You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the DM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest. "]}
4	Druid	8	\N	{"primary":[5],"saving":[4,5],"cantrip":[2,28,15,4,29,30,16,31,32],"spells":[2,9,11,21,73,74,23,34,51,35,36,76,37,85,165,12,146],"skills":[2,3,2,7,10,11,12,15,18],"armor":[1,2,4],"features":["Druidic - You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the messages presence with a successful DC 15 Wisdom (Perception) check but cant decipher it without magic.",null,null,null]}\n
3	Cleric	8	\N	{"primary":[5],"saving":[5,6],"cantrip":[3,15,41,4,16,57,17,18],"spells":[2,10,19,20,21,73,22,74,23,65,76,24,25,165,26,27],"skills":[2,6,7,10,14,15],"armor":[1,2,4],"weapons":[1],"features":["Ritual Casting - You can cast a cleric spell as a ritual if that spell has a ritual tag and you have the spell prepared.","Spellcasting Focus - You can use a holy symbol as a spellcasting focus for your cleric spells",null,null]}
\.


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: nsqpyyfcspnlrm
--

COPY race (id, name, speed, race_size, features) FROM stdin;
1	Kenku	30	Medium	{"dex":2,"intel":1,"skills":[1,5],"features":["Vocal Mimicry - You can copy any sound exactly as you hear it - You can\\u0027t speak without hearing it first","Ambusher - You gain advantage on any attack in a round in which your opponent has not acted yet"],"languages":["Auran","Common"]}
2	Hill Dwarf	25	Medium	{"cont":2,"wis":1,"health":1,"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Dwarven Resillience - Advantage on saving throws against poison and resistance against poison damage","Profiecncy with battleaxe, handaxe, light hammer, and warhammer","Profiecncy in checks against stonework and add double instead"],"languages":["Common","Dwarvish"]}
3	Mountain Dwarf	25	Medium	{"cont":2,"str":2,"health":1,"armor":[1,2],"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Dwarven Resillience - Advantage on saving throws against poison and resistance against poison damage","Profiecncy with battleaxe, handaxe, light hammer, and warhammer","Profiecncy in checks against stonework and add double instead"],"languages":["Common","Dwarvish"]}
4	Wood Elf	35	Medium	{"dex":2,"wis":1,"skills":[2,12],"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Fey Ancestry - Advantage on saving throws against being charmed and magic cant put you to sleep","Trance - Elves dont need to sleep instead you can meditate for 4 hours a day ofr the same benefit of long rest","Profiecncy in longswords, shortswords, shortbow, and longbow","Mask of the Wild - You can attempt to hide even when you are only lightly obscured in foliage, heavy rain, falling snow, mist and other natural phenomena"],"languages":["Common","Elvish",null]}
5	Dark Elf	30	Medium	{"dex":2,"charis":1,"skills":[2,12],"features":["Superior Darkvision - You can see in dim light within 120ft in front of you as if it were bright light and in darkness as if it were dim light","Fey Ancestry - Advantage on saving throws against being charmed and magic cant put you to sleep","Trance - Elves dont need to sleep instead you can meditate for 4 hours a day ofr the same benefit of long rest","Profiecncy in rapiers, shortswords, and hand crossbows","Sunlight Sensitivity - Disadvantage on attack rolls and perception checks while in direct sunlight","Drow Magic - You know the dancing lights cantrip"],"languages":["Common","Elvish",null]}
6	Lightfoot Halfling	25	Small	{"dex":2,"charis":1,"features":["Lucky - When you roll a 1 on a D20 for an attack roll, ability check, or saving throw you can re-roll and must use the new roll","Brave - You have advantage on saving throws against being frightened","Nimble - You can move through any space of a creatue that is a size larger than yours","Naturally Stealthy - You can attempt to hide even when you are obscured only by a creature that is at least one size larger than you"],"languages":["Common","Halfling"]}
7	Stout Halfling	25	Small	{"dex":2,"cont":1,"features":["Lucky - When you roll a 1 on a D20 for an attack roll, ability check, or saving throw you can re-roll and must use the new roll","Brave - You have advantage on saving throws against being frightened","Nimble - You can move through any space of a creatue that is a size larger than yours","Stout Resillience - You have advantage on saving throws against poison and resistance against poison damage"],"languages":["Common","Halfling"]}
8	Human	30	Medium	{"str":1,"dex":1,"cont":1,"intel":1,"wis":1,"charis":1,"languages":["Common","choice"]}
9	Dragonborn	30	Medium	{"str":2,"charis":1,"features":["Breath Weapon - You can use your action to exhale destructive energy matching your ancestory type. Each creature must make a saving throw according to the breath type. The DC equals 8 + your constituion mod + proficiency bonus. A creature takes 2D6 on a failed throw and half on a success"," -Resistance - You have damage resistance to the type of your ancestory",null,null],"languages":["Common","Draconic"],"type":["Black - acid - 5 by 30ft line(Dex Save)","Blue - lightening - 5 by 30ft line(Dex Save)","Brass -fire - 5 by 30ft line(Dex Save)","Bronze - lightening - 5 by 30ft line(Dex Save)","Copper - acid - 5 by 30ft line(Dex Save)","Gold -fire 15ft cone 15ft cone(Dex Save)","Green -posion 15ft cone(Dex Save)","Red - fire 15 foot cone(Dex Save)","Silver -cold fire 15 foot cone(Dex Save)","White - cold fire 15 foot cone(Dex Save)"]}
10	Forest Gnome	25	Small	{"str":0,"dex":1,"intel":2,"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Gnomish Cunning - Advanage on intelligence, wisdom, and charisma saving throws against magic","You can cast the Minior Illusion cantrip (Int is the spellcasting ablity)","Speak with Small Beasts - You can communicate simple ideas with small or smaller beasts"],"languages":["Common","Gnomish"]}
11	Rock Gnome	25	Small	{"str":0,"cont":1,"intel":2,"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Gnomish Cunning - Advanage on intelligence, wisdom, and charisma saving throws against magic","Artificers Lore - Whenever you make an intelligence check on magic items, alchemical objects, or technological devices you can add twice your proficiency bonus","Tinker"],"languages":["Common","Gnomish"]}
12	Half Elf	30	Medium	{"str":0,"charis":2,"ability":2,"skills":[2],"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Fey Ancestry - Advantag on saving throws against being charmed and magic cant put you to sleep","Artificers Lore - Whenever you make an intelligence check on magic items, alchemical objects, or technological devices you can add twice your proficiency bonus",null],"languages":["Common","Elvish","choice"]}
13	Half Orc	30	Medium	{"str":2,"cont":1,"skills":[1,8],"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Relentless Endurance - When you are reduced to 0 hitpoints but not killed outright, you can  drop to 1 hit point instead - long rest cooldown","Artificers Lore - Whenever you make an intelligence check on magic items, alchemical objects, or technological devices you can add twice your proficiency bonus","Savage Attacks - Whn you score a critical hit with a melee weapon attack, you can roll one of the weapon\\u0027s damage dice one additional time and add it to the extra damage of the critical hit"],"languages":["Common","Orc",null]}
14	Tiefling	30	Medium	{"intel":1,"charis":2,"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Hellish Resistance - You have fire resistance","Infernal Legacy - You know the Thaumaturgy cantrip","Savage Attacks - Whn you score a critical hit with a melee weapon attack, you can roll one of the weapon\\u0027s damage dice one additional time and add it to the extra damage of the critical hit"],"languages":["Common","Infernal",null]}
16	High Elf	30	Medium	{"dex":2,"intel":1,"cantrip":1, "skills":[2,12],"features":["Darkvision - You can see in dim light within 60ft in front of you as if it were bright light and in darkness as if it were dim light","Fey Ancestry - Advantage on saving throws against being charmed and magic cant put you to sleep","Trance - Elves dont need to sleep instead you can meditate for 4 hours a day ofr the same benefit of long rest","Profiecncy in longswords, shortswords, shortbow, and longbow"],"languages":["Common","Elvish","choice"]}
\.


--
-- Data for Name: spells; Type: TABLE DATA; Schema: public; Owner: nsqpyyfcspnlrm
--

COPY spells (id, name, cantrip, ritual, spell_school, level, description, "time", duration, range) FROM stdin;
1	Blade Ward	t	f	Abjuration	0	You can extend your hand and trace a sigili of warding in the air. Until the end of your next turn, you have resistance against bludgeoning, piercing, and slading damage dealt by weapon attacks.	1 action	1 round	Self
2	Friends	t	f	Enchantment	0	For the duration, you have advantage on all Charisma checks directed at one creature of your choice that isnt hostile towards you. When the spell ends, the creature realizes that you used magic to influence its mood and becomes hostile toward you. A creature prone to violence might attack you. Another creature might seek retribution in other ways (at the DMs discretion), depending on the nature of your interaction with it.	1 action	Concentration, up to 1 minute	Self
3	Mage Hand	t	f	Conjuration	1	A spectral, floating hand appears at a point you choose within range. The hand lasts for the duration or until you dismiss it as an action. The hand vanishes if it is ever more than 30 feet away from you or if you cast this spell again. You can use your action to control the hand. You can use the hand to manipulate an object, open an unlocked door or container, stow or retrieve an item from an open container, or pour the contents out of a vial. You can move the hand up to 30 feet each time you use it. The hand cant attack, activate magic items, or carry more than 10 pounds.	1 action	1 minute	30 feet
4	Mending	t	f	Transmutation	0	This spell repairs a single break or tear in an object you touch, such as a broken chain link, two halves of a broken key, a torn cloak, or a leaking wineskin. As long as the break or tear is no larger than 1 foot in any dimension, you mend it, leaving no trace of the former damage. This spell can physically repair a magic item or construct, but the spell cant restore magic to such an object.	1 minute	Instantaneous	Touch
5	Message	t	f	Transmutation	0	You point your finger toward a creature within range and whisper a message. The target (and only the target) hears the message and can reply in a whisper that only you can hear. You can cast this spell through solid objects if you are familiar with the target and know it is beyond the the barrier. Magical silence, 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood blocks the spell. The spell doesnt have to follow a straight line and can travel freely around corners or through openings.	1 action	1 round	120 feet
6	Prestidigitation	t	f	Transmutation	0	This spell is a minor magical trick that novice spellcasters use for practice. You create one of the following magical effects within range: You create an instantaneous, harmless sensory effect, such as a shower of sparks, a puff of wind, faint musical notes, or an odd odor-You instantaneously light or snuff out a candle, a torch, or a small campfire-You instantaneously clean or soil an object no larger than 1 cubic foot-You chill, warm or flavor up to 1 cubic foot of nonliving material for 1 hour-You make a color, a small mark, or a symbol appear on an object or a surface for 1 hour-You create a nonmagical trinket or an illusionary image that can fit in your hand and that lasts until the end of your next turn. If you cast this spell multiple times, you can have up to three of its non-instantaneous effects active at a time, and you can dismiss such an effect as an action.	1 action	Up to 1 hour	10 feet
7	True Strike	t	f	Divination	0	You extend your hand and point a finger at a target in range. Your magic grants you a brief insight into the targets defenses. On your nest turn, you gain advantage on your first attack roll against the target, provided that this spell hasnt ended.	1 minute	Concentration, up to 1 round	Touch
8	Vicious Mockery	t	f	Enchantment	0	You unleash a string of insults laced with subtle enchantments at a creature you can see within range. If the target can hear you (though it need nnot understand you) it must succeed on a Wisdom saving throw or take 1d4 psychic damage and have disadvantage on the next attack roll it makes before the end of its next turn.	1 action	Instantaneous	60 feet
9	Animal Friendship	f	f	Enchantment	1	This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see or hear you. If the beasts Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a Wisdom saving throw or be charmed by you for the spells duration. If you or one of your companions harms the target, the spell ends.	1 action	24 hours	30 feet
10	Bane	f	f	Enchantment	1	Up to three creatures of your choice that you can see within range must make Charisma saving throws. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw.	1 action	Concentration, up to 1 minute	30 feet
11	Charm Person	f	f	Enchantment	1	You attempt to charm a humanoid you can see within range. It must make a Wisdom saving throw, and does so with an advantage if you or your companions are fighting it. If it fails the saving throw, it is charmed by you until the spell ends or until you or your companions do anything harmful to it. The charmed creature regards you as a friendly aquaintance. When the spell ends, the creature knows it was charmed by you.	1 action	1 hour	30 feet
12	Speak with Animals	f	t	Divination	1	You gain the ability to comprehend and verbally communicate with beasts for the duration. The knowledge and awareness of many beasts is limited by their intelligence, but at minimum, beasts can give you information about nearby locations and monsters, including whatever they can perceive or have perceived within the past day. You might be able to persuade a beast to perform a small favor for you, at the DMs discretion.	1 action	10 minutes	Self
13	Tashas Hideous Laughter	f	f	Enchantment	1	A creature of your choice that you can see within range perceives everything as hilariously funny and falls into fits of laughter if this spell affects it. The target must succeed on a Wisdom saving throw or fall prone, becoming incapacitated and unable to stand up for the duration. A creature with an Intelligence score of 4 or less isnt affected. At the end of each of its turns, and each time it takes damage, the target can make another Wisdom saving throw. The target has advantage on the saving throw if its triggered by damage. On a success, the spell ends.	1 action	Concentration, up to 1 minute	30 feet
14	Unseen Servant	f	t	Conjuration	1	This spell creates an invisible, mindless, shapeless force that performs simple tasks at your command until the spell ends. The servant springs into existence in an unoccupied space on the ground within range. It has AC 10, 1 hit point, and a Strength of 2, and it cant attack. If it drops to 0 hit points, the spell ends. Once on each of your turns as a bonus action, you can mentally command the servant to move up to 15 feet and interact with an object. The servant can perform simple tasks that a human servant could do, such as fetching thing, cleaning, mending, folding clothes, lighting fires, serving food, and pouring wine. Once you give the command, the servant performs the task to the best of its ability until it completes the task, then waits for your next command. If you command the servant to perform a task that would move it more than 60 feet away from you, the spell ends.	1 action	1 hour	60 feet
15	Guidance	t	f	Divination	0	You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice. It can roll the die before or after making the ability check. The spell then ends.	1 action	Concentration, up to 1 minute	Touch
16	Resistance	t	f	Abjuration	0	You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one saving throw of its choice. It can roll the die before or after making the saving throw. The spell then ends.	1 action	Concentration, up to 1 minute	Touch
17	Spare the Dying	t	f	Necromancy	0	You touch a living creature that has 0 hit points. The creature becomes stable. This spell has no effect on undead or constructs.	1 action	Instantaneous	Touch
18	Thaumaturgy	t	f	Transmutation	0	You manifest a minor wonder, a sign of supernatural power, within range. You create one of the following magical effects within range: Your voice booms up to three times as loud as normal for 1 minute-You cause flames to flicker, brighten, dim, or change color for 1 minute-You create harmless tremors in the ground for 1 minute-You create an instantaneous sound that originates from a point of your choice within range, such as a rumble of thunder, the cry of a raven, or ominous whispers-You instantaneously cause an unlocked door or window to fly open or slam shut-You alter the appearance of your eyes for 1 minute. If you cast this spell multiple times, you can have up to three of its 1-minute effects active at a time, and you can dismiss such an effect as an action.	1 action	Up to 1 minute	30 feet
19	Bless	f	f	Enchantment	1	You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.	1 action	Concentration, up to 1 minute	30 feet
20	Command	f	f	Enchantment	1	You speak a one-word command to a creature you can see within range. The target must succeed on a Wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesnt understand your language, or if your command is directly harmful to it. Some typical commands and their effects follow. You might issue a command other than one described here. If you do so, the DM determines how the target behaves. If the target cant follow your command, the spell ends. Approach. The target moves toward you by the shortest and most direct route, ending its turn if it moves within 5 feet of you. Drop. The target drops whatever it is holding and then ends its turn. Flee. The target spends its turn moving away from you by the fastest available means. Grovel. The target falls prone and then ends its turn. Halt. The target doesnt move and takes no actions. A flying creature stays aloft, provided that it is able to do so. If it must move to stay aloft, it flies the minimum distance needed to remain in the air. When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.	1 action	1 round	60 feet
21	Create or Destroy Water	f	f	Transmutation	1	You either create or destroy water. Create Water-You create up to 10 gallons of clean water within range in an open container. Alternatively, the water falls as rain in a 30-foot cube within range, extinguishing exposed flames in the area. Destroy Water-You destroy up to 10 gallons of water in an open container within range. Alternatively, you destroy fog in a 30-foot cube within range.	1 action	Instantaneous	30 feet
22	Detect Evil and Good	f	f	Divination	1	For the duration, you know if there is an aberration, celestial, elemental, fey, fiend, or undead within 30 feet of you, as well as where the creature is located. Similarly, you know if there is a place or object within 30 feet of you that has been magically consecrated or desecrated. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.	1 action	Concentration, up to 10 minutes	Self
23	Detect Poison and Disease	f	t	Divination	1	For the duration, you can sense the presence and location of poisons, poisonous creatures, and diseases within 30 feet of you. You also identify the kind of poison, poisonous creature, or disease in each case. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.	1 action	Concentration, up to 10 minutes	Self
24	Inflict Wounds	f	f	Necromancy	1	Make a melee spell attack against a creature you can reach. On a hit, the target takes 3d10 necrotic damage.	1 action	Instantaneous	Touch
25	Protection from Evil and Good	f	f	Abjuration	1	Until the spell ends, one willing creature you touch is protected against certain types of creatures: aberrations, celestials, elementals, fey, fiends, and undead. The protection grants several benefits. Creatures of those types have disadvantage on attack rolls against the target. The target also cant be charmed, frightened, or possessed by them. If the target is already charmed, frightened, or possessed by such a creature, the target has advantage on any new saving throw against the relevant effect.	1 action	Concentration, up to 10 minutes	Touch
26	Sanctuary	f	f	Abjuration	1	You ward a creature within range against attack. Until the spell ends, any creature who targets the warded creature with an attack or a harmful spell must first make a W isdom saving throw. On a failed save, the creature must choose a new target or lose the attack or spell. This spell doesnt protect the warded creature from area effects, such as the explosion of a fireball. If the warded creature makes an attack or casts a spell that affects an enemy creature, this spell ends.	1 bonus action	1 minute	30 feet
27	Shield of Faith	f	f	Abjuration	1	A shimmering field appears and surrounds a creature of your choice within range, granting it a +2 bonus to AC for the duration.	1 bonus action	Concentration, up to 10 minutes	60 feet
28	Druidcraft	t	f	Transmutation	0	Whispering to the spirits of nature, you create one of the following effects within range: You create a tiny, harmless sensory effect that predicts what the weather will be at your location for the next 24 hours. The effect might manifest as a golden orb for clear skies, a cloud for rain, falling snowflakes for snow, and so on. This effect persists for 1 round-You instantly make a flower blossom, a seed pod open, or a leaf bud bloom-You create an instantaneous, harmless sensory effect, such as falling leaves, a puff of wind, the sound of a small animal, or the faint odor of skunk. The effect must fit in a 5-foot cube-You instantly light or snuff out a candle, a torch, or a small campfire.	1 action	Instantaneous	30 feet
29	Poison Spray	t	f	Conjuration	0	You extend your hand toward a creature you can see within range and project a puff of noxious gas from your palm. The creature must succeed on a Constitution saving throw or take 1d12 poison damage.	1 action	Instantaneous	10 feet
30	Produce Flame	t	f	Conjuration	0	A flickering flame appears in your hand. The flame remains there for the duration and harms neither you nor your equipment. The flame sheds bright light in a 10-foot radius and dim light for an additional 10 feet. The spell ends if you dismiss it as an action or if you cast it again. You can also attack with the flame, although doing so ends the spell. When you cast this spell, or as an action on a later turn, you can hurl the flame at a creature within 30 feet of you. Make a ranged spell attack. On a hit, the target takes 1d8 fire damage.	1 action	10 minutes	Self
31	Shillelagh	t	f	Transmutation	0	The wood of a club or quarterstaff you are holding is imbued with natures power. For the duration, you can use your spellcasting ability instead of Strength for the attack and damage rolls of melee attacks using that weapon, and the weapons damage die becomes a d8. The weapon also becomes magical, if it isnt already. The spell ends if you cast it again or if you let go of the weapon.	1 bonus action	1 minute	Touch
32	Thorn Whip	t	f	Transmutation	0	You create a long, vine-like whip covered in thorns that lashes out at your command toward a creature in range. Make a melee spell attack against the target. If the attack hits, the creature takes 1d6 piercing damage, and if the creature is Large or smaller, you pull the creature up to 10 feet closer to you.	1 action	Instantaneous	30 feet
34	Entangle	f	f	Conjuration	1	Grasping weeds and vines sprout from the ground in a 20-foot square starting from a point within range. For the duration, these plants turn the ground in the area into difficult terrain. A creature in the area when you cast the spell must succeed on a Strength saving throw or be restrained by the entangling plants until the spell ends. A creature restrained by the plants can use its action to make a Strength check against your spell save DC. On a success, it frees itself. When the spell ends, the conjured plants wilt away.	1 action	Concentration, up to 1 minute	90 feet
35	Fog Cloud	f	f	Conjuration	1	You create a 20-foot-radius sphere of fog centered on a point within range. The sphere spreads around corners, and its area is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.	1 action	Concentration, up to 1 hour	120 feet
36	Goodberry	f	f	Transmutation	1	Up to ten berries appear in your hand and are infused with magic for the duration. A creature can use its action to eat one berry. Eating a berry restores 1 hit point, and the berry provides enough nourishment to sustain a creature for one day. The berries lose their potency if they have not been consumed within 24 hours of the casting of this spell.	1 action	Instantaneous	Touch
37	Jump	f	f	Transmutation	1	You touch a creature. The creatures jump distance is tripled until the spell ends.	1 action	1 minute	Touch
165	Purify Food and Drink	f	t	Transmutation	1	All nonmagical food and drink within a 5-foot-radius sphere centered on a point of your choice within range is purified and rendered free of poison and disease.	1 action	Instantaneous	10 feet
39	Dancing Lights	t	f	Evocation	0	You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius. As a bonus action on your turn, you can move the lights up to 60 feet to a new spot within range. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spells range.	1 action	Concentration, up to 1 minute	120 feet
41	Light	t	f	Evocation	0	You touch one object that is no larger than 10 feet in any dimension. Until the spells ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action. If you target an object held or worn by a hostile creature, that creature must succeed on a Dexterity saving throw to avoid the spell.	1 action	1 hour	Touch
51	Faerie Fire	f	f	Evocation	1	Each object in a 20-foot cube within range is outlined in blue, green, or violet light (your choice). Any creature in the area when the spell is cast is also outlined in light if it fails a Dexterity saving throw. For the duration, objects and affected creatures shed dim light in a 10-foot radius. Any attack roll against an affected creature or object has advantage if the attaker can see it, and the affected creature or object cant benefit from being invisible.	1 action	Concentration, up to 1 minute	60 feet
57	Sacred Flame	t	f	Evocation	0	Flame-like radiance descends on a creature that you can see within range. The target must succeed on a Dexterity saving throw or take 1d8 radiant damage. The target gains no benefit from cover for this saving throw.	1 action	Instantaneous	60 feet
65	Guiding Bolt	f	f	Evocation	1	A flash of light streaks toward a creature of your choice within range. Make a ranged spell attack against the target. On a hit, the target takes 4d6 radiant damage, and the next attack roll made against this target before the end of your next turn has advantage, thanks to the mystical dim light glittering on the target until then.	1 action	1 round	120 feet
70	Minor Illusion	t	f	Illusion	0	You create a sound or an image of an object within range that lasts for the duration. The illusion also ends if you dismiss it as an action or cast this spell again. If you create a sound, its volume can range from a whisper to a scream. It can be your voice, someone elses voice a lions roar, a beating of drums, or any other sound you choose. The sound continues unabated throughout the duration, or you can make discrete sounds at different times before the spell ends. If you create an image of an object-such as a chair, muddy footprints, or a small chest-it must be larger than a 5 foot cube. The image cant create sound, light, smell, or any other sensory effect. Physical interaction with the image reveals it to be an illusion, because things can pass through it. If a creature uses its action to examine the sound or image, the creature can determine that it is an illusion with a successful intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the illusion becomes faint to the creature.	1 action	1 minute	30 feet
72	Comprehend Languages	f	t	Divination	1	For the duration, you understand the literal meaning of any spoken language that you hear. You also understand any written language that you see, but you must be touching the surface on which the words are written. It takes about 1 minute to read one page of text. This spell doesnt decode secret messages in a text or glyph, such as an arcane sigil, that isnt part of a written language.	1 action	1 hour	Self
73	Cure Wounds	f	f	Evocation	1	A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.	1 action	Instantaneous	Touch
74	Detect Magic	f	t	Divination	1	For the duration, you sense the presence of magic within 30 feet of you. If you sense magic in this way, you can use your action to see a faint aura around any visible creature or object in the area that bears magic, and you learn its school of magic, if any. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.	1 action	Concentration, up to 10 minutes	Self
75	Disguise Self	f	f	Illusion	1	You make yourself-including yoir clothing, armor, weapons, and other belongings on your person-look different until the spell ends or until you use your action to dismiss it. You can seem 1 foot shorter or taller and can appear thin, fat, or in between. You cant change your body type, so you must adopt a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you. The changes wrought by this spell fail to hold up to physical inspection. For example, if you use this spell to add a hat to your outfit, objects pass through the hat, and anyone who touches it would feel nothing or would feel your head and hair. If you use this spell to appear thinner than you are, the hand of someone who reaches out to touch you would bump into you while it was seemingly still in midair. To discern that you disguised, a creature can use its action to inspect your appearance and must succeed on an Intelligence (Investigation) check against your spell to save DC.	1 action	1 hour	Self
76	Healing Word	f	f	Evocation	1	A creature of your choice that you can see within range regains hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.	1 bonus action	Instantaneous	60 feet
77	Heroism	f	f	Enchantment	1	A willing creature you touch is imbued with bravery. Until the spell ends, the creature is immune to being frightened and gains temporary hit points equal to your spellcasting ability modifier at the start of each of its turns. When the spell ends, the target loses any remaining temporary hit points from this spell.	1 action	Concentration, up to 1 minute	Touch
78	Identify	f	t	Divination	1	You choose one object that you must touch throughout the casting of the spell. If it is a magic item or some other magic-imbued object, you learn its properties and how to use them, whether it requires attunement to use, and how many charges it has, if any. You learn whether any spells are affecting the item and what they are. If the item was created by a spell, you learn which spell created it. If you instead touch a creature throughout the casting, you learn which spell created it. If you instead touch a creature throughout the casting, you learn what spells, if any, are currently affecting it.	1 minute	Instantaneous	Touch
79	Illusory Script	f	t	Illusion	1	You write on parchment, paper, or some other suitable writing material and imbue it with a potent illusion that lasts for the duration. To you and other creatures you designate when you cast the spell, the writing appears normal, written in your hand, and conveys whatever meaning you intended when you wrote the text. To all others, the writing appears as if it were written in an unknown or magical script that is unintelligible. Alternatively, you can cause the writing to appear to be an entirely different message, written in a different hand and language, though the language must be one you know. Should the spell be dispelled, the original script and the illusion both disappear.	1 minute	10 days	Touch
80	Dissonant Whispers	f	f	Enchantment	1	You whisper a dischordant melody that only one creature of your choice within range can hear, wracking it with terrible pain. The target must make a Wisdom saving throw. On a failed save, it takes 3d6 psychic damage and must immediately use its reaction, if available, to move as far as its speed allows away from you. The creature doesnt move into obviously dangerous ground, such as a fire or a pit. On a successful save, the target takes half as much damage and doesnt have to move away. A deafened creature automatically succeeds on the save.	1 action	Instantaneous	60 feet
82	Sleep	f	f	Enchantment	1	This spell sends creatures into a magical slumber. Roll 5d8. The total is how many hit points of creatures that spell can affect. Creatures within 20 feet of a point you choose within range are affected in ascending order of their current hit points (ignoring unconscious creatures). Starting with the creature that has the lowest current hit points, each creature affected by this spell falls unconscious until the spell ends, the sleeper takes damage, or someone uses an action to shake or slap the sleeper awake. Subtract each creatures hit points from the total before moving on to the creature with the next lowest hit points. A creatures hit points must be equal to or less than the remaining total for that creature to be affected. Undead and creatures immune to being charmed arent affected by this spell.	1 action	1 minute	90 feet
83	Feather Fall	f	f	Transmutation	1	Choose up to five falling creatures within range. A falling creatures rate of descent slows to 60 feet per round until the spell ends. If the creature lands before the spell ends, it takes no falling damage and can land on its feet, and the spell ends for that creature.	1 reaction, which you take when you or a creature within 60 feet of you falls	1 minute	60 feet
85	Longstrider	f	f	Transmutation	1	You touch a creature. The targets speed increases by 10 feet until the speed ends.	1 action	1 hour	Touch
112	Silent Image	f	f	Illusion	1	You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 15-foot cube. The image appears at a spot within range and lasts for the duration. The image is purely visual as it isnt accompanied by sound, smell, or other sensory effects. You can use your action to cause the image to move to any spot within range. As the image changes location, you can alter its appearance so that its movements appear natural for the image. Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successfull Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the creature can see through the image.	1 action	Concentration, up to 10 minutes	60 feet
146	Thunderwave	f	f	Evocation	1	A wave of thunderous force sweeps out from you. Each creature in a 15-foot cube originating from you must make a Constitution saving throw. On a failed save, a creature takes 2d8 thunder damage and is pushed 10 feet away from you. On a successful save, the creature takes half as much damage and isnt pushed. In addition, unsecured objects that are completely within the area of effect are automatically pushed 10 feet away from you by the spells effect, and the spell emits a thunderous boom audible out to 300 feet.	1 bonus action	Concentration, up to 1 minute	Self
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: nsqpyyfcspnlrm
--

COPY stats (character_id, strength, dexterity, constitution, intelligence, wisdom, charisma, health, initiative, armor_class, skills) FROM stdin;
2	17	14	14	4	14	12	14	2	12	\N
3	12	10	11	5	5	13	8	0	10	\N
4	8	18	12	6	18	5	9	4	14	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: nsqpyyfcspnlrm
--

COPY "user" (id, username, password) FROM stdin;
1	Trent	admin
2	example	$2y$10$E.gzH/mxDQiAHWDvmpfp0O6QUdaLOCj768emDlcrwH75s34MQviIe
\.


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsqpyyfcspnlrm
--

SELECT pg_catalog.setval('character_id_seq', 4, true);


--
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsqpyyfcspnlrm
--

SELECT pg_catalog.setval('class_id_seq', 4, true);


--
-- Name: race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsqpyyfcspnlrm
--

SELECT pg_catalog.setval('race_id_seq', 16, true);


--
-- Name: spells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsqpyyfcspnlrm
--

SELECT pg_catalog.setval('spells_id_seq', 165, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsqpyyfcspnlrm
--

SELECT pg_catalog.setval('user_id_seq', 2, true);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: class class_name_key; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY class
    ADD CONSTRAINT class_name_key UNIQUE (name);


--
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);


--
-- Name: race race_name_key; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_name_key UNIQUE (name);


--
-- Name: race race_pkey; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_pkey PRIMARY KEY (id);


--
-- Name: spells spells_name_key; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY spells
    ADD CONSTRAINT spells_name_key UNIQUE (name);


--
-- Name: spells spells_pkey; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY spells
    ADD CONSTRAINT spells_pkey PRIMARY KEY (id);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (character_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: character character_char_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_char_class_fkey FOREIGN KEY (char_class) REFERENCES class(id);


--
-- Name: character character_char_race_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_char_race_fkey FOREIGN KEY (char_race) REFERENCES race(id);


--
-- Name: character character_char_stats_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_char_stats_fkey FOREIGN KEY (char_stats) REFERENCES stats(character_id);


--
-- Name: character character_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: stats stats_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nsqpyyfcspnlrm
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: nsqpyyfcspnlrm
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO nsqpyyfcspnlrm;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO nsqpyyfcspnlrm;


--
-- PostgreSQL database dump complete
--


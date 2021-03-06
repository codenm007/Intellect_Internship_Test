PGDMP         "                y            Intellect-intern #   12.7 (Ubuntu 12.7-0ubuntu0.20.04.1) #   12.7 (Ubuntu 12.7-0ubuntu0.20.04.1) ~    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17839    Intellect-intern    DATABASE     ?   CREATE DATABASE "Intellect-intern" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 "   DROP DATABASE "Intellect-intern";
                postgres    false            ?            1259    18555    city    TABLE     ?   CREATE TABLE public.city (
    id integer NOT NULL,
    title character varying(255),
    state_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            ?            1259    18553    city_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.city_id_seq;
       public          postgres    false    211            ?           0    0    city_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;
          public          postgres    false    210            ?            1259    18527    country    TABLE       CREATE TABLE public.country (
    id integer NOT NULL,
    title character varying(255),
    short_code character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false            ?            1259    18525    country_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.country_id_seq;
       public          postgres    false    207            ?           0    0    country_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;
          public          postgres    false    206            ?            1259    18511    knex_migrations    TABLE     ?   CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
 #   DROP TABLE public.knex_migrations;
       public         heap    postgres    false            ?            1259    18509    knex_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.knex_migrations_id_seq;
       public          postgres    false    203            ?           0    0    knex_migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;
          public          postgres    false    202            ?            1259    18519    knex_migrations_lock    TABLE     `   CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);
 (   DROP TABLE public.knex_migrations_lock;
       public         heap    postgres    false            ?            1259    18517    knex_migrations_lock_index_seq    SEQUENCE     ?   CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.knex_migrations_lock_index_seq;
       public          postgres    false    205            ?           0    0    knex_migrations_lock_index_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;
          public          postgres    false    204            ?            1259    18669    resturant_closed    TABLE     ?   CREATE TABLE public.resturant_closed (
    id integer NOT NULL,
    res_id integer,
    day_code integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
 $   DROP TABLE public.resturant_closed;
       public         heap    postgres    false            ?            1259    18667    resturant_closed_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.resturant_closed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.resturant_closed_id_seq;
       public          postgres    false    221            ?           0    0    resturant_closed_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.resturant_closed_id_seq OWNED BY public.resturant_closed.id;
          public          postgres    false    220            ?            1259    18754    resturant_table_booking_status    TABLE     ?   CREATE TABLE public.resturant_table_booking_status (
    id integer NOT NULL,
    "desc" character varying(255),
    code integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 2   DROP TABLE public.resturant_table_booking_status;
       public         heap    postgres    false            ?            1259    18752 %   resturant_table_booking_status_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.resturant_table_booking_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.resturant_table_booking_status_id_seq;
       public          postgres    false    227            ?           0    0 %   resturant_table_booking_status_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.resturant_table_booking_status_id_seq OWNED BY public.resturant_table_booking_status.id;
          public          postgres    false    226            ?            1259    18723    resturant_table_speciality    TABLE     ?   CREATE TABLE public.resturant_table_speciality (
    id integer NOT NULL,
    "desc" character varying(255),
    code integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 .   DROP TABLE public.resturant_table_speciality;
       public         heap    postgres    false            ?            1259    18721 !   resturant_table_speciality_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.resturant_table_speciality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.resturant_table_speciality_id_seq;
       public          postgres    false    223            ?           0    0 !   resturant_table_speciality_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.resturant_table_speciality_id_seq OWNED BY public.resturant_table_speciality.id;
          public          postgres    false    222            ?            1259    18734    resturant_tables    TABLE     ?   CREATE TABLE public.resturant_tables (
    id integer NOT NULL,
    res_id integer,
    spl_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    chairs integer
);
 $   DROP TABLE public.resturant_tables;
       public         heap    postgres    false            ?            1259    18765    resturant_tables_booking    TABLE     ?  CREATE TABLE public.resturant_tables_booking (
    id integer NOT NULL,
    res_id integer,
    table_id integer,
    booked_by integer,
    status_code integer,
    reserved_at timestamp with time zone NOT NULL,
    special_req character varying(255),
    user_rating real,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
 ,   DROP TABLE public.resturant_tables_booking;
       public         heap    postgres    false            ?            1259    18763    resturant_tables_booking_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.resturant_tables_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.resturant_tables_booking_id_seq;
       public          postgres    false    229            ?           0    0    resturant_tables_booking_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.resturant_tables_booking_id_seq OWNED BY public.resturant_tables_booking.id;
          public          postgres    false    228            ?            1259    18732    resturant_tables_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.resturant_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.resturant_tables_id_seq;
       public          postgres    false    225            ?           0    0    resturant_tables_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.resturant_tables_id_seq OWNED BY public.resturant_tables.id;
          public          postgres    false    224            ?            1259    18634 
   resturants    TABLE     /  CREATE TABLE public.resturants (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    logo character varying(255),
    contant_number character varying(255),
    cuisines character varying(255),
    city_id integer NOT NULL,
    state_id integer NOT NULL,
    country_id integer NOT NULL,
    rating real,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    opens_at time without time zone NOT NULL,
    closes_at time without time zone NOT NULL
);
    DROP TABLE public.resturants;
       public         heap    postgres    false            ?            1259    18632    resturants_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.resturants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.resturants_id_seq;
       public          postgres    false    219            ?           0    0    resturants_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.resturants_id_seq OWNED BY public.resturants.id;
          public          postgres    false    218            ?            1259    18540    state    TABLE     ?   CREATE TABLE public.state (
    id integer NOT NULL,
    title character varying(255),
    country_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.state;
       public         heap    postgres    false            ?            1259    18538    state_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.state_id_seq;
       public          postgres    false    209            ?           0    0    state_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;
          public          postgres    false    208            ?            1259    18581    user_genders    TABLE     ?   CREATE TABLE public.user_genders (
    id integer NOT NULL,
    title character varying(255),
    code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.user_genders;
       public         heap    postgres    false            ?            1259    18579    user_genders_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_genders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_genders_id_seq;
       public          postgres    false    215            ?           0    0    user_genders_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_genders_id_seq OWNED BY public.user_genders.id;
          public          postgres    false    214            ?            1259    18570 
   user_roles    TABLE     ?   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    title character varying(255),
    code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            ?            1259    18568    user_roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.user_roles_id_seq;
       public          postgres    false    213            ?           0    0    user_roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;
          public          postgres    false    212            ?            1259    18592    users    TABLE     j  CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    profile_pic character varying(255),
    email character varying(255),
    email_verified boolean DEFAULT false,
    gender_code integer NOT NULL,
    password_digest character varying(255),
    city_id integer NOT NULL,
    state_id integer NOT NULL,
    country_id integer NOT NULL,
    role_code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_blocked boolean DEFAULT false
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    18590    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            ?           2604    18558    city id    DEFAULT     b   ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);
 6   ALTER TABLE public.city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            ?           2604    18530 
   country id    DEFAULT     h   ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);
 9   ALTER TABLE public.country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            ?           2604    18514    knex_migrations id    DEFAULT     x   ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);
 A   ALTER TABLE public.knex_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            ?           2604    18522    knex_migrations_lock index    DEFAULT     ?   ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);
 I   ALTER TABLE public.knex_migrations_lock ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    204    205    205            ?           2604    18672    resturant_closed id    DEFAULT     z   ALTER TABLE ONLY public.resturant_closed ALTER COLUMN id SET DEFAULT nextval('public.resturant_closed_id_seq'::regclass);
 B   ALTER TABLE public.resturant_closed ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            ?           2604    18757 !   resturant_table_booking_status id    DEFAULT     ?   ALTER TABLE ONLY public.resturant_table_booking_status ALTER COLUMN id SET DEFAULT nextval('public.resturant_table_booking_status_id_seq'::regclass);
 P   ALTER TABLE public.resturant_table_booking_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            ?           2604    18726    resturant_table_speciality id    DEFAULT     ?   ALTER TABLE ONLY public.resturant_table_speciality ALTER COLUMN id SET DEFAULT nextval('public.resturant_table_speciality_id_seq'::regclass);
 L   ALTER TABLE public.resturant_table_speciality ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            ?           2604    18737    resturant_tables id    DEFAULT     z   ALTER TABLE ONLY public.resturant_tables ALTER COLUMN id SET DEFAULT nextval('public.resturant_tables_id_seq'::regclass);
 B   ALTER TABLE public.resturant_tables ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            ?           2604    18768    resturant_tables_booking id    DEFAULT     ?   ALTER TABLE ONLY public.resturant_tables_booking ALTER COLUMN id SET DEFAULT nextval('public.resturant_tables_booking_id_seq'::regclass);
 J   ALTER TABLE public.resturant_tables_booking ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            ?           2604    18637    resturants id    DEFAULT     n   ALTER TABLE ONLY public.resturants ALTER COLUMN id SET DEFAULT nextval('public.resturants_id_seq'::regclass);
 <   ALTER TABLE public.resturants ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    18543    state id    DEFAULT     d   ALTER TABLE ONLY public.state ALTER COLUMN id SET DEFAULT nextval('public.state_id_seq'::regclass);
 7   ALTER TABLE public.state ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            ?           2604    18584    user_genders id    DEFAULT     r   ALTER TABLE ONLY public.user_genders ALTER COLUMN id SET DEFAULT nextval('public.user_genders_id_seq'::regclass);
 >   ALTER TABLE public.user_genders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    18573    user_roles id    DEFAULT     n   ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);
 <   ALTER TABLE public.user_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            ?           2604    18595    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            ?          0    18555    city 
   TABLE DATA           K   COPY public.city (id, title, state_id, created_at, updated_at) FROM stdin;
    public          postgres    false    211   ??       ?          0    18527    country 
   TABLE DATA           P   COPY public.country (id, title, short_code, created_at, updated_at) FROM stdin;
    public          postgres    false    207   ?       ?          0    18511    knex_migrations 
   TABLE DATA           J   COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
    public          postgres    false    203   f?       ?          0    18519    knex_migrations_lock 
   TABLE DATA           @   COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
    public          postgres    false    205   ??       ?          0    18669    resturant_closed 
   TABLE DATA           X   COPY public.resturant_closed (id, res_id, day_code, created_at, updated_at) FROM stdin;
    public          postgres    false    221   ??       ?          0    18754    resturant_table_booking_status 
   TABLE DATA           V   COPY public.resturant_table_booking_status (id, "desc", code, created_at) FROM stdin;
    public          postgres    false    227   1?       ?          0    18723    resturant_table_speciality 
   TABLE DATA           R   COPY public.resturant_table_speciality (id, "desc", code, created_at) FROM stdin;
    public          postgres    false    223   ??       ?          0    18734    resturant_tables 
   TABLE DATA           ^   COPY public.resturant_tables (id, res_id, spl_id, created_at, updated_at, chairs) FROM stdin;
    public          postgres    false    225   C?       ?          0    18765    resturant_tables_booking 
   TABLE DATA           ?   COPY public.resturant_tables_booking (id, res_id, table_id, booked_by, status_code, reserved_at, special_req, user_rating, created_at, updated_at) FROM stdin;
    public          postgres    false    229   ??       ?          0    18634 
   resturants 
   TABLE DATA           ?   COPY public.resturants (id, user_id, name, logo, contant_number, cuisines, city_id, state_id, country_id, rating, created_at, updated_at, opens_at, closes_at) FROM stdin;
    public          postgres    false    219   ??       ?          0    18540    state 
   TABLE DATA           N   COPY public.state (id, title, country_id, created_at, updated_at) FROM stdin;
    public          postgres    false    209   ??       ?          0    18581    user_genders 
   TABLE DATA           C   COPY public.user_genders (id, title, code, created_at) FROM stdin;
    public          postgres    false    215   /?       ?          0    18570 
   user_roles 
   TABLE DATA           A   COPY public.user_roles (id, title, code, created_at) FROM stdin;
    public          postgres    false    213   ??       ?          0    18592    users 
   TABLE DATA           ?   COPY public.users (id, first_name, last_name, profile_pic, email, email_verified, gender_code, password_digest, city_id, state_id, country_id, role_code, created_at, updated_at, is_blocked) FROM stdin;
    public          postgres    false    217   ?       ?           0    0    city_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.city_id_seq', 5, true);
          public          postgres    false    210            ?           0    0    country_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.country_id_seq', 1, true);
          public          postgres    false    206            ?           0    0    knex_migrations_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.knex_migrations_id_seq', 13, true);
          public          postgres    false    202            ?           0    0    knex_migrations_lock_index_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);
          public          postgres    false    204            ?           0    0    resturant_closed_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.resturant_closed_id_seq', 6, true);
          public          postgres    false    220            ?           0    0 %   resturant_table_booking_status_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.resturant_table_booking_status_id_seq', 3, true);
          public          postgres    false    226            ?           0    0 !   resturant_table_speciality_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.resturant_table_speciality_id_seq', 4, true);
          public          postgres    false    222            ?           0    0    resturant_tables_booking_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.resturant_tables_booking_id_seq', 24, true);
          public          postgres    false    228            ?           0    0    resturant_tables_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.resturant_tables_id_seq', 10, true);
          public          postgres    false    224            ?           0    0    resturants_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.resturants_id_seq', 4, true);
          public          postgres    false    218            ?           0    0    state_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.state_id_seq', 4, true);
          public          postgres    false    208            ?           0    0    user_genders_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_genders_id_seq', 4, true);
          public          postgres    false    214            ?           0    0    user_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_roles_id_seq', 3, true);
          public          postgres    false    212            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    216            
           2606    18562    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    211                       2606    18537    country country_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    207                       2606    18524 .   knex_migrations_lock knex_migrations_lock_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);
 X   ALTER TABLE ONLY public.knex_migrations_lock DROP CONSTRAINT knex_migrations_lock_pkey;
       public            postgres    false    205                       2606    18516 $   knex_migrations knex_migrations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.knex_migrations DROP CONSTRAINT knex_migrations_pkey;
       public            postgres    false    203                       2606    18676 &   resturant_closed resturant_closed_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.resturant_closed
    ADD CONSTRAINT resturant_closed_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.resturant_closed DROP CONSTRAINT resturant_closed_pkey;
       public            postgres    false    221            $           2606    18762 I   resturant_table_booking_status resturant_table_booking_status_code_unique 
   CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_table_booking_status
    ADD CONSTRAINT resturant_table_booking_status_code_unique UNIQUE (code);
 s   ALTER TABLE ONLY public.resturant_table_booking_status DROP CONSTRAINT resturant_table_booking_status_code_unique;
       public            postgres    false    227            &           2606    18760 B   resturant_table_booking_status resturant_table_booking_status_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_table_booking_status
    ADD CONSTRAINT resturant_table_booking_status_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.resturant_table_booking_status DROP CONSTRAINT resturant_table_booking_status_pkey;
       public            postgres    false    227                       2606    18731 A   resturant_table_speciality resturant_table_speciality_code_unique 
   CONSTRAINT     |   ALTER TABLE ONLY public.resturant_table_speciality
    ADD CONSTRAINT resturant_table_speciality_code_unique UNIQUE (code);
 k   ALTER TABLE ONLY public.resturant_table_speciality DROP CONSTRAINT resturant_table_speciality_code_unique;
       public            postgres    false    223                        2606    18729 :   resturant_table_speciality resturant_table_speciality_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.resturant_table_speciality
    ADD CONSTRAINT resturant_table_speciality_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.resturant_table_speciality DROP CONSTRAINT resturant_table_speciality_pkey;
       public            postgres    false    223            (           2606    18772 6   resturant_tables_booking resturant_tables_booking_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.resturant_tables_booking
    ADD CONSTRAINT resturant_tables_booking_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.resturant_tables_booking DROP CONSTRAINT resturant_tables_booking_pkey;
       public            postgres    false    229            "           2606    18741 &   resturant_tables resturant_tables_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.resturant_tables
    ADD CONSTRAINT resturant_tables_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.resturant_tables DROP CONSTRAINT resturant_tables_pkey;
       public            postgres    false    225                       2606    18646 +   resturants resturants_contant_number_unique 
   CONSTRAINT     p   ALTER TABLE ONLY public.resturants
    ADD CONSTRAINT resturants_contant_number_unique UNIQUE (contant_number);
 U   ALTER TABLE ONLY public.resturants DROP CONSTRAINT resturants_contant_number_unique;
       public            postgres    false    219                       2606    18644    resturants resturants_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.resturants
    ADD CONSTRAINT resturants_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.resturants DROP CONSTRAINT resturants_pkey;
       public            postgres    false    219                       2606    18547    state state_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    209                       2606    18589 %   user_genders user_genders_code_unique 
   CONSTRAINT     `   ALTER TABLE ONLY public.user_genders
    ADD CONSTRAINT user_genders_code_unique UNIQUE (code);
 O   ALTER TABLE ONLY public.user_genders DROP CONSTRAINT user_genders_code_unique;
       public            postgres    false    215                       2606    18587    user_genders user_genders_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_genders
    ADD CONSTRAINT user_genders_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_genders DROP CONSTRAINT user_genders_pkey;
       public            postgres    false    215                       2606    18578 !   user_roles user_roles_code_unique 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_code_unique UNIQUE (code);
 K   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_code_unique;
       public            postgres    false    213                       2606    18576    user_roles user_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    213                       2606    18606    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    217                       2606    18604    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            4           2606    18677 0   resturant_closed resturant_closed_res_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_closed
    ADD CONSTRAINT resturant_closed_res_id_foreign FOREIGN KEY (res_id) REFERENCES public.resturants(id);
 Z   ALTER TABLE ONLY public.resturant_closed DROP CONSTRAINT resturant_closed_res_id_foreign;
       public          postgres    false    221    3098    219            9           2606    18783 C   resturant_tables_booking resturant_tables_booking_booked_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_tables_booking
    ADD CONSTRAINT resturant_tables_booking_booked_by_foreign FOREIGN KEY (booked_by) REFERENCES public.users(id);
 m   ALTER TABLE ONLY public.resturant_tables_booking DROP CONSTRAINT resturant_tables_booking_booked_by_foreign;
       public          postgres    false    229    217    3094            7           2606    18773 @   resturant_tables_booking resturant_tables_booking_res_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_tables_booking
    ADD CONSTRAINT resturant_tables_booking_res_id_foreign FOREIGN KEY (res_id) REFERENCES public.resturants(id);
 j   ALTER TABLE ONLY public.resturant_tables_booking DROP CONSTRAINT resturant_tables_booking_res_id_foreign;
       public          postgres    false    229    3098    219            :           2606    18788 E   resturant_tables_booking resturant_tables_booking_status_code_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_tables_booking
    ADD CONSTRAINT resturant_tables_booking_status_code_foreign FOREIGN KEY (status_code) REFERENCES public.resturant_table_booking_status(code);
 o   ALTER TABLE ONLY public.resturant_tables_booking DROP CONSTRAINT resturant_tables_booking_status_code_foreign;
       public          postgres    false    3108    227    229            8           2606    18778 B   resturant_tables_booking resturant_tables_booking_table_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_tables_booking
    ADD CONSTRAINT resturant_tables_booking_table_id_foreign FOREIGN KEY (table_id) REFERENCES public.resturant_tables(id);
 l   ALTER TABLE ONLY public.resturant_tables_booking DROP CONSTRAINT resturant_tables_booking_table_id_foreign;
       public          postgres    false    225    3106    229            5           2606    18742 0   resturant_tables resturant_tables_res_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_tables
    ADD CONSTRAINT resturant_tables_res_id_foreign FOREIGN KEY (res_id) REFERENCES public.resturants(id);
 Z   ALTER TABLE ONLY public.resturant_tables DROP CONSTRAINT resturant_tables_res_id_foreign;
       public          postgres    false    225    219    3098            6           2606    18747 0   resturant_tables resturant_tables_spl_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturant_tables
    ADD CONSTRAINT resturant_tables_spl_id_foreign FOREIGN KEY (spl_id) REFERENCES public.resturant_table_speciality(code);
 Z   ALTER TABLE ONLY public.resturant_tables DROP CONSTRAINT resturant_tables_spl_id_foreign;
       public          postgres    false    223    3102    225            3           2606    18662 %   resturants resturants_city_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturants
    ADD CONSTRAINT resturants_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.city(id);
 O   ALTER TABLE ONLY public.resturants DROP CONSTRAINT resturants_city_id_foreign;
       public          postgres    false    211    219    3082            2           2606    18657 (   resturants resturants_country_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturants
    ADD CONSTRAINT resturants_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.country(id);
 R   ALTER TABLE ONLY public.resturants DROP CONSTRAINT resturants_country_id_foreign;
       public          postgres    false    207    3078    219            1           2606    18652 &   resturants resturants_state_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturants
    ADD CONSTRAINT resturants_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.state(id);
 P   ALTER TABLE ONLY public.resturants DROP CONSTRAINT resturants_state_id_foreign;
       public          postgres    false    219    209    3080            0           2606    18647 %   resturants resturants_user_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.resturants
    ADD CONSTRAINT resturants_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 O   ALTER TABLE ONLY public.resturants DROP CONSTRAINT resturants_user_id_foreign;
       public          postgres    false    219    217    3094            )           2606    18548    state state_country_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.country(id);
 H   ALTER TABLE ONLY public.state DROP CONSTRAINT state_country_id_foreign;
       public          postgres    false    209    207    3078            *           2606    18794    city state_id    FK CONSTRAINT     w   ALTER TABLE ONLY public.city
    ADD CONSTRAINT state_id FOREIGN KEY (state_id) REFERENCES public.state(id) NOT VALID;
 7   ALTER TABLE ONLY public.city DROP CONSTRAINT state_id;
       public          postgres    false    211    3080    209            +           2606    18607    users users_city_id_foreign    FK CONSTRAINT     y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.city(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_city_id_foreign;
       public          postgres    false    211    217    3082            -           2606    18617    users users_country_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.country(id);
 H   ALTER TABLE ONLY public.users DROP CONSTRAINT users_country_id_foreign;
       public          postgres    false    207    3078    217            .           2606    18622    users users_gender_code_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_gender_code_foreign FOREIGN KEY (gender_code) REFERENCES public.user_genders(code);
 I   ALTER TABLE ONLY public.users DROP CONSTRAINT users_gender_code_foreign;
       public          postgres    false    3088    217    215            /           2606    18627    users users_role_code_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_code_foreign FOREIGN KEY (role_code) REFERENCES public.user_roles(code);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_code_foreign;
       public          postgres    false    3084    217    213            ,           2606    18612    users users_state_id_foreign    FK CONSTRAINT     |   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.state(id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_state_id_foreign;
       public          postgres    false    217    3080    209            ?   q   x???M
?0@???)?K??u???st??4X?O׭???1?[[?????@>?]??4?Sv??J?:*???Q??Y?:QДH?,??? ?p_??z?????&???9!?$0      ?   :   x?3???s?t??FF??f?F&
?fV&V&z&?F&??V?p??qqq ???      ?     x?}?Kn? ??u|?y0s?J?qP?ֲ#??}??⪬?????!??h???w?<??[}????P?I?:?Հyq=? ??ԦP(??_K??s*]?z	ur??&??}???.???Z?)?0? ??s@?(????7$ ??O!?yj?t?iks??m?y٬???}׏1o? ???"O?o?LI??>^Bwn??/??????:?ܳ?^,)?!e
??Q?a?????]?ݔ?)??(1??????f???>TUU???¹      ?      x?3?4?????? V      ?   {   x???A!??5???f?Dų???Q3?E[?]???CH?P9P?i]?????Q??n????5S??_?7?F6??H??ug?Gg?s3Ul?? ;?????"v??;?QY??T3ۮ?|&f~?WP?      ?   x   x?]?K
?0 ????K?d?ϲ?n???&%xL? z??S0??Z?s?ky?m??эdRI?DQ:c??ڤQЗ???9wF?,,?1?Lõ-????????P??Pz??Nr?B??U'?      ?   z   x?e?K
?0????*?KB???f-?TZ??D??W??X8????֪-?	}?x?????`?I?9j????1???1P	fٶ??Ϸw;????T)mX?:??[??5??$????s?J*Y      ?   ?   x????	?@Eѵ?
??M-?`LB<d+.=?E,`?Ʊ?W??:??ܣ?b??o?-?
??I??*??X????+??!H`?}&?Q????r")?7{XwI????n?O??HL??Z?׷T?H?$j*urH;???R!R	      ?     x???͊1??u?????????`6?4???1i?&gp&
ՋꜪ???????#?Oe????Sr7??ɳ?7????????????]??_o?o?ӧ????M??TjmV??M@
?=޺??X?Xd?@?3?ƤR?!'??????=5?(??U@???b@m?/k???PF?wHWh?Zj >????׮%i1˂????j???{,z?V8P 5d@|?@?[\̄6?Hxq`|???????7?`????E?g4y?j(??a?Lb?m?9???8@??m3???j*j??Y?$ ?}???7?G??w9?Q3?( I???hj???Y??
@	??{???????d?*????f[N?KA?0??ޠ?cssx??????y??Eo3ܼH?W苀t?_???~?*?琀Tt}h˅e?>R}????U?zS`s?kV?ϵ?????1>?R?6N^( ?e??w澙>??څSxUT;?:???uM?*?
?)?/\T?N      ?   ?   x??ο? ??????ʟ?ppv1?	???????jb??p×?~?r???Ι?Z??9?b_#?B??p???Jwƒ>?4???rmL?xKK?:@P?е?a=J?5sBY?A{?C@??u	???????4??X?>3??-S?f:?ۉ?i+??o????ye??'?_y<      ?   o   x??̱
?0 ?9?
w?$mچ????⒡x?????????xc=??S??V`?乣?yi8??????Ėb	?
0@_????
䔕9=]??훝????eU???] N?K?1?      ?   [   x?m?9
?0 ?z????Wb???XD,A???h???0,?\?AH?QtbǢ?(???Rh)\@???W???s?I?k?S?vП?}?	?S{??'uw?      ?   [   x?e?;?  й?????GU??b"??????ō7??m????#yسN??ȉGJY)?Ҟz??Wf??H????RA??	-???s??j?K      ?   ?   x??˻?0@??<????[??qs?h??KA?m	7#O?>?9?w(?e+t-4:?zRѣj?!"???0)?Uf4a ?@?Q??????lqn*E6?l????NT?S??P??r??YBwn??????3?M?????E"????Eu`?0oEyļ8????p~??PZwlY???:_     
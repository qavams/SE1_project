PGDMP         2        
        z           postgres    13.3    13.3 *    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13442    postgres    DATABASE     c   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Persian_Iran.1256';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3055                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            ?           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16519    TAs    TABLE     ?   CREATE TABLE public."TAs" (
    hw_num text NOT NULL,
    start_date date NOT NULL,
    name text NOT NULL,
    salary integer DEFAULT 0,
    phone integer DEFAULT 0
);
    DROP TABLE public."TAs";
       public         heap    postgres    false            ?            1259    16638 	   customers    TABLE     K   CREATE TABLE public.customers (
    first_name text,
    last_name text
);
    DROP TABLE public.customers;
       public         heap    postgres    false            ?            1259    16540    homework    TABLE     ?   CREATE TABLE public.homework (
    hw_num text NOT NULL,
    s_id text NOT NULL,
    t_id text NOT NULL,
    time_span integer NOT NULL
);
    DROP TABLE public.homework;
       public         heap    postgres    false            ?            1259    16552    lessons    TABLE     j   CREATE TABLE public.lessons (
    time_span integer NOT NULL,
    datetime timestamp without time zone
);
    DROP TABLE public.lessons;
       public         heap    postgres    false            ?            1259    16546    sessions    TABLE     ?   CREATE TABLE public.sessions (
    s_id text NOT NULL,
    t_id text NOT NULL,
    time_span integer NOT NULL,
    salary integer NOT NULL,
    hw_num text
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            ?            1259    16644    student    TABLE     I   CREATE TABLE public.student (
    first_name text,
    last_name text
);
    DROP TABLE public.student;
       public         heap    postgres    false            ?            1259    16527    students    TABLE     ?   CREATE TABLE public.students (
    s_id text NOT NULL,
    full_name text NOT NULL,
    phone text NOT NULL,
    lesson character(2) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            ?            1259    16513    teachers    TABLE     ?   CREATE TABLE public.teachers (
    t_id text NOT NULL,
    full_name text NOT NULL,
    lessons text NOT NULL,
    phone_num character varying(12),
    yofbirth integer
);
    DROP TABLE public.teachers;
       public         heap    postgres    false            ?            1259    16555    time_time_slot_seq    SEQUENCE     {   CREATE SEQUENCE public.time_time_slot_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.time_time_slot_seq;
       public          postgres    false    206            ?           0    0    time_time_slot_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.time_time_slot_seq OWNED BY public.lessons.time_span;
          public          postgres    false    207            H           2604    16566    lessons time_span    DEFAULT     s   ALTER TABLE ONLY public.lessons ALTER COLUMN time_span SET DEFAULT nextval('public.time_time_slot_seq'::regclass);
 @   ALTER TABLE public.lessons ALTER COLUMN time_span DROP DEFAULT;
       public          postgres    false    207    206            ?          0    16519    TAs 
   TABLE DATA           H   COPY public."TAs" (hw_num, start_date, name, salary, phone) FROM stdin;
    public          postgres    false    202   [-       ?          0    16638 	   customers 
   TABLE DATA           :   COPY public.customers (first_name, last_name) FROM stdin;
    public          postgres    false    208   ?-       ?          0    16540    homework 
   TABLE DATA           A   COPY public.homework (hw_num, s_id, t_id, time_span) FROM stdin;
    public          postgres    false    204   ?-       ?          0    16552    lessons 
   TABLE DATA           6   COPY public.lessons (time_span, datetime) FROM stdin;
    public          postgres    false    206   ?-       ?          0    16546    sessions 
   TABLE DATA           I   COPY public.sessions (s_id, t_id, time_span, salary, hw_num) FROM stdin;
    public          postgres    false    205   .       ?          0    16644    student 
   TABLE DATA           8   COPY public.student (first_name, last_name) FROM stdin;
    public          postgres    false    209   f.       ?          0    16527    students 
   TABLE DATA           B   COPY public.students (s_id, full_name, phone, lesson) FROM stdin;
    public          postgres    false    203   ?.       ?          0    16513    teachers 
   TABLE DATA           Q   COPY public.teachers (t_id, full_name, lessons, phone_num, yofbirth) FROM stdin;
    public          postgres    false    201   Y/       ?           0    0    time_time_slot_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.time_time_slot_seq', 4, true);
          public          postgres    false    207            J           2606    16569    teachers doctor_phone_num_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT doctor_phone_num_key UNIQUE (phone_num);
 G   ALTER TABLE ONLY public.teachers DROP CONSTRAINT doctor_phone_num_key;
       public            postgres    false    201            L           2606    16571    teachers doctor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (t_id);
 >   ALTER TABLE ONLY public.teachers DROP CONSTRAINT doctor_pkey;
       public            postgres    false    201            N           2606    16658 
   TAs hw_num 
   CONSTRAINT     N   ALTER TABLE ONLY public."TAs"
    ADD CONSTRAINT hw_num PRIMARY KEY (hw_num);
 6   ALTER TABLE ONLY public."TAs" DROP CONSTRAINT hw_num;
       public            postgres    false    202            P           2606    16575    students patient_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.students
    ADD CONSTRAINT patient_pkey PRIMARY KEY (s_id);
 ?   ALTER TABLE ONLY public.students DROP CONSTRAINT patient_pkey;
       public            postgres    false    203            R           2606    16579    homework prescribe_factor_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.homework
    ADD CONSTRAINT prescribe_factor_pkey PRIMARY KEY (hw_num);
 H   ALTER TABLE ONLY public.homework DROP CONSTRAINT prescribe_factor_pkey;
       public            postgres    false    204            U           2606    16581    sessions section_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT section_pkey PRIMARY KEY (s_id, t_id, time_span);
 ?   ALTER TABLE ONLY public.sessions DROP CONSTRAINT section_pkey;
       public            postgres    false    205    205    205            W           2606    16583    lessons time_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT time_pkey PRIMARY KEY (time_span);
 ;   ALTER TABLE ONLY public.lessons DROP CONSTRAINT time_pkey;
       public            postgres    false    206            S           1259    16664 	   fki_fk_hw    INDEX     @   CREATE INDEX fki_fk_hw ON public.sessions USING btree (hw_num);
    DROP INDEX public.fki_fk_hw;
       public            postgres    false    205            ^           2606    16659    sessions fk_hw    FK CONSTRAINT     z   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_hw FOREIGN KEY (hw_num) REFERENCES public."TAs"(hw_num) NOT VALID;
 8   ALTER TABLE ONLY public.sessions DROP CONSTRAINT fk_hw;
       public          postgres    false    205    2894    202            X           2606    16596 #   homework prescribe_factor_d_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.homework
    ADD CONSTRAINT prescribe_factor_d_id_fkey FOREIGN KEY (t_id) REFERENCES public.teachers(t_id);
 M   ALTER TABLE ONLY public.homework DROP CONSTRAINT prescribe_factor_d_id_fkey;
       public          postgres    false    2892    204    201            Y           2606    16601 #   homework prescribe_factor_p_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.homework
    ADD CONSTRAINT prescribe_factor_p_id_fkey FOREIGN KEY (s_id) REFERENCES public.students(s_id);
 M   ALTER TABLE ONLY public.homework DROP CONSTRAINT prescribe_factor_p_id_fkey;
       public          postgres    false    204    2896    203            Z           2606    16606 (   homework prescribe_factor_time_slot_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.homework
    ADD CONSTRAINT prescribe_factor_time_slot_fkey FOREIGN KEY (time_span) REFERENCES public.lessons(time_span);
 R   ALTER TABLE ONLY public.homework DROP CONSTRAINT prescribe_factor_time_slot_fkey;
       public          postgres    false    2903    204    206            [           2606    16611    sessions section_d_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT section_d_id_fkey FOREIGN KEY (t_id) REFERENCES public.teachers(t_id);
 D   ALTER TABLE ONLY public.sessions DROP CONSTRAINT section_d_id_fkey;
       public          postgres    false    2892    205    201            \           2606    16616    sessions section_p_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT section_p_id_fkey FOREIGN KEY (s_id) REFERENCES public.students(s_id);
 D   ALTER TABLE ONLY public.sessions DROP CONSTRAINT section_p_id_fkey;
       public          postgres    false    205    2896    203            ]           2606    16621    sessions section_time_slot_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT section_time_slot_fkey FOREIGN KEY (time_span) REFERENCES public.lessons(time_span);
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT section_time_slot_fkey;
       public          postgres    false    205    2903    206            ?   4   x???072415?4202?50?50??͏?M-I????47 NC?=... ?.
&      ?      x?????? ? ?      ?   &   x?3773355116?44420?4??2,8?b???? }?A      ?      x?3????2? ?D??qqq <?g      ?   :   x?34420?4??43,89M???ѐ?C?]??!i?*ifn??3A???qqq ??U      ?      x?????? ? ?      ?   ?   x?u????0???SlO~BR&?!
hB?td[???'??<=vH?t??F??????zU?K:h??zi??W??3tp:h8???;?????nDټ?t??Br???|?=?????YLhU??????????K??.?L?fo?7<"??w
7?J^2???vS?fP#??~?O???s?}????k5t?z!?K!??X?      ?   ]   x?%?K
?0?ur
O yV??????P?O/??ha??r|?J?ͺ???$? ?Zx\/??7^h?l[U???HF?t?v??{??w?c??/e?N     
PGDMP      9                |            employee_management    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    41206    employee_management    DATABASE     �   CREATE DATABASE employee_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 #   DROP DATABASE employee_management;
                postgres    false            �            1259    41240    departments    TABLE     |   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(50) NOT NULL
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    41239    departments_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.departments_department_id_seq;
       public          postgres    false    216                       0    0    departments_department_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;
          public          postgres    false    215            �            1259    41247 	   employees    TABLE       CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    hire_date date DEFAULT CURRENT_DATE NOT NULL,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    41246    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employees_employee_id_seq;
       public          postgres    false    218                       0    0    employees_employee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;
          public          postgres    false    217            �            1259    41262    salaries    TABLE     �   CREATE TABLE public.salaries (
    salary_id integer NOT NULL,
    employee_id integer NOT NULL,
    salary numeric(10,2) NOT NULL
);
    DROP TABLE public.salaries;
       public         heap    postgres    false            �            1259    41261    salaries_salary_id_seq    SEQUENCE     �   CREATE SEQUENCE public.salaries_salary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.salaries_salary_id_seq;
       public          postgres    false    220                       0    0    salaries_salary_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.salaries_salary_id_seq OWNED BY public.salaries.salary_id;
          public          postgres    false    219            Z           2604    41243    departments department_id    DEFAULT     �   ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);
 H   ALTER TABLE public.departments ALTER COLUMN department_id DROP DEFAULT;
       public          postgres    false    215    216    216            [           2604    41250    employees employee_id    DEFAULT     ~   ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);
 D   ALTER TABLE public.employees ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    217    218    218            ]           2604    41265    salaries salary_id    DEFAULT     x   ALTER TABLE ONLY public.salaries ALTER COLUMN salary_id SET DEFAULT nextval('public.salaries_salary_id_seq'::regclass);
 A   ALTER TABLE public.salaries ALTER COLUMN salary_id DROP DEFAULT;
       public          postgres    false    220    219    220            �          0    41240    departments 
   TABLE DATA           E   COPY public.departments (department_id, department_name) FROM stdin;
    public          postgres    false    216   �       �          0    41247 	   employees 
   TABLE DATA           h   COPY public.employees (employee_id, first_name, last_name, email, hire_date, department_id) FROM stdin;
    public          postgres    false    218   6       �          0    41262    salaries 
   TABLE DATA           B   COPY public.salaries (salary_id, employee_id, salary) FROM stdin;
    public          postgres    false    220   �                  0    0    departments_department_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.departments_department_id_seq', 4, true);
          public          postgres    false    215                       0    0    employees_employee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_employee_id_seq', 11, true);
          public          postgres    false    217                       0    0    salaries_salary_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.salaries_salary_id_seq', 4, true);
          public          postgres    false    219            _           2606    41245    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    216            a           2606    41255    employees employees_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_email_key;
       public            postgres    false    218            c           2606    41253    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    218            d           2606    41256     employees fk_employee_department    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 J   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employee_department;
       public          postgres    false    218    216    4703            e           2606    41266    salaries fk_salary_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT fk_salary_employee FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 E   ALTER TABLE ONLY public.salaries DROP CONSTRAINT fk_salary_employee;
       public          postgres    false    218    4707    220            �   2   x�3���2�t�K��KM-��K�2�N�I-�2��M,�N-���qqq V^      �   �   x�u��
�0DϓiicUz��^V���M��P�{S�hN3��l�	y���HA0�{9<������lSTmQ�aM�3�	'f�T��?Y�.���S�c��b?s@/˷��-z��Ǥ=j��w��o�1��As      �   ,   x�3�4�47 =.#NN3S8טӔ����!+����� X<
O     
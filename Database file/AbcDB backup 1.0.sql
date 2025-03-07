PGDMP                      |           AbcDB    16.3    16.3 e    :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    16398    AbcDB    DATABASE     �   CREATE DATABASE "AbcDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "AbcDB";
                postgres    false                        2615    16400    main_schema    SCHEMA        CREATE SCHEMA main_schema;
    DROP SCHEMA main_schema;
                postgres    false            �            1259    16542 
   categories    TABLE     �   CREATE TABLE main_schema.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);
 #   DROP TABLE main_schema.categories;
       main_schema         heap    postgres    false    6            �            1259    16580    comments    TABLE     �   CREATE TABLE main_schema.comments (
    id integer NOT NULL,
    comment_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    customer_id integer
);
 !   DROP TABLE main_schema.comments;
       main_schema         heap    postgres    false    6            �            1259    16579    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE main_schema.comments_id_seq;
       main_schema          postgres    false    6    235            >           0    0    comments_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE main_schema.comments_id_seq OWNED BY main_schema.comments.id;
          main_schema          postgres    false    234            �            1259    16511    country    TABLE     h   CREATE TABLE main_schema.country (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
     DROP TABLE main_schema.country;
       main_schema         heap    postgres    false    6            �            1259    16510    country_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE main_schema.country_id_seq;
       main_schema          postgres    false    228    6            ?           0    0    country_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE main_schema.country_id_seq OWNED BY main_schema.country.id;
          main_schema          postgres    false    227            �            1259    16497    customer_id_seq    SEQUENCE     }   CREATE SEQUENCE main_schema.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE main_schema.customer_id_seq;
       main_schema          postgres    false    6            �            1259    16411 	   customers    TABLE     �  CREATE TABLE main_schema.customers (
    id integer DEFAULT nextval('main_schema.customer_id_seq'::regclass) NOT NULL,
    full_name character varying(100),
    email character varying(100),
    last_login timestamp without time zone,
    password character varying(100),
    address character varying(100),
    country_id integer,
    postal_code character varying(50),
    phone character varying(50)
);
 "   DROP TABLE main_schema.customers;
       main_schema         heap    postgres    false    224    6            �            1259    16410    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE main_schema.customers_customer_id_seq;
       main_schema          postgres    false    6    219            @           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE main_schema.customers_customer_id_seq OWNED BY main_schema.customers.id;
          main_schema          postgres    false    218            �            1259    16504    order_id_seq    SEQUENCE     z   CREATE SEQUENCE main_schema.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE main_schema.order_id_seq;
       main_schema          postgres    false    6            �            1259    16632    order_items    TABLE     �   CREATE TABLE main_schema.order_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);
 $   DROP TABLE main_schema.order_items;
       main_schema         heap    postgres    false    6            �            1259    16427    orders    TABLE     �   CREATE TABLE main_schema.orders (
    id integer NOT NULL,
    customer_id integer,
    date timestamp without time zone,
    description text
);
    DROP TABLE main_schema.orders;
       main_schema         heap    postgres    false    6            �            1259    16426    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE main_schema.orders_order_id_seq;
       main_schema          postgres    false    223    6            A           0    0    orders_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE main_schema.orders_order_id_seq OWNED BY main_schema.orders.id;
          main_schema          postgres    false    222            �            1259    16550    product_categories    TABLE     s   CREATE TABLE main_schema.product_categories (
    product_id integer NOT NULL,
    category_id integer NOT NULL
);
 +   DROP TABLE main_schema.product_categories;
       main_schema         heap    postgres    false    6            �            1259    16541    product_category_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE main_schema.product_category_id_seq;
       main_schema          postgres    false    6    232            B           0    0    product_category_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE main_schema.product_category_id_seq OWNED BY main_schema.categories.id;
          main_schema          postgres    false    231            �            1259    16498    product_id_seq    SEQUENCE     |   CREATE SEQUENCE main_schema.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE main_schema.product_id_seq;
       main_schema          postgres    false    6            �            1259    16617    product_tags    TABLE     h   CREATE TABLE main_schema.product_tags (
    product_id integer NOT NULL,
    tag_id integer NOT NULL
);
 %   DROP TABLE main_schema.product_tags;
       main_schema         heap    postgres    false    6            �            1259    16420    products    TABLE       CREATE TABLE main_schema.products (
    id integer DEFAULT nextval('main_schema.product_id_seq'::regclass) NOT NULL,
    name character varying(100),
    supplier integer,
    price numeric(10,2),
    product_description text,
    image character varying(255)
);
 !   DROP TABLE main_schema.products;
       main_schema         heap    postgres    false    225    6            �            1259    16594    products_comments    TABLE     q   CREATE TABLE main_schema.products_comments (
    product_id integer NOT NULL,
    comment_id integer NOT NULL
);
 *   DROP TABLE main_schema.products_comments;
       main_schema         heap    postgres    false    6            �            1259    16419    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE main_schema.products_product_id_seq;
       main_schema          postgres    false    221    6            C           0    0    products_product_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE main_schema.products_product_id_seq OWNED BY main_schema.products.id;
          main_schema          postgres    false    220            �            1259    16647    returned_items    TABLE     �   CREATE TABLE main_schema.returned_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    return_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE main_schema.returned_items;
       main_schema         heap    postgres    false    6            �            1259    16402    stored_queries    TABLE     �   CREATE TABLE main_schema.stored_queries (
    query_id integer NOT NULL,
    query_name character varying(100),
    query_text text
);
 '   DROP TABLE main_schema.stored_queries;
       main_schema         heap    postgres    false    6            �            1259    16401    stored_queries_query_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.stored_queries_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE main_schema.stored_queries_query_id_seq;
       main_schema          postgres    false    6    217            D           0    0    stored_queries_query_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE main_schema.stored_queries_query_id_seq OWNED BY main_schema.stored_queries.query_id;
          main_schema          postgres    false    216            �            1259    16535 	   suppliers    TABLE     �   CREATE TABLE main_schema.suppliers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(255),
    contact character varying(100)
);
 "   DROP TABLE main_schema.suppliers;
       main_schema         heap    postgres    false    6            �            1259    16534    supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE main_schema.supplier_id_seq;
       main_schema          postgres    false    230    6            E           0    0    supplier_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE main_schema.supplier_id_seq OWNED BY main_schema.suppliers.id;
          main_schema          postgres    false    229            �            1259    16610    tags    TABLE     d   CREATE TABLE main_schema.tags (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE main_schema.tags;
       main_schema         heap    postgres    false    6            �            1259    16609    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE main_schema.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE main_schema.tags_id_seq;
       main_schema          postgres    false    6    238            F           0    0    tags_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE main_schema.tags_id_seq OWNED BY main_schema.tags.id;
          main_schema          postgres    false    237            `           2604    16545    categories id    DEFAULT     ~   ALTER TABLE ONLY main_schema.categories ALTER COLUMN id SET DEFAULT nextval('main_schema.product_category_id_seq'::regclass);
 A   ALTER TABLE main_schema.categories ALTER COLUMN id DROP DEFAULT;
       main_schema          postgres    false    231    232    232            a           2604    16583    comments id    DEFAULT     t   ALTER TABLE ONLY main_schema.comments ALTER COLUMN id SET DEFAULT nextval('main_schema.comments_id_seq'::regclass);
 ?   ALTER TABLE main_schema.comments ALTER COLUMN id DROP DEFAULT;
       main_schema          postgres    false    234    235    235            ^           2604    16514 
   country id    DEFAULT     r   ALTER TABLE ONLY main_schema.country ALTER COLUMN id SET DEFAULT nextval('main_schema.country_id_seq'::regclass);
 >   ALTER TABLE main_schema.country ALTER COLUMN id DROP DEFAULT;
       main_schema          postgres    false    227    228    228            ]           2604    16430 	   orders id    DEFAULT     v   ALTER TABLE ONLY main_schema.orders ALTER COLUMN id SET DEFAULT nextval('main_schema.orders_order_id_seq'::regclass);
 =   ALTER TABLE main_schema.orders ALTER COLUMN id DROP DEFAULT;
       main_schema          postgres    false    222    223    223            Z           2604    16405    stored_queries query_id    DEFAULT     �   ALTER TABLE ONLY main_schema.stored_queries ALTER COLUMN query_id SET DEFAULT nextval('main_schema.stored_queries_query_id_seq'::regclass);
 K   ALTER TABLE main_schema.stored_queries ALTER COLUMN query_id DROP DEFAULT;
       main_schema          postgres    false    216    217    217            _           2604    16538    suppliers id    DEFAULT     u   ALTER TABLE ONLY main_schema.suppliers ALTER COLUMN id SET DEFAULT nextval('main_schema.supplier_id_seq'::regclass);
 @   ALTER TABLE main_schema.suppliers ALTER COLUMN id DROP DEFAULT;
       main_schema          postgres    false    229    230    230            c           2604    16613    tags id    DEFAULT     l   ALTER TABLE ONLY main_schema.tags ALTER COLUMN id SET DEFAULT nextval('main_schema.tags_id_seq'::regclass);
 ;   ALTER TABLE main_schema.tags ALTER COLUMN id DROP DEFAULT;
       main_schema          postgres    false    237    238    238            .          0    16542 
   categories 
   TABLE DATA           @   COPY main_schema.categories (id, name, description) FROM stdin;
    main_schema          postgres    false    232   �z       1          0    16580    comments 
   TABLE DATA           R   COPY main_schema.comments (id, comment_text, created_at, customer_id) FROM stdin;
    main_schema          postgres    false    235   ]|       *          0    16511    country 
   TABLE DATA           0   COPY main_schema.country (id, name) FROM stdin;
    main_schema          postgres    false    228   �}       !          0    16411 	   customers 
   TABLE DATA           }   COPY main_schema.customers (id, full_name, email, last_login, password, address, country_id, postal_code, phone) FROM stdin;
    main_schema          postgres    false    219   ~       6          0    16632    order_items 
   TABLE DATA           Q   COPY main_schema.order_items (order_id, product_id, quantity, price) FROM stdin;
    main_schema          postgres    false    240   3�       %          0    16427    orders 
   TABLE DATA           I   COPY main_schema.orders (id, customer_id, date, description) FROM stdin;
    main_schema          postgres    false    223   ��       /          0    16550    product_categories 
   TABLE DATA           J   COPY main_schema.product_categories (product_id, category_id) FROM stdin;
    main_schema          postgres    false    233   т       5          0    16617    product_tags 
   TABLE DATA           ?   COPY main_schema.product_tags (product_id, tag_id) FROM stdin;
    main_schema          postgres    false    239   �       #          0    16420    products 
   TABLE DATA           ^   COPY main_schema.products (id, name, supplier, price, product_description, image) FROM stdin;
    main_schema          postgres    false    221   K�       2          0    16594    products_comments 
   TABLE DATA           H   COPY main_schema.products_comments (product_id, comment_id) FROM stdin;
    main_schema          postgres    false    236   A�       7          0    16647    returned_items 
   TABLE DATA           Z   COPY main_schema.returned_items (order_id, product_id, quantity, return_date) FROM stdin;
    main_schema          postgres    false    241   ��                 0    16402    stored_queries 
   TABLE DATA           O   COPY main_schema.stored_queries (query_id, query_name, query_text) FROM stdin;
    main_schema          postgres    false    217   ׅ       ,          0    16535 	   suppliers 
   TABLE DATA           D   COPY main_schema.suppliers (id, name, address, contact) FROM stdin;
    main_schema          postgres    false    230   �       4          0    16610    tags 
   TABLE DATA           -   COPY main_schema.tags (id, name) FROM stdin;
    main_schema          postgres    false    238   ��       G           0    0    comments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('main_schema.comments_id_seq', 10, true);
          main_schema          postgres    false    234            H           0    0    country_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('main_schema.country_id_seq', 10, true);
          main_schema          postgres    false    227            I           0    0    customer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('main_schema.customer_id_seq', 16, true);
          main_schema          postgres    false    224            J           0    0    customers_customer_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('main_schema.customers_customer_id_seq', 1, false);
          main_schema          postgres    false    218            K           0    0    order_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('main_schema.order_id_seq', 1, false);
          main_schema          postgres    false    226            L           0    0    orders_order_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('main_schema.orders_order_id_seq', 31, true);
          main_schema          postgres    false    222            M           0    0    product_category_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('main_schema.product_category_id_seq', 10, true);
          main_schema          postgres    false    231            N           0    0    product_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('main_schema.product_id_seq', 10, true);
          main_schema          postgres    false    225            O           0    0    products_product_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('main_schema.products_product_id_seq', 1, false);
          main_schema          postgres    false    220            P           0    0    stored_queries_query_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('main_schema.stored_queries_query_id_seq', 61, true);
          main_schema          postgres    false    216            Q           0    0    supplier_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('main_schema.supplier_id_seq', 10, true);
          main_schema          postgres    false    229            R           0    0    tags_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('main_schema.tags_id_seq', 10, true);
          main_schema          postgres    false    237            v           2606    16588    comments comments_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY main_schema.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY main_schema.comments DROP CONSTRAINT comments_pkey;
       main_schema            postgres    false    235            n           2606    16516    country country_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY main_schema.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY main_schema.country DROP CONSTRAINT country_pkey;
       main_schema            postgres    false    228            h           2606    16418    customers customers_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY main_schema.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY main_schema.customers DROP CONSTRAINT customers_pkey;
       main_schema            postgres    false    219            ~           2606    16636    order_items order_items_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY main_schema.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, product_id);
 K   ALTER TABLE ONLY main_schema.order_items DROP CONSTRAINT order_items_pkey;
       main_schema            postgres    false    240    240            l           2606    16432    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY main_schema.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY main_schema.orders DROP CONSTRAINT orders_pkey;
       main_schema            postgres    false    223            t           2606    16554 *   product_categories product_categories_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY main_schema.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (product_id, category_id);
 Y   ALTER TABLE ONLY main_schema.product_categories DROP CONSTRAINT product_categories_pkey;
       main_schema            postgres    false    233    233            r           2606    16549     categories product_category_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY main_schema.categories
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY main_schema.categories DROP CONSTRAINT product_category_pkey;
       main_schema            postgres    false    232            |           2606    16621    product_tags product_tags_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY main_schema.product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (product_id, tag_id);
 M   ALTER TABLE ONLY main_schema.product_tags DROP CONSTRAINT product_tags_pkey;
       main_schema            postgres    false    239    239            x           2606    16598 (   products_comments products_comments_pkey 
   CONSTRAINT        ALTER TABLE ONLY main_schema.products_comments
    ADD CONSTRAINT products_comments_pkey PRIMARY KEY (product_id, comment_id);
 W   ALTER TABLE ONLY main_schema.products_comments DROP CONSTRAINT products_comments_pkey;
       main_schema            postgres    false    236    236            j           2606    16425    products products_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY main_schema.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY main_schema.products DROP CONSTRAINT products_pkey;
       main_schema            postgres    false    221            �           2606    16652 "   returned_items returned_items_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY main_schema.returned_items
    ADD CONSTRAINT returned_items_pkey PRIMARY KEY (order_id, product_id);
 Q   ALTER TABLE ONLY main_schema.returned_items DROP CONSTRAINT returned_items_pkey;
       main_schema            postgres    false    241    241            f           2606    16409 "   stored_queries stored_queries_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY main_schema.stored_queries
    ADD CONSTRAINT stored_queries_pkey PRIMARY KEY (query_id);
 Q   ALTER TABLE ONLY main_schema.stored_queries DROP CONSTRAINT stored_queries_pkey;
       main_schema            postgres    false    217            p           2606    16540    suppliers supplier_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY main_schema.suppliers
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY main_schema.suppliers DROP CONSTRAINT supplier_pkey;
       main_schema            postgres    false    230            z           2606    16615    tags tags_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY main_schema.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY main_schema.tags DROP CONSTRAINT tags_pkey;
       main_schema            postgres    false    238            �           2606    16589 "   comments comments_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.comments
    ADD CONSTRAINT comments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES main_schema.customers(id);
 Q   ALTER TABLE ONLY main_schema.comments DROP CONSTRAINT comments_customer_id_fkey;
       main_schema          postgres    false    219    235    4712            �           2606    16528    customers fk_country    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.customers
    ADD CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES main_schema.country(id);
 C   ALTER TABLE ONLY main_schema.customers DROP CONSTRAINT fk_country;
       main_schema          postgres    false    4718    228    219            �           2606    16572    products fk_supplier    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.products
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier) REFERENCES main_schema.suppliers(id);
 C   ALTER TABLE ONLY main_schema.products DROP CONSTRAINT fk_supplier;
       main_schema          postgres    false    230    221    4720            �           2606    16637 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES main_schema.orders(id);
 T   ALTER TABLE ONLY main_schema.order_items DROP CONSTRAINT order_items_order_id_fkey;
       main_schema          postgres    false    4716    240    223            �           2606    16642 '   order_items order_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);
 V   ALTER TABLE ONLY main_schema.order_items DROP CONSTRAINT order_items_product_id_fkey;
       main_schema          postgres    false    4714    240    221            �           2606    16433    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES main_schema.customers(id);
 M   ALTER TABLE ONLY main_schema.orders DROP CONSTRAINT orders_customer_id_fkey;
       main_schema          postgres    false    4712    223    219            �           2606    16560 6   product_categories product_categories_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.product_categories
    ADD CONSTRAINT product_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES main_schema.categories(id);
 e   ALTER TABLE ONLY main_schema.product_categories DROP CONSTRAINT product_categories_category_id_fkey;
       main_schema          postgres    false    232    4722    233            �           2606    16555 5   product_categories product_categories_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.product_categories
    ADD CONSTRAINT product_categories_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);
 d   ALTER TABLE ONLY main_schema.product_categories DROP CONSTRAINT product_categories_product_id_fkey;
       main_schema          postgres    false    4714    221    233            �           2606    16622 )   product_tags product_tags_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.product_tags
    ADD CONSTRAINT product_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);
 X   ALTER TABLE ONLY main_schema.product_tags DROP CONSTRAINT product_tags_product_id_fkey;
       main_schema          postgres    false    239    221    4714            �           2606    16627 %   product_tags product_tags_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.product_tags
    ADD CONSTRAINT product_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES main_schema.tags(id);
 T   ALTER TABLE ONLY main_schema.product_tags DROP CONSTRAINT product_tags_tag_id_fkey;
       main_schema          postgres    false    239    238    4730            �           2606    16604 3   products_comments products_comments_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.products_comments
    ADD CONSTRAINT products_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES main_schema.comments(id);
 b   ALTER TABLE ONLY main_schema.products_comments DROP CONSTRAINT products_comments_comment_id_fkey;
       main_schema          postgres    false    236    4726    235            �           2606    16599 3   products_comments products_comments_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.products_comments
    ADD CONSTRAINT products_comments_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);
 b   ALTER TABLE ONLY main_schema.products_comments DROP CONSTRAINT products_comments_product_id_fkey;
       main_schema          postgres    false    221    4714    236            �           2606    16653 +   returned_items returned_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.returned_items
    ADD CONSTRAINT returned_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES main_schema.orders(id);
 Z   ALTER TABLE ONLY main_schema.returned_items DROP CONSTRAINT returned_items_order_id_fkey;
       main_schema          postgres    false    241    223    4716            �           2606    16658 -   returned_items returned_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY main_schema.returned_items
    ADD CONSTRAINT returned_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);
 \   ALTER TABLE ONLY main_schema.returned_items DROP CONSTRAINT returned_items_product_id_fkey;
       main_schema          postgres    false    221    4714    241            .   }  x�eR�n�0<�_�SN��i��1��!�c/Z���Պ*Im�_���[�b���p4��y�2J�.��!��-o�:�"�l�P����L�8��y��)'���60X?�֏F=��a��GJmV�J�6VJwe�h�p�A݈����M�nQL�B�=����LX�]�[�������@>Am�m�TkL"p�����l��F��[�E���Y��a���bb;!֡_�k&V�_5U�|�����J�����L���mF�h�&^�&�%1�1D�����/�N�fn�Ҟ4��Y�ly��:�<7�^�7?,�*{/E=�r�.�D-z�;�NAK�dU=5�%/?��������I�S}��tK��?Z3N^��C�u����      1   '  x���1O�0�g�W{Z%N۴� � �k_bKN�s���	����t�-�{�`%A�N�20�1n��ʷ-v���\,fy5��-�V�,rQ����	fD<{T�:��$���ON��"�0���y��
�Î`/]B�}��w8L*7|��e$�������+�"�D{�p�R�|�^�� �ݣ-[٠�|�^1%�X�Qw�d���)(#��W��'�4�l���%_���g�u�|ÞM�2�ƨ��]2��E�n[�9f~�y6n���y���8[��9������      *   h   x����@��ޏ1���	��D&�qw0���95:�$V����^��,�����`l1h��G�i�7��&�p]��AxƸ����7)�+�Ւ����?Q��      !     x�m��n�F���S0���{��ѭ��p�6w��.uZ�ӻ%�6`6����j"��K{\�0>_��������Un|yZ�n'0h\��3�b��)��Џ��y2i�u�EI�h���k-�6�Ih"d:�m磥&�q�K� ��?�����c��L����R�M�pJ,��0���0�^J���0"����^��㼿�B��\4]F�o�-攛����vY��m}Q���^��SE���?aK��{���i0%H�&�qDo-�1��t�w�2XHޠ���C:XG�\��N��>�V�
����a|�-�����8���MO��F_��⌛�9F���ϣ�2��o�=֓,z���h Rgc�K]�j?�� ��ǟ�����"��m�^�[7-��m��c�HHST�aJ��b3�a�4X��ϵ
?��|�;��;u|�J.޼n�!��_VWM�mʠ�P�m��)�oJt	�{g`�%��|�C���0d��<��46�+p�y�gT�~)ߔZ��������
*�~�Dɼ���N��M��Y6�.,�$GN��:)8����y^��7У���,�=�9ECixS��8_Dڇ�6���Ļ,w��Ė\o�Aݭe�eb���w��:�ä��IK��	�|���V���� z}*����G��絾�1;�2*�w(MQ�-h���H���}

��r�e��Q�y��K�����6��۪��v�p�絬
��6h �5����F�4�2Dk=��)q�S���/��PN�\r���!���?��i�w�\3      6   ^   x���1cQ�������e+V��:�sd���:)�bP7rRL�֓=n�;�R��w%ѻO��c��0�w�ٍ�Y����l�OE�w.      %      x�}ҿN�0��}�����韔��@be�hOt�Vʕ���:ѳ#5���''��!t@����	�y�x��i�~�?�6��-�S���`� ��ڀ5���D��![@��"�!#`-�7d��%yCb���e"+fW%�$�I�YR]�������Ժj���v���T(�c�qHw��̤2���m7��ʳt��.�������byZ֠�����<<�d�彑de�v��5����TV�My��,ö<Q�a<���¨?D�?k͵�2�~����p���Žnӥ�|����e6�      /   -   x�3�4�2bcN. m�i�e��9M�bF@1c��W� |�f      5   -   x�3�4�2bcNc. m
�̀�9�	��!�%�oh $b���� ���      #   �  x�m�ˎ�@E�寨�a�y/�J$gb�'�l�P-7�Ս��ߧL�a�ZPu�-(����td�2ZS5(�ca̹��  �^���}m:��UV]E��N6�^��S]���[פ���[y����Kk��R�� ���\�RY��s�k~P�}��l�fLb2��BI��yY���o�e][rw�D�ᇱ�v���*6;<���:뤆��KČ&�4ᨉ��40���!�}K���Zux�Yɾ�j�6y��q���;���Ȏa�k���_yZ�J��;������tO�xD%�P���c
\���15r+�t�&w�eUq�y|��@���JH ʼl.�d�%�-�W��m(�Gꉹ�M��tl����1��_��oMOx4|�<��KΥA<�&X6�rX���o4=ݰP�H��M-���5;�e���SZ�L�̋�C>���P�fn����f�	~�����j�^�|������?y�����k      2   /   x��I   �����(��:H���'�Ų(7���r� ������      7   G   x�M���@D�3Ta����Z��$�o/Gc�n����!����ݒ`�B���-�o�R���o         	  x��Z�o���L���� mx��H+9ന<�ƴ		9x����&)���3��g�&��{?\�R�}��9�9n���c��Fq��0B����J��5SG�v7ԑg9�"Z��g}\
���pl4Ս�6D�`����XG�[�]����7��}ьZ��8�#㸙g��7X9>2#}jj��:�XQ��v�x�Ļ̣(&^dȂ��Y�M ��b�)}+y�|����Y����v³�t5�+��D���up�58t���p�Y��s`�*��.�V�����NLB��	�����g�|�����d�����{��p����% *��A�0�����H`�yH��uT��UE�mt��Y��+ޡ� T<�(d���	��B����7OMC[����'�>�<&�)	s^��J~{v}�j	�l4���,A^t<
��Y�S�����[����Q፱�Y(7���"��L�8;iz���ޘ�P�������L���� ��'�.f�������/�����X�dE����l(������]�X�-q1���e�=9><�\F/U��`4 PW�Uԛ~C_t�� @����#8w�2��c(�j�B9$u2��� �(��t=(t���P��+���5��h��p��
^�y�|N���!��f��B��6Qr���z3?��WS,�b�"�_ł�]���&8�V�+ߨ�J�.�<�J6���G�
Zt7�n��>He�u^�)���K[u���ڵ����Q����J���!9������dnv+_1ޠ���нF1j6��F����[�>0��%HЦ�6Շz�D��N֑1���Fw�Q;G�o����)��%��ĚЧ�$?��I��p(t��h��1���b���#�^"ʃ� �����8	i�a��$��:�Ƥ�Q�0��B�h��M�q����Q�
b�M=�	.���cs���)
ё��B���b�x����Ș|p��0 (����`��t������YK45i�/�&�/��Y��Ci�I#Aq����ܻE*�R�&��h��M�	Gu�͆&�����rk�#@U�V�*�1���\3��J��^`�
sbc.h��h��U�FC�sbj��r�|��1���z~t*��0��AW��J������fF&S�^��X��;Ou�!�$N�n�bӣ�_��)���E��件����t�] 0�t�,ya���.�n��X���M����K��_��b�d��`O��ZU"}���C��αA��(� �P�9�EEU'Id���M (t�&~\#R�Y\K����^j'����	�#���Ԝ͌vK�����4F�mI��p9I��t��,�Vc���
^�,���~l�Y���'&φC(������p��[�\큊$��H抉�sP1��0�U?�г�]ZB�z���=���O7 ���x�C�SD�aw�l=�� t,���m�ق��b������i��+��̼e�뒾B�,�)��|@%\W47�빤����$c_9��u�Iu$��K�M����O����&Y�>�e�L�d��J6�)u!-���)I-Y�v�>v1���0L�Ny��Ir2y��)"�lҰ�l;�Q�.1C$C�0���ų]�u
�]Н��u��(u��"̏�e�]u�ً��&ظG�[m-Cg;��L��X���Jբ$|��O�{��H&n����ޞ� ᐿʑ�H=�v쿑���8��~5��s˂s�R8E�s��s�����<u����%����B�?�?s����`�ו���W��4��.�<y�8�k!�@���B�)*�YS�b�^�B���OsCB`I�u����CQNer	u<k�+�r�9�ne�͖��LD�Ullf�;�F�y؏�f��p$�)�)�-8�9�S���������adyH5�}��C��<6rh���\��<3���QGkg�vw(Ĕ��W�������5������ݧK{�ֵ��?1�`��:��.����r�tW���|GHn�
�{�����Wu�J�����f#�7�"p�����E��N��	�7�0�b'zv��Չ�(&��p��"*���~��ow�Z�ɛ�������u�
9�"�I��a]:W{���(��b]7�$�3Tx��KbH�9�Д��]�J��d�nu
m~6��2�R�o2�y��~�}]�U�ޫ�a <����h!�2i�tT0s���όB���.�l�JYK_N��0�q8�ϕ���G�8ކ��z)3��%�P�v�]rof�G�B�~���	�$�OYTɑ�ʹ=�lp��$�K�=�<;;�7�t�      ,   �  x�M��R1�ϣ��P[�ߖ��P�S��%Y��J.�6���~ֆ���QO������t2��

Fwc���]��?�mA:�u�y�J������n�"�l%L��I7mVo���]�jT=�C\�-ƭ��z���|e�,����_l�q���
�o]G$Z�?�m���uɡ�	<_�J6���+-�s����x�����]p�=
:h�W�L�\�lP��l���tƷ^[�yǛFk�Zbݡ
����G��,��>��E�9�ߋ��K��5�s��o��������/.Z,�6��{"4C��t���%�D����V1���y�XJ<6����C�ī����6����C��ҵ`,l�x��b��8.�F      4      x��=�0���_��Q�ߎ,�:��p�G�\I.B��>�S�c�`I���=5%E��z��v]Y�I8�H-���q5�b+N��5�Lݢ�2.T��W��YM��5>�ՎZ����ba������(�     
PGDMP  3                    |            optativo    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16424    optativo    DATABASE     |   CREATE DATABASE optativo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE optativo;
                postgres    false            �            1259    16435    cliente    TABLE     �  CREATE TABLE public.cliente (
    id integer NOT NULL,
    id_banco integer,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    documento character varying(20) NOT NULL,
    direccion character varying(255) NOT NULL,
    mail character varying(255) NOT NULL,
    celular character varying(15) NOT NULL,
    estado character varying(50) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16434    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    218                       0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    217            �            1259    16444    factura    TABLE     �  CREATE TABLE public.factura (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    id_sucursal integer NOT NULL,
    nro_factura character varying(20) NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    total numeric(15,2) NOT NULL,
    total_iva5 numeric(15,2) NOT NULL,
    total_iva10 numeric(15,2) NOT NULL,
    total_iva numeric(15,2) NOT NULL,
    total_letras character varying(255) NOT NULL
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    16443    factura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.factura_id_seq;
       public          postgres    false    220                       0    0    factura_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.factura_id_seq OWNED BY public.factura.id;
          public          postgres    false    219            �            1259    16426    sucursal    TABLE     7  CREATE TABLE public.sucursal (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(15),
    whatsapp character varying(15),
    mail character varying(255) NOT NULL,
    estado character varying(50) NOT NULL
);
    DROP TABLE public.sucursal;
       public         heap    postgres    false            �            1259    16425    sucursal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sucursal_id_seq;
       public          postgres    false    216                       0    0    sucursal_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sucursal_id_seq OWNED BY public.sucursal.id;
          public          postgres    false    215            [           2604    16438 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            \           2604    16447 
   factura id    DEFAULT     h   ALTER TABLE ONLY public.factura ALTER COLUMN id SET DEFAULT nextval('public.factura_id_seq'::regclass);
 9   ALTER TABLE public.factura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            Z           2604    16429    sucursal id    DEFAULT     j   ALTER TABLE ONLY public.sucursal ALTER COLUMN id SET DEFAULT nextval('public.sucursal_id_seq'::regclass);
 :   ALTER TABLE public.sucursal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16435    cliente 
   TABLE DATA           n   COPY public.cliente (id, id_banco, nombre, apellido, documento, direccion, mail, celular, estado) FROM stdin;
    public          postgres    false    218   �"       �          0    16444    factura 
   TABLE DATA           �   COPY public.factura (id, id_cliente, id_sucursal, nro_factura, fecha_hora, total, total_iva5, total_iva10, total_iva, total_letras) FROM stdin;
    public          postgres    false    220   1#       �          0    16426    sucursal 
   TABLE DATA           `   COPY public.sucursal (id, descripcion, direccion, telefono, whatsapp, mail, estado) FROM stdin;
    public          postgres    false    216   �#                  0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 5, true);
          public          postgres    false    217                       0    0    factura_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.factura_id_seq', 6, true);
          public          postgres    false    219                       0    0    sucursal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sucursal_id_seq', 7, true);
          public          postgres    false    215            `           2606    16442    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    218            c           2606    16449    factura factura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    220            ^           2606    16433    sucursal sucursal_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sucursal DROP CONSTRAINT sucursal_pkey;
       public            postgres    false    216            a           1259    16460    idx_cliente_id_banco    INDEX     L   CREATE INDEX idx_cliente_id_banco ON public.cliente USING btree (id_banco);
 (   DROP INDEX public.idx_cliente_id_banco;
       public            postgres    false    218            d           1259    16461    idx_factura_id_cliente    INDEX     P   CREATE INDEX idx_factura_id_cliente ON public.factura USING btree (id_cliente);
 *   DROP INDEX public.idx_factura_id_cliente;
       public            postgres    false    220            e           1259    16462    idx_factura_id_sucursal    INDEX     R   CREATE INDEX idx_factura_id_sucursal ON public.factura USING btree (id_sucursal);
 +   DROP INDEX public.idx_factura_id_sucursal;
       public            postgres    false    220            f           2606    16450    factura factura_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);
 I   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_cliente_fkey;
       public          postgres    false    4704    218    220            g           2606    16455     factura factura_id_sucursal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursal(id);
 J   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_sucursal_fkey;
       public          postgres    false    220    216    4702            �   h   x�3�4��*M��H-J��4426153���R
Ή99�
A��9�Y@5z 5�Y��9�z������f�&�F����%�e�\F�6И��P�@Sj���� �Vv      �   �   x����	�0ϫ*Ԁ��%��t�K9�LH�\����1�a�%�y*�!10�&���.̋�\݋3�!fC0̈@x�A���m�����:c�o;>�����d_�F�����r"�Q��{!� VH�      �   k   x�3�.M.-*N�Q0�442VpN��IUpK�)N�ML��-,8,-��LM��9��R�Rsr����s9�K2�򹌨l�1��3��y�T6ό��Sټ=... �^��     
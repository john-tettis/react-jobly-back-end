PGDMP     9                	    y           jobly    13.2    13.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    34501    jobly    DATABASE     i   CREATE DATABASE jobly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE jobly;
                postgres    false            �            1259    34542    applications    TABLE     o   CREATE TABLE public.applications (
    username character varying(25) NOT NULL,
    job_id integer NOT NULL
);
     DROP TABLE public.applications;
       public         heap    postgres    false            �            1259    34502 	   companies    TABLE     U  CREATE TABLE public.companies (
    handle character varying(25) NOT NULL,
    name text NOT NULL,
    num_employees integer,
    description text NOT NULL,
    logo_url text,
    CONSTRAINT companies_handle_check CHECK (((handle)::text = lower((handle)::text))),
    CONSTRAINT companies_num_employees_check CHECK ((num_employees >= 0))
);
    DROP TABLE public.companies;
       public         heap    postgres    false            �            1259    34526    jobs    TABLE       CREATE TABLE public.jobs (
    id integer NOT NULL,
    title text NOT NULL,
    salary integer,
    equity numeric,
    company_handle character varying(25) NOT NULL,
    CONSTRAINT jobs_equity_check CHECK ((equity <= 1.0)),
    CONSTRAINT jobs_salary_check CHECK ((salary >= 0))
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    34524    jobs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    203            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    202            �            1259    34514    users    TABLE     5  CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_check CHECK (("position"(email, '@'::text) > 1))
);
    DROP TABLE public.users;
       public         heap    postgres    false            5           2604    34529    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    34542    applications 
   TABLE DATA           8   COPY public.applications (username, job_id) FROM stdin;
    public          postgres    false    204   $       �          0    34502 	   companies 
   TABLE DATA           W   COPY public.companies (handle, name, num_employees, description, logo_url) FROM stdin;
    public          postgres    false    200   Y       �          0    34526    jobs 
   TABLE DATA           I   COPY public.jobs (id, title, salary, equity, company_handle) FROM stdin;
    public          postgres    false    203   �)       �          0    34514    users 
   TABLE DATA           [   COPY public.users (username, password, first_name, last_name, email, is_admin) FROM stdin;
    public          postgres    false    201   �7       �           0    0    jobs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.jobs_id_seq', 200, true);
          public          postgres    false    202            A           2606    34546    applications applications_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (username, job_id);
 H   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
       public            postgres    false    204    204            9           2606    34513    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            postgres    false    200            ;           2606    34511    companies companies_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (handle);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            postgres    false    200            ?           2606    34536    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    203            =           2606    34523    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            D           2606    34552 %   applications applications_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_job_id_fkey;
       public          postgres    false    203    204    2879            C           2606    34547 '   applications applications_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_username_fkey;
       public          postgres    false    201    204    2877            B           2606    34537    jobs jobs_company_handle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_company_handle_fkey FOREIGN KEY (company_handle) REFERENCES public.companies(handle) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_company_handle_fkey;
       public          postgres    false    203    2875    200            �   %   x�����3�420����͠C3C(�Ԁ+F��� �\
m      �     x�mY�V�8|v�>�����ȭ�g�v8sN��l�-�%�$SS��������a$�e�2###�K=�0�u��1�8������hQ\��ʖC�T0�ڨl��7���w��J����;㝙?j�Cg�1�`L4�U^�QߍQ�U�A���'���l�Ii\RV�kmڨ�k�W���;ކ����j��]e�le���6�v���*�4�l�N�7W���ҷ�Z�J�>F�����T���y���>��żw��^�U�����K�g�S{eJ�|gK�W+e]�s�8T0�ݨF��F�����V����:��j1�Ǚ�Z��+x�֕����b�Z���h�s�d�N�N�?���['G������~E�#�����1O����w�F�&$�����s�p�J�3��F�qU#��x0�^L:���&$8˛���b�	�|��֕��8Q�0Y�>}��7�t��_;ذ4zHv5 ^e�}�z��2�յ��*X�5ڊk7�u�q�cR�`l�� � f&�b恘�|贛5:��Mq�g7y�㮸�W�e��U����d�|��{�����I��p���Z�J�=X$�0��[�Y�M53o�!h^�����8,@��Ǯ��h��\�y��oF�"1��F�ؙʖ�k��W<u֕b���:_1g�iDg��,X������2]����->��Ԩ�8��f	,��kc~�Ȟl����m�cY3C�!'�.��i]��"?ۇ+=������5��6s��^}/��o6�����Ź:�����M�;��+� 1��ۚ-�����z �ð�����:.gGǇ��� ��]G��A�:�X����b�¸���CDt@U$aD�p���kxaJ]%��莹�.M�K8zK��h�L��Q+���u�e��6?Z£�Yz�?v�XR}#u!z5q��`��F�G��͚��Q��`���@j�%�#�V`ԓ��"�p_��L�/����ȅ#P�=��j ��[3�i%��{�يg )��ޣ^awG�������.;ݼ?;@�U���9��qNbH�yc)!�kp���iW|��K��D��u^�\��S�p[���P�fK|v&dY�g����e],|�����X)�Z'՛�2ɝi��܋G�hg?��4р���{�|�d�U���mR�w�����KK�Ԡ�-����M��L�j�(���L�m7�3��\T<}iM���3I����ګ��j%�G0R3k۲x�H}�~Q��.e�Iѓ�l�ggp�
Ԍ�F���AdE��C�Z0lq����`���}7Qy�l��×(-��$���8�W!U)�� ��s���Si�l�d>e�7���@�T<�lG�9Hp��P���K�]���'��fN�,�n���b�S����G���������N9�����V����4H>U�P��c�/1�f�)��4�3g���*"�P�W��1�M[,�� Ô��y���b��NS�2~l%�ޏ ��gE��i�ʜ��w��L/���Q��5��bV�f��t(�Ҋ>EU@]����ҷ�I���PT��⸸r�o:����;�C��GV8P �Y�����U���k|o�'����M�P��g�Lx�H2��pQ<KA	^4/
XaA^��R�>I�,g��Y�Z>����าѦeX8������Fޒ;"=H�XM�(cy����q�?|�l�>�+�e
&����L�!�0���S��Se�jefK%�WA�*]n������w	l�v��x�6�&&�:~���@:��V&�J�hXl�uM�5]��2K�A�W|CmS|���Ow���ܠH4Sq ���O גV�&Y,���Zh:�V��7�Rs�*̬G�o9R�����nq����W3a��j(}�U�,���z�?G�z���x�\� ��z�[=[�_�\q&��i�j��.�^��M�� ���F�N��ts��"#A�:�";��K[��l�X4�~:@X���\�3qX�BV����&Aw��z�t9�9u�e�w�Ց�eq��M�b䆓�^q��F��`���Ծ}�0آ�6����! � řP�v8�Fq�8�O������d>��Yi�4��Om����e;&�/�ٲ��֒v���~3��~4#�^S*9f�� ���<RcƼ��� �P�*i�f�H�q��;=���4�7�����;[�Ѩ!�Ao��W��}�U N�5%~B@i�|���e������2	Y#����%�Ԁ`6�Nq&�6p�8�������
M��k����ȋ#M|�GЯo�E[<�F,g�'�s�;�I�v�g�'�b"���9��^&#��Ǟʛ,�N.��ڮx�<}�g��ǒ��Z� lBMKN4���v V�I�j�*qc�g�:�! ��6UhA9T�1<��-.X�&){c`�R�X�N$:��˞u�8xi���֚�����f5����fw��*[13�b]�m�-�2�cmS��v���i-��~��7y(���������Hp[z׎���
.5m)����ޢ����@yύ$,�V�!�R��]���Q�����l�iG]���#���t��a'p/��ٖ"���P��k-����1w�T�rK#��CS"�JKI��22�X�E?N/��@�&77[���`���O2����s�_�-/���� E��� �X��M�fk�R����G����sذ����z���+���O�v��?�!?5ȕ��Ɍ0̈,xv�\iD'[z��H�*忸g"���Eq�+��
>ߏ��N�*�+f��
�E��>���{����\q�p>)��o3�O��s�Z���W-	�!;J��}���7g/`�Ȟ�m7W����*�s�5��&�Z-�Ml��ְ<l �6F7���-/��t��.Y�;�-wr�K��{oe�8:*.�&j�����dhbP�]���ه�	���P��n���d-E��f��m�,��X�
$?9���Á�Ṱ��0�n�G��dc*]�����7��������SC�	��� [�-�F�X�-��-��<O��Nњ���`>5��{'��t�^�a"��	9P4C\����4���e����X(��E��w�߲<�ߡ�� �nƉ4KG�'E�ԓ��!�����'F=Q���!cV�T�JBȔ����u+�Fw�d"7�Z�q-k���[}>�;9A�(1���%m��Ԝز�M���� �u��Q&�\���Ʌ:��c��#��ҧ��g�\~��~ȿL]S��oG]WZ����|���˗/��tB      �   i  x��ZM��8]˿�ݤ�B�e�Nw���y���7��A�I��H����H �~���LW�@ҽ�s�Ŕ�m�Ņu�x�zє]/8�����G�X'��-إ�;���ZQ��l�=ʜ�{���*�.�J��������奬�ˆc}<-������^��v!y�D58gB:g�	��h\|���/�b��.��ɹ�V�#I2�=2�p�����j�Ͻ��A�pߗU�3��b�KٺG�by.����`�.!_x~jʜU�^�'�F��YS�܈
%�n�
�>�Ru�N��S8e#;�׼��`ͷ�	���*<|m�e���v�Q���4��q��|�*�5/J朅Z]�z�?�[��]�A��n�����k�U)O�s�>^<����@SJ���#�����k��S#���LI����|G�(���V����K'�JO�`:�/T��C�[ٰ&/�3N��3M���P��z��SD>�%B�_�n��2'�t�C+;�_ �;��yޟu��Weg<Gh�h���`Î&������tjB��
�4%�j���͂�9�Ќ|�?4ܑ��$�p(��\Y��i�{�K��8Z
.�#��!O����T��([�a(��q�Kd]��ɜ�iO�*����o¦X=�=vBu�;_�y��F��t�ҾbPu�����;�5��p�b"�Ís�S�#v*���};.�0�6&P�(&.�ς˱�.8�?��+˿��BtŇ���4�85M�lT����)���''Cz/�c{AT�O��W i̤"����7L�D�������OLt��#��Y|��:�	��?xA�x�4��# Ȏ��.��Wֱ=�`����6��I�M�BzA'�.>�f ���#3�sI��C�k$���'�~h�	��w���lt(��\E��b" ��6�m�Y���`<��7'�a�-b�:�۾Qk�h�>DWJč&��P' ��眆]�Y¨7�����W\(�v> ����$���ܩd�X��?�TE�x�s�q葿z!�:6���/	����S_�OxFhH M�/��WG�dZ������۫�~_���_��i8�fԁFX�:Pp��*���� ���iQՆQ_:���<r��0Z�%9�U0 LB)�ʺ���6�Opy����S����X�c2�+,N�E�6���0�֬N�D�o���9����7nß �]�Y"��j�3�7�<�(DJUlD�ÿ�����/��M?���M*�rTjՍ�E�H��2I��Fyá��q'Á�VP[�N��O�F�bb�~MD~�������`|�V��|���T~���<:J����Ke�f�ys^��H%�.�&qYȭ8��i*1�qˉQ���1�3�.�#=�|	��ح�8=;�1��ԱYl�`P����Ǜ;��Q�1it���L��x��D��'�C���qp����[L�=��#�Q |g�Af���8&o��9-�]3�,a��� p7�WBvq�«�����ɵ��S���Hc�n�=���'�2�żjC։G��ndjvd?��:p��p,� �ҕP��|�nE\3�(NOdt[܉O�VmwBe?t�{WV| ��_y`qrM�I@>�E�{X�1��.^kNA����1��r��K�?�+�Hd�	��t�Ȣ顔n�<��'�fJ�j��I^������K�;��f��aZw�+��')y�AĬ5fi�s<,Y[�$��<��.���{����a�䊙R�ubr�>d%��{Ϊ�$�n�A�g�@�ٕ��n
|0@W([�+�6Q������R�~�?��4��7P�s!]��,|��#@NvOm[T�b�jh��F�=� Ō����ߦ*�"b�4m1K��T�a��o�H�	0��&�4�%Q�qq����4#�K��l_�B�����D�gi�D42WFW���L�<ޣl�m�j�pW��[��|��k�!�PA�����>�~ٞ�P�T|e<��R?X��,$����T�^(i�Vk�M�d�[��Y8���!��"�&O8�C>q�ѣWZ/��g�j0$�k-<�{��{ʑ�7U31�cY�n�Q���t��a�n3z�Fo���6/G53�A��TAC�=�� �o.�6��=m�azs�E!0�Ō�@��.�zb�*��S/�7�����	jac�V~�f�i��^��!O�x:&B_ ��9�D�x�ڛQ/�i�e�<��?e4Ț6y8ճ��ϴ#����h. Q�xϚIU��4��pQJ�	�uė���V f�lԄ�4�P�����%��kB�>���E��P�����c��oQ������JiJ�b���#���:O�"�}��(����d,R>��O��?J�L\`�����y�T۾ǖ���"��~|r�t�?�� rΚy�:.Uݙ́-�Ns<'��ځF�7�d�:�OQ�[`Mg�֔m�PpL�J��4���8���Q5j;���;�;v8�3z�/^��-;Q�=���֯&�~tc>n��;~|���P$!�-���{͈���&��
t��+�xXf�~�hֽ���w��HOc͕A�������#΋qh���9�� jF�ky�_���(�=Ht����&ٵ��?~M`��� �	n��C!��ռ8��hP�;|6���Wr�}fb��m�_ķ���/��#���Q>�i�҃]��4H��PV�å,x�4�J��4��o���v�}@z��!� �G� ӷ!JѲ��O���-FS����]�P �ĪNC�|�ǾR�ࠦY)���$#��(UC;�>�<�D4$�)��t�F��ڒs�V�X�G)���(�e�|
�%�[K,��G/�76���5	~�+�v��&mH�P�J��͛��^%-[_96�@,*�������D�՘#2x��;�hD-�w��²�w�H�&��9��]�'{��5�H��k�Q~�����A���/e�L9A\�m��-Z���� q>�o`��s�_ՁRT�M�����z陓+XG�a�IRt��V�h��jUwjT86P��ذ��l	4F��m�
��1�a���s'�)%��&�R�� ���
����d&�o�-t����` -�����<	�sk7o{�|��o����n-+�����Vl>�Ƕ��ۘ�*6�.�3Yu��茬4X��4^Y	փ��є����B!i��0�������-bPF����/w*������I�55�ͣ#'��1y�W�?�'�Zcrŗ	���4�b�Adf���W��Mb�����tB�0&��}g�K�G���8��yI�0���_y y��4�,x<1=����;���� ��$�'���A$7��4�o|u��~t���i��!�0�.6!@��n<S�A�o��n�,��:p0�;ކ���f��+ci���8�R:ſs��rkV�ܖ�ٚR-�Z
�3�[�"D�x+�������/n�l��j��i�G���jO���\��*t~V���zԵhχm\w�����R�#<����6�(n~����'?����^3��0֕���gdEΤ�-؋����?o������;}
�΀ ��(%ۗڌ6�+;��m��s��=��y1]~1�+>CR���u[��_��f��l��j���G�z�      �   �  x���Ms�@���/��3�#�"	1�@���� �2����U�xڃ��tuWw=O�����Qn&�3I�-�7m�iW�M@��&~<�JN��\?�f���R�˭�L�Z=p�L���Q�t)�HY�	EO��g�=,I�������O���Y���s�	�����\d�����&Kް�;��|�#���l"償��L��]�}��}	�����0�u��W�`G��+��Y,�c[It/��T��1�4N�t4�r���f��kM߼�N���e׻o�C`����Q����u%ߌ ��kFF�Ʃ:'��ط�<�oκ���o1��Ɍ 4��ztB>pẂH�jU���#�Qu;���wU-����;�n*S#ٯ(Y���@T�e( ˩zw��v��e?Ys��qZn�%Wd���$<������     
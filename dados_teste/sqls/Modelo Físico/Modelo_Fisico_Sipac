CREATE SEQUENCE public.core_estado_id_seq;

CREATE TABLE public.core_estado (
                id INTEGER DEFAULT nextval('core_estado_id_seq'::regclass) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                codigo INTEGER NOT NULL,
                CONSTRAINT core_estado_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.core_estado_id_seq OWNED BY public.core_estado.id;

CREATE SEQUENCE public.core_mesoregiao_id_seq;

CREATE TABLE public.core_mesoregiao (
                id INTEGER DEFAULT nextval('core_mesoregiao_id_seq'::regclass) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                codigo INTEGER NOT NULL,
                estado_id INTEGER NOT NULL,
                CONSTRAINT core_mesoregiao_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.core_mesoregiao_id_seq OWNED BY public.core_mesoregiao.id;

CREATE INDEX core_mesoregiao_2c189993
 ON public.core_mesoregiao USING BTREE
 ( estado_id );

CREATE SEQUENCE public.core_microregiao_id_seq;

CREATE TABLE public.core_microregiao (
                id INTEGER DEFAULT nextval('core_microregiao_id_seq'::regclass) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                codigo INTEGER NOT NULL,
                mesoregiao_id INTEGER NOT NULL,
                CONSTRAINT core_microregiao_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.core_microregiao_id_seq OWNED BY public.core_microregiao.id;

CREATE INDEX core_microregiao_55e329a2
 ON public.core_microregiao USING BTREE
 ( mesoregiao_id );

CREATE SEQUENCE public.core_municipio_id_seq;

CREATE TABLE public.core_municipio (
                id INTEGER DEFAULT nextval('core_municipio_id_seq'::regclass) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                codigo INTEGER NOT NULL,
                codigo_completo BIGINT NOT NULL,
                estado_id INTEGER NOT NULL,
                microregiao_id INTEGER NOT NULL,
                CONSTRAINT core_municipio_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.core_municipio_id_seq OWNED BY public.core_municipio.id;

CREATE INDEX core_municipio_2c189993
 ON public.core_municipio USING BTREE
 ( estado_id );

CREATE INDEX core_municipio_376ba068
 ON public.core_municipio USING BTREE
 ( microregiao_id );

CREATE SEQUENCE public.agricultura_grupo_id_seq;

CREATE TABLE public.agricultura_grupo (
                id INTEGER DEFAULT nextval('agricultura_grupo_id_seq'::regclass) NOT NULL,
                nome_grupo VARCHAR(25) NOT NULL,
                grupo_id INTEGER NOT NULL,
                CONSTRAINT agricultura_grupo_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.agricultura_grupo_id_seq OWNED BY public.agricultura_grupo.id;

CREATE INDEX agricultura_grupo_acaeb2d6
 ON public.agricultura_grupo USING BTREE
 ( grupo_id );

CREATE SEQUENCE public.agricultura_produto_id_seq;

CREATE TABLE public.agricultura_produto (
                id INTEGER DEFAULT nextval('agricultura_produto_id_seq'::regclass) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                codigo VARCHAR(20) NOT NULL,
                grupo_id INTEGER NOT NULL,
                CONSTRAINT agricultura_produto_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.agricultura_produto_id_seq OWNED BY public.agricultura_produto.id;

CREATE INDEX agricultura_produto_acaeb2d6
 ON public.agricultura_produto USING BTREE
 ( grupo_id );

CREATE SEQUENCE public.agricultura_producao_id_seq;

CREATE TABLE public.agricultura_producao (
                id INTEGER DEFAULT nextval('agricultura_producao_id_seq'::regclass) NOT NULL,
                ano INTEGER NOT NULL,
                mes INTEGER NOT NULL,
                area_plantada INTEGER,
                producao INTEGER,
                area_colhida INTEGER,
                area_em_formacao INTEGER,
                irrigado VARCHAR(2),
                municipio_id INTEGER NOT NULL,
                produto_id INTEGER NOT NULL,
                preco DOUBLE PRECISION,
                valido BOOLEAN,
                CONSTRAINT agricultura_producao_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.agricultura_producao_id_seq OWNED BY public.agricultura_producao.id;

CREATE INDEX agricultura_producao_40924980
 ON public.agricultura_producao USING BTREE
 ( municipio_id );

CREATE INDEX agricultura_producao_b306f3fc
 ON public.agricultura_producao USING BTREE
 ( produto_id );

CREATE SEQUENCE public.agricultura_fonte_id_seq;

CREATE TABLE public.agricultura_fonte (
                id INTEGER DEFAULT nextval('agricultura_fonte_id_seq'::regclass) NOT NULL,
                codigo INTEGER NOT NULL,
                nome VARCHAR(20) NOT NULL,
                CONSTRAINT agricultura_fonte_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.agricultura_fonte_id_seq OWNED BY public.agricultura_fonte.id;

CREATE SEQUENCE public.agricultura_producao_fonte_id_seq;

CREATE TABLE public.agricultura_producao_fonte (
                id INTEGER DEFAULT nextval('agricultura_producao_fonte_id_seq'::regclass) NOT NULL,
                producao_id INTEGER NOT NULL,
                fonte_id INTEGER NOT NULL,
                CONSTRAINT agricultura_producao_fonte_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.agricultura_producao_fonte_id_seq OWNED BY public.agricultura_producao_fonte.id;

CREATE UNIQUE INDEX agricultura_producao_fonte_producao_id_093783bf_uniq
 ON public.agricultura_producao_fonte USING BTREE
 ( producao_id, fonte_id );

CREATE INDEX agricultura_producao_fonte_2085042c
 ON public.agricultura_producao_fonte USING BTREE
 ( fonte_id );

CREATE INDEX agricultura_producao_fonte_ada5b4c1
 ON public.agricultura_producao_fonte USING BTREE
 ( producao_id );

ALTER TABLE public.core_mesoregiao ADD CONSTRAINT core_mesoregiao_estado_id_de43b177_fk_core_estado_id
FOREIGN KEY (estado_id)
REFERENCES public.core_estado (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.core_municipio ADD CONSTRAINT core_municipio_estado_id_8d07bbda_fk_core_estado_id
FOREIGN KEY (estado_id)
REFERENCES public.core_estado (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.core_microregiao ADD CONSTRAINT core_microregiao_mesoregiao_id_d1550f1e_fk_core_mesoregiao_id
FOREIGN KEY (mesoregiao_id)
REFERENCES public.core_mesoregiao (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.core_municipio ADD CONSTRAINT core_municipio_microregiao_id_d4c9f769_fk_core_microregiao_id
FOREIGN KEY (microregiao_id)
REFERENCES public.core_microregiao (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.agricultura_producao ADD CONSTRAINT agricultura_producao_municipio_id_c466d0f0_fk_core_municipio_id
FOREIGN KEY (municipio_id)
REFERENCES public.core_municipio (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.agricultura_grupo ADD CONSTRAINT agricultura_grupo_grupo_id_aada6938_fk_agricultura_grupo_id
FOREIGN KEY (grupo_id)
REFERENCES public.agricultura_grupo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.agricultura_produto ADD CONSTRAINT agricultura_produto_grupo_id_fd86f496_fk_agricultura_grupo_id
FOREIGN KEY (grupo_id)
REFERENCES public.agricultura_grupo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.agricultura_producao ADD CONSTRAINT agricultura_produ_produto_id_60948ef5_fk_agricultura_produto_id
FOREIGN KEY (produto_id)
REFERENCES public.agricultura_produto (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.agricultura_producao_fonte ADD CONSTRAINT agricultura_pro_producao_id_e479db36_fk_agricultura_producao_id
FOREIGN KEY (producao_id)
REFERENCES public.agricultura_producao (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE public.agricultura_producao_fonte ADD CONSTRAINT agricultura_producao__fonte_id_181ee909_fk_agricultura_fonte_id
FOREIGN KEY (fonte_id)
REFERENCES public.agricultura_fonte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY DEFERRED;

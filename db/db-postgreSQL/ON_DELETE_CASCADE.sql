CREATE TABLE public.table_a (
    id_a varchar NOT NULL,
    id_b varchar NOT NULL,
    id_c INT NOT NULL,
    id_d varchar NOT NULL,
    created_ts timestamp DEFAULT now() NOT NULL,
    CONSTRAINT table_a_pkey PRIMARY KEY (id_a, id_b, id_c, id_d)
        CONSTRAINT fk_table_b FOREIGN KEY (id_a, id_b, id_d)
        REFERENCES public.table_b (id_a, id_b, id_d)
        ON DELETE CASCADE,
    CONSTRAINT fk_table_c FOREIGN KEY (id_a, id_b, id_c)
        REFERENCES public.table_c (id_a, id_b, id_c)
        ON DELETE CASCADE
);
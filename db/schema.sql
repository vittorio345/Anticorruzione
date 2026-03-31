CREATE TABLE enti (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  provincia TEXT,
  codice_istat TEXT UNIQUE
);

CREATE TABLE appalti (
  id SERIAL PRIMARY KEY,
  ente_id INTEGER REFERENCES enti(id),
  anno INT,
  affidamento_diretto BOOLEAN,
  importo NUMERIC,
  contratto_id TEXT
);

CREATE TABLE fornitori (
  id SERIAL PRIMARY KEY,
  appalto_id INTEGER REFERENCES appalti(id),
  nome TEXT,
  importo NUMERIC
);

CREATE TABLE analisi_ente (
  ente_id INTEGER REFERENCES enti(id),
  anno INT,
  totale_appalti NUMERIC,
  num_contratti INT,
  percent_affidamenti NUMERIC,
  hhi NUMERIC,
  frazionamento NUMERIC,
  risk_score INT,
  report_ai TEXT
);

CREATE INDEX idx_appalti_ente ON appalti(ente_id);
CREATE INDEX idx_fornitori_appalto ON fornitori(appalto_id);
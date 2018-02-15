.mode columns
.headers on
.nullvalue NULL
.width 25 25 25 25 25 25 25

PRAGMA FOREIGN_KEY = ON;

DROP TABLE IF EXISTS fornecedorfarmacia;
DROP TABLE IF EXISTS medicamentofarmacia;
DROP TABLE IF EXISTS farmaceuticofarmacia;
DROP TABLE IF EXISTS medicohospital;
DROP TABLE IF EXISTS receitafarmacia;
DROP TABLE IF EXISTS receitamedicamento;


DROP TABLE IF EXISTS farmacia;
DROP TABLE IF EXISTS receita;
DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS fornecedor;
DROP TABLE IF EXISTS medicamento;
DROP TABLE IF EXISTS hospital;
DROP TABLE IF EXISTS farmaceutico;
DROP TABLE IF EXISTS medico;
DROP TABLE IF EXISTS paciente;



CREATE TABLE paciente (
    pacienteid INTEGER PRIMARY KEY  ,
    nome VARCHAR(100) NOT NULL UNIQUE,
    datanasc DATE,
    sexo CHAR,
    contacto INTEGER NOT NULL,
    nif INTEGER UNIQUE,
    numutente INTEGER UNIQUE,
        CONSTRAINT sex_char CHECK(sexo = 'M' OR sexo = 'F')
);

CREATE TABLE medico (
    medicoid INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    datanasc DATE,
    sexo CHAR,
    contacto INTEGER NOT NULL,
    nif INTEGER UNIQUE,
    numcedula INTEGER,
    especialidade VARCHAR(50),
    CONSTRAINT sex_char CHECK(sexo = 'M' OR sexo = 'F')
);

CREATE TABLE farmaceutico (
    farmaceuticoid INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    datanasc DATE,
    sexo CHAR,
    contacto INTEGER NOT NULL,
    nif INTEGER UNIQUE,
    numidentificacao INTEGER UNIQUE,
        CONSTRAINT sex_char CHECK(sexo = 'M' OR sexo = 'F')
);

CREATE TABLE hospital (
    hospitalid INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    morada VARCHAR(200),
    contacto INTEGER NOT NULL
);

CREATE TABLE medicamento (
    medicamentoid INTEGER PRIMARY KEY,
    nomemedicamento VARCHAR (100) NOT NULL,
    preco NUMERIC NOT NULL
);

CREATE TABLE fornecedor (
    fornecedorid INTEGER PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    morada VARCHAR (200) NOT NULL,
    contacto INTEGER NOT NULL
);

CREATE TABLE consulta (
    consultaid INTEGER PRIMARY KEY,
    dataconsulta DATETIME NOT NULL,
    diagnostico VARCHAR(1000),
    pacienteid INTEGER NOT NULL,
    medicoid INTEGER NOT NULL,
    hospitalid INTEGER NOT NULL,
    CONSTRAINT "FK_Consulta_Paciente"
    FOREIGN KEY (pacienteid) REFERENCES paciente(pacienteid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "FK_Consulta_Medico"
    FOREIGN KEY (medicoid) REFERENCES medico(medicoid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "FK_Consulta_Hospital"
    FOREIGN KEY (hospitalid) REFERENCES hospital(hospitalid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE receita (
    receitaid INTEGER PRIMARY KEY,
    posologia VARCHAR(200),
    consultaid INTEGER NOT NULL,
    CONSTRAINT "FK_Receita_Consulta"
    FOREIGN KEY (consultaid) REFERENCES consulta(consultaid) ON DELETE SET NULL ON UPDATE CASCADE
    
);

CREATE TABLE farmacia (
    farmaciaid INTEGER PRIMARY KEY ,
    nome VARCHAR(100) NOT NULL,
    morada VARCHAR(200),
    contacto INTEGER NOT NULL,
    hospitalid INTEGER NOT NULL,
    CONSTRAINT "FK_Farmacia_Hospital"
    FOREIGN KEY (hospitalid) REFERENCES hospital(hospitalid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE receitamedicamento (
    receitaid INTEGER NOT NULL,
    medicamentoid INTEGER NOT NULL,
    quantidade INTEGER NOT NULL DEFAULT 0 ,
    PRIMARY KEY (receitaid, medicamentoid),
    CONSTRAINT "Receita"
    FOREIGN KEY (receitaid) REFERENCES receita(receitaid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "medicamento"
    FOREIGN KEY (medicamentoid) REFERENCES medicamento(medicamentoid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE receitafarmacia (
    receitaid INTEGER NOT NULL,
    farmaciaid INTEGER NOT NULL,
    PRIMARY KEY (receitaid, farmaciaid),
    CONSTRAINT "Receita"
    FOREIGN KEY (receitaid) REFERENCES receita(receitaid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "Farmacia"
    FOREIGN KEY (farmaciaid) REFERENCES farmacia(farmaciaid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE medicohospital (
    medicoid INTEGER NOT NULL,
    hospitalid INTEGER NOT NULL,
    PRIMARY KEY (medicoid, hospitalid),
    CONSTRAINT "Medico"
    FOREIGN KEY (medicoid) REFERENCES medico (medicoid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "Hospital"
    FOREIGN KEY (hospitalid) REFERENCES hospital (hospitalid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE farmaceuticofarmacia (
    farmaceuticoid INTEGER NOT NULL,
    farmaciaid INTEGER NOT NULL,
    proprietario BOOLEAN,
    PRIMARY KEY (farmaceuticoid, farmaciaid),
    CONSTRAINT "Farmaceutico"
    FOREIGN KEY (farmaceuticoid) REFERENCES famaceutico (farmaceuticoid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "Farmacia"
    FOREIGN KEY (farmaciaid) REFERENCES farmacia (farmaciaid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE medicamentofarmacia (
    medicamentoid INTEGER NOT NULL,
    farmaciaid INTEGER NOT NULL,
    quantidade INTEGER NOT NULL DEFAULT 0 ,
    PRIMARY KEY (medicamentoid, farmaciaid),
    CONSTRAINT "Medicamento"
    FOREIGN KEY (medicamentoid) REFERENCES medicamento (medicamentoid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "Farmacia"
    FOREIGN KEY (farmaciaid) REFERENCES farmacia(farmaciaid) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE fornecedorfarmacia (
    fornecedorid INTEGER NOT NULL,
    farmaciaid INTEGER NOT NULL,
    PRIMARY KEY (fornecedorid, farmaciaid),
    CONSTRAINT "Fornecedor"
    FOREIGN KEY (fornecedorid) REFERENCES fornecedor (fornecedorid) ON DELETE SET NULL ON UPDATE CASCADE
    CONSTRAINT "Farmacia"
    FOREIGN KEY (farmaciaid) REFERENCES farmacia (farmaciaid) ON DELETE SET NULL ON UPDATE CASCADE
);

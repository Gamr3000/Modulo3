CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('cliente', 'suporte'))
);

CREATE TABLE Chamado (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    data_abertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'aberto',
    id_usuario INT REFERENCES Usuario(id)
);

CREATE TABLE Resposta (
    id SERIAL PRIMARY KEY,
    id_chamado INT REFERENCES Chamado(id),
    mensagem TEXT NOT NULL,
    data_resposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    respondido_por INT REFERENCES Usuario(id)
);

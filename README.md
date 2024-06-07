# Passo a Passo para Executar o Projeto

## Primeiro, clone o repositório:
```bash
git clone https://github.com/AlbertoRP11/GS-DEVOPS.git
```

## Depois vamos mudar para o diretório onde o projeto foi clonado:
```bash
cd <diretorio_do_projeto>
```

## Agora vamos mudar para a branch onde está o projeto completo:
```bash
git checkout controllers --
```

## Feito isso, podemos subir o docker (após ter aberto o Docker Desktop em seu computador):
```bash
docker-compose up --build -d
```

## Agora, vamos executar o container do banco de dados:
```bash
docker exec -it <nome_ou_id_do_container_db> bash
```

## Entrando no banco:
```bash
mysql -u admin -p
```

## Após isso, ele pedirá a senha de acesso, basta digitar a senha abaixo e apertar enter:
```bash
admin
```

## Vamos selecionar o banco que iremos usar:
```bash
USE mydb;
```

## Criamos a tabela:
```bash
CREATE TABLE TABELA_USUARIO (ID INT AUTO_INCREMENT PRIMARY KEY, NOME VARCHAR(255), EMAIL VARCHAR(255), SENHA VARCHAR(255));
```

## Usamos o comando abaixo para visualizá-la:
```bash
SHOW TABLES;
```

## Fazemos então a inserção de dados:
```bash
INSERT INTO TABELA_USUARIO (NOME, EMAIL, SENHA) VALUES ('Alberto', 'alberto@email.com', 'senha123');
```

## Mostramos os dados, comprovando a persistência:
```bash
SELECT * FROM TABELA_USUARIO;
```

## Agora é só dar o comando abaixo duas vezes, para sairmos do banco e do bash:
```bash
exit
```

## Depois podemos encerrar:
```bash
docker-compose down
```

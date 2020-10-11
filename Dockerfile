# Imagem de contêiner que executa seu código
FROM node:12.19.0-alpine

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

# Copia o arquivo de código do repositório de ação para o caminho do sistema de arquivos `/` do contêiner
COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add curl

RUN chmod +x entrypoint.sh

# Arquivo de código a ser executado quando o contêiner do docker é iniciado (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
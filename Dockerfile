# Pegando a imagem do SDK do .NET 8.0 como ponto de partida
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Definindo um diretório de trabalho dentro do container
WORKDIR /app

# Copiando o arquivo csproj e restaurando as dependências
COPY *.csproj ./
RUN dotnet restore

# Copiando todo o código-fonte para o diretório de trabalho
COPY . .

# Compilando o projeto
RUN dotnet publish -c Release -o out

# Usando a imagem do runtime do .NET 8.0 para o container final
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Copiando os arquivos compilados para o diretório de trabalho
COPY --from=build /app/out .

# Configurando ambiente
ENV ASPNETCORE_URLS=http://+:5000

# Usuário sem privilégios administrativos
RUN useradd -ms /bin/bash appuser
USER appuser

# Iniciando o aplicativo em segundo plano
CMD ["dotnet", "PURE.dll"]

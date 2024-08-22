# Etapa 1: Construção da aplicação
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copie os arquivos de projeto e restaure as dependências
COPY *.csproj ./
RUN dotnet restore

# Copie o restante dos arquivos e compile a aplicação
COPY . ./
RUN dotnet build -c Release -o /app/build

# Publique a aplicação
RUN dotnet publish -c Release -o /app/publish

# Etapa 2: Configuração da imagem final
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Copie a aplicação publicada da etapa de construção
COPY --from=build /app/publish .

# Exponha a porta na qual a aplicação vai rodar
EXPOSE 8080

# Comando para iniciar a aplicação
ENTRYPOINT ["dotnet", "WebApi.Api.dll"]

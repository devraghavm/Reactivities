FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY Reactivities.sln ./
COPY Domain/*.csproj ./Domain/
COPY Persistence/*.csproj ./Persistence/
COPY Application/*.csproj ./Application/
COPY API/*.csproj ./API/

RUN dotnet restore
COPY . .
WORKDIR /src/Domain
RUN dotnet build -c Release -o /app

WORKDIR /src/Persistence
RUN dotnet build -c Release -o /app

WORKDIR /src/Application
RUN dotnet build -c Release -o /app

WORKDIR /src/API
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "API.dll"]
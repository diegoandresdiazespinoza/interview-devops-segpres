FROM mcr.microsoft.com/dotnet/core/aspnet:2.2.8 AS base

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build

RUN apt update && apt upgrade -y

COPY . "/home/backendv2"
WORKDIR "/home/backendv2"
RUN dotnet build --configuration Debug
RUN dotnet build --configuration Release
ENTRYPOINT ["dotnet", "run", "--project", "/home/backendv2/src/Conduit/Conduit.csproj"]

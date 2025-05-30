# Build stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src


COPY TemplateMethodDemo/*.csproj TemplateMethodDemo/
COPY TemplateMethodDemo.Tests/*.csproj TemplateMethodDemo.Tests/


RUN dotnet restore TemplateMethodDemo/TemplateMethodDemo.csproj
RUN dotnet restore TemplateMethodDemo.Tests/TemplateMethodDemo.Tests.csproj


COPY TemplateMethodDemo/ TemplateMethodDemo/
COPY TemplateMethodDemo.Tests/ TemplateMethodDemo.Tests/


RUN dotnet build TemplateMethodDemo/TemplateMethodDemo.csproj -c Release


RUN dotnet publish TemplateMethodDemo/TemplateMethodDemo.csproj -c Release -o /app/publish

# Test stage
FROM build AS test

WORKDIR /src/TemplateMethodDemo.Tests


CMD ["dotnet", "test", "--no-build", "--logger:trx"]

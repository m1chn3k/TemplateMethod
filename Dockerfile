
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /src

COPY TemplateMethodDemo/*.csproj TemplateMethodDemo/
COPY TemplateMethodDemo.Tests/*.csproj TemplateMethodDemo.Tests/

RUN dotnet restore TemplateMethodDemo/TemplateMethodDemo.csproj
RUN dotnet restore TemplateMethodDemo.Tests/TemplateMethodDemo.Tests.csproj

COPY TemplateMethodDemo/ TemplateMethodDemo/
COPY TemplateMethodDemo.Tests/ TemplateMethodDemo.Tests/

RUN dotnet build TemplateMethodDemo/TemplateMethodDemo.csproj -c Release
RUN dotnet publish TemplateMethodDemo/TemplateMethodDemo.csproj -c Release -o /app/publish


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS test

WORKDIR /src/TemplateMethodDemo.Tests

COPY --from=build /src/TemplateMethodDemo.Tests ./TemplateMethodDemo.Tests

CMD ["dotnet", "test", "--no-build", "--logger:trx"]

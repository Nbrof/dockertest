# Dockerfile
# This grabs an image to copy over our source code and build
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
# copies over our project and install all dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
# Publishes our final project to /out
COPY . .
RUN dotnet publish -c Release -o out

# Build runtime image
# We will copy our compiled code into this container for running it
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-env /app/out .

# Run the app on container startup
# Use your project name for the second parameter
# e.g. MyProject.dll
# ENTRYPOINT [ "dotnet", "firstapi.dll" ]
CMD ASPNETCORE_URLS=http://*:$PORT dotnet firstapi.dll
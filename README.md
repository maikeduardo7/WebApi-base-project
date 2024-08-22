# WebAPI Base Project

This is a base project for building WebAPI applications using .NET Core 8, EF Core 8, and other essential technologies. The project follows a modular architecture with a clear separation of concerns.

## Project Structure

### Solution Structure

The solution is divided into three main projects:

- **WebApi.Api**: The main API project containing controllers, DTOs, AutoMapper configurations, and other API-related components.
- **WebApi.Business**: This project contains business logic, including interfaces, services, and utilities.
- **WebApi.Data**: This project is responsible for data access, including repository implementations and EF Core DbContext configurations.

### Technologies Used

- **.NET Core 8**: The framework used to build the WebAPI.
- **Entity Framework Core 8**: For database access and ORM.
- **AutoMapper**: For object mapping.
- **FluentValidation**: For validating models.

### Dockerfile

The `Dockerfile` is used to create a Docker image for the WebAPI project. It configures the build and runtime environment for the application. The main steps are:

1. **Base Image**: Uses the `mcr.microsoft.com/dotnet/aspnet:8.0` image as the base image for runtime and `mcr.microsoft.com/dotnet/sdk:8.0` for building the application.
2. **Working Directory**: Sets the working directory inside the container.
3. **Restore Dependencies**: Copies the solution file and restores the project dependencies.
4. **Build Application**: Builds the application and publishes the output to the `/app` directory.
5. **Expose Ports**: Configures the container to expose the necessary ports (e.g., `80` for HTTP).
6. **Start Application**: Sets the entry point to run the application inside the container.

To build and run the Docker container, use the following commands:

```bash
docker build -t webapi-base-project .
docker run -d -p 80:80 webapi-base-project
```

# Directory Structure Scripts

### `setup-webapi.ps1` (for Windows)

This PowerShell script is used to create the project directory structure automatically in a Windows environment. The script performs the following steps:

1. **Create Folders**: Creates the necessary folders for controllers, services, models, repositories, and other components.
2. **Install NuGet Packages**: Installs the required NuGet packages for EF Core, AutoMapper, and FluentValidation.
3. **Generate Template Files**: Creates template files for controllers, services, and models.

To run the script, use the following command in PowerShell:

```powershell
.\setup-structure.ps1
```

### `setup-webapi.sh` (for Linux)

This shell script performs the same functions as the PowerShell script but is designed for a Linux environment. It automatically creates the project directory structure, installs dependencies, and generates template files.

## Running the Script

To run the script, use the following command in the Linux terminal:

```bash
./setup-structure.sh
```

# Getting Started

## Prerequisites

- **.NET SDK 8.0**: Make sure you have the .NET SDK installed.
- **Docker**: If you want to run the application in a Docker container, you need to have Docker installed.

## Running the Application

1. **Build the Solution**: Run `dotnet build` to build the solution.
2. **Apply Migrations**: Run `dotnet ef database update` to apply migrations and create the database.
3. **Run the Application**: Run `dotnet run` to start the application.

## Testing the Application

You can test the API using tools like Postman or by using `.http` files directly within Visual Studio. The API documentation is available via Swagger at [http://localhost:5000/swagger](http://localhost:5000/swagger).



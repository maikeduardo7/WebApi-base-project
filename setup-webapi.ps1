# Nome do projeto
$projectName = "WebApi"

Write-Host "Criando projeto "$projectName"..."

# Caminhos dos projetos
$apiProjectPath = "$projectName.Api"
$businessProjectPath = "$projectName.Business"
$dataProjectPath = "$projectName.Data"

# Criação da solução
dotnet new sln -n $projectName

# Criação dos projetos
dotnet new webapi -n $apiProjectPath
dotnet new classlib -n $businessProjectPath
dotnet new classlib -n $dataProjectPath

Write-Host "Criando estrutura de pastas..."
# Estrutura de pastas
$folders = @(
    "$apiProjectPath/Controllers",
    "$apiProjectPath/AutoMapper",
    "$apiProjectPath/Dto",
    "$businessProjectPath/Interfaces",
    "$businessProjectPath/Interfaces/Services",
    "$businessProjectPath/Interfaces/Repositories",
    "$businessProjectPath/Models",
    "$businessProjectPath/Services",
    "$businessProjectPath/Utils",
    "$dataProjectPath/Repositories"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder
}

Write-Host "Adicionando pacotes NuGet..."
# Adicionando os pacotes NuGet
dotnet add $apiProjectPath package AutoMapper.Extensions.Microsoft.DependencyInjection
dotnet add $apiProjectPath package FluentValidation
dotnet add $apiProjectPath package Swashbuckle.AspNetCore

dotnet add $businessProjectPath package Microsoft.EntityFrameworkCore --version 8.0.0

dotnet add $dataProjectPath package Microsoft.EntityFrameworkCore --version 8.0.0

Write-Host "Referenciando os projetos..."
# Referenciando os projetos
dotnet add $apiProjectPath reference $businessProjectPath
dotnet add $apiProjectPath reference $dataProjectPath
dotnet add $businessProjectPath reference $dataProjectPath

Write-Host "Adicionando projetos à solução..."
# Adicionando projetos à solução
dotnet sln $projectName.sln add $apiProjectPath
dotnet sln $projectName.sln add $businessProjectPath
dotnet sln $projectName.sln add $dataProjectPath

Write-Host "Adicionando Controllers..."
# Adicionando Controllers
dotnet new apicontroller -n ClienteController -o "$apiProjectPath/Controllers"
dotnet new apicontroller -n PedidoController -o "$apiProjectPath/Controllers"
dotnet new apicontroller -n VendedorController -o "$apiProjectPath/Controllers"

Write-Host "Adicionando Dtos..."
# Adicionando Dto's
dotnet new class -n ClienteDto -o "$apiProjectPath/Dto"
dotnet new class -n PedidoDto -o "$apiProjectPath/Dto"
dotnet new class -n VendedorDto -o "$apiProjectPath/Dto"

Write-Host "Adicionando Interfaces de Services..."
# Adicionando Interfaces de Services
dotnet new interface -n IClienteService -o "$businessProjectPath/Interfaces/Services"
dotnet new interface -n IPedidoService -o "$businessProjectPath/Interfaces/Services"
dotnet new interface -n IVendedorService -o "$businessProjectPath/Interfaces/Services"

Write-Host "Adicionando Interfaces de Repositorios..."
# Adicionado Interfaces de Repositorios
dotnet new interface -n IClienteRepository -o "$businessProjectPath/Interfaces/Repositories"
dotnet new interface -n IPedidoRepository -o "$businessProjectPath/Interfaces/Repositories"
dotnet new interface -n IVendedorRepository -o "$businessProjectPath/Interfaces/Repositories"

Write-Host "Adicionando Models..."
# Adicionando Models
dotnet new class -n Cliente -o "$businessProjectPath/Models"
dotnet new class -n Pedido -o "$businessProjectPath/Models"
dotnet new class -n Vendedor -o "$businessProjectPath/Models"

Write-Host "Adicionando Services..."
# Adicionando Services
dotnet new class -n ClienteService -o "$businessProjectPath/Services"
dotnet new class -n PedidoService -o "$businessProjectPath/Services"
dotnet new class -n VendedorService -o "$businessProjectPath/Services"

Write-Host "Adicionando Repositorios..."
# Adicionando Repositorios
dotnet new class -n ClienteRepository -o "$dataProjectPath/Repositories"
dotnet new class -n PedidoRepository -o "$dataProjectPath/Repositories"
dotnet new class -n VendedorRepository -o "$dataProjectPath/Repositories"

Write-Host "Estrutura de projetos criada com sucesso!"

# 1. Используем официальный образ .NET SDK для сборки приложения
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /app

# Копируем файлы проекта и восстанавливаем зависимости
COPY *.csproj ./
RUN dotnet restore

# Копируем оставшиеся файлы и собираем приложение
COPY . ./
RUN dotnet publish -c Release -o out

# 2. Использовать легкий образ среды выполнения (Runtime) для запуска
FROM mcr.microsoft.com/dotnet/runtime:10.0
WORKDIR /app

# Копируем собранное приложение из предыдущего шага
COPY --from=build /app/out .

# Копируем файл базы данных в рабочую папку контейнера
COPY database.txt .

# Команда для запуска приложения при старте контейнера
ENTRYPOINT ["dotnet", "Shop.dll"]

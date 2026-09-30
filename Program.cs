using System;
using System.IO;
using System.Threading;

class Program
{
    private const string DbFile = "database.txt";

    static void Main(string[] args)
    {
        Console.WriteLine("--- Docker-магазин запущен и работает! ---");

        while (true)
        {
            Console.WriteLine($"\n[Лог {DateTime.Now:HH:mm:ss}] Проверка товаров в БД:");
            
            if (!File.Exists(DbFile))
            {
                Console.WriteLine($"Ошибка: Файл {DbFile} не найден!");
            }
            else
            {
                string[] lines = File.ReadAllLines(DbFile);
                foreach (string line in lines)
                {
                    Console.WriteLine($"  Товар: {line}");
                }
            }

            Thread.Sleep(5000);
        }
    }
}

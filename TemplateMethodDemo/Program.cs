using System;

namespace TemplateMethodDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Making tea...");
            Beverage tea = new Tea();
            tea.PrepareRecipe();

            Console.WriteLine("\nMaking coffee...");
            Beverage coffee = new Coffee();
            coffee.PrepareRecipe();
        }
    }
}

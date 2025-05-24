using System;
using System.IO;
using Xunit;
using TemplateMethodDemo;

namespace TemplateMethodDemo.Tests
{
    public class BeverageTests
    {
        [Fact]
        public void Tea_PrepareRecipe_ShouldFollowCorrectSteps()
        {
            // Arrange
            var output = new StringWriter();
            Console.SetOut(output);

            Beverage tea = new Tea();

            // Act
            tea.PrepareRecipe();

            // Assert
            var result = output.ToString().Trim().Split(Environment.NewLine);
            Assert.Equal("Boiling water", result[0]);
            Assert.Equal("Steeping the tea", result[1]);
            Assert.Equal("Pouring into cup", result[2]);
            Assert.Equal("Adding lemon", result[3]);
        }

        [Fact]
        public void Coffee_PrepareRecipe_ShouldFollowCorrectSteps()
        {
            // Arrange
            var output = new StringWriter();
            Console.SetOut(output);

            Beverage coffee = new Coffee();

            // Act
            coffee.PrepareRecipe();

            // Assert
            var result = output.ToString().Trim().Split(Environment.NewLine);
            Assert.Equal("Boiling water", result[0]);
            Assert.Equal("Dripping coffee through filter", result[1]);
            Assert.Equal("Pouring into cup", result[2]);
            Assert.Equal("Adding sugar and milk", result[3]);
        }
    }
}

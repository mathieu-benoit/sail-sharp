using Xunit;

namespace unittests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            //Arrange
            var expectedResult = 4;

            //Act
            var result = Add(2, 3);

            //Assert
            Assert.Equal(expectedResult, result);
        }

        int Add(int x, int y)
        {
            return x + y;
        }
    }
}

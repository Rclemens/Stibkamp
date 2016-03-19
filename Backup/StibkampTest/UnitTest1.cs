using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using form.Data;
using form.entities;
using StibkampTest.Controllers;
using StibkampTest.Mocks;
using System.Data.Linq;
using System.Data.Common;

namespace StibkampTest
{
    /// <summary>
    /// Summary description for UnitTest1
    /// </summary>
    [TestClass]
    public class UnitTest1
    {
        public UnitTest1()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [Ignore]
        public void TestMethod1()
        {
            //
            // TODO: Add test logic	here
            //

        }

        [TestMethod]
        [ExpectedException(typeof(InvalidOperationException))]
        public void If_Name_is_empty_When_contact_is_saved_Then_throwContactUncompleteError()
        {
            /*
            var controller = new CustomerController(); 
            controller.DataContext = new MockDataContextWrapper(new StibContactMockDatabase());
            var results = controller.GetCustomersWithFirstName("Raymond");
            */
            
            // Arrange  
            // Act  

            // Assert  
        }

        public class CreateStibContact
        {


            internal StibContact Create()
            {
                StibContact stibContact = new StibContact();

                stibContact.ID = Guid.NewGuid();
                stibContact.Kamptype = String.Empty;
                stibContact.Voornaam = String.Empty;
                stibContact.Tussenvoegsel = String.Empty;
                stibContact.Achternaam = String.Empty;
                stibContact.Vraag = String.Empty;

                return stibContact;
            }


        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StibkampTest.Wrappers;

namespace StibkampTest.Mocks
{
    public class MockDataContextWrapper : IDataContextWrapper
    {
        private readonly MockDatabase _mockDatabase;

        public MockDataContextWrapper(MockDatabase database)
        {
            _mockDatabase = database;
        }

        #region IDataContextWrapper Members

        public List<T> Table<T>() where T : class
        {
            return (List<T>)_mockDatabase.Tables[typeof(T)];
        }

        public void DeleteAllOnSubmit<T>(IEnumerable<T> entities) where T : class
        {
            foreach (var entity in entities)
            {
                Table<T>().Remove(entity);
            }
        }

        public void DeleteOnSubmit<T>(T entity) where T : class
        {
            Table<T>().Remove(entity);
        }

        public void InsertOnSubmit<T>(T entity) where T : class
        {
            Table<T>().Add(entity);
        }

        public void SubmitChanges()
        {
        }

        public void Dispose()
        {
        }

        #endregion
    }
}

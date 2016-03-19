using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;

namespace StibkampTest.Wrappers
{
    public class DataContextWrapper<T> : IDataContextWrapper where T : DataContext, new()
    {
        private readonly T db;
        private bool _disposed;
        public DataContextWrapper()
        {
            var t = typeof(T);
            db = (T)Activator.CreateInstance(t);
        }

        public DataContextWrapper(string connectionString)
        {
            var t = typeof(T);
            db = (T)Activator.CreateInstance(t, connectionString);
        }

        #region IDataContextWrapper Members
        /// <summary>       
        ///  /// Tables this instance.        
        /// /// </summary>        
        /// /// <typeparam name="TableName"></typeparam>        
        /// /// <returns></returns>        

        public List<TableName> Table<TableName>() where TableName : class
        {
            var table = (Table<TableName>)db.GetTable(typeof(TableName));
            return table.ToList();
        }

        public void DeleteAllOnSubmit<Entity>(IEnumerable<Entity> entities) where Entity : class
        {
            db.GetTable(typeof(Entity)).DeleteAllOnSubmit(entities);
        }

        public void DeleteOnSubmit<Entity>(Entity entity) where Entity : class
        {
            db.GetTable(typeof(Entity)).DeleteOnSubmit(entity);
        }

        public void InsertOnSubmit<Entity>(Entity entity) where Entity : class
        {
            db.GetTable(typeof(Entity)).InsertOnSubmit(entity);
        }

        public void SubmitChanges()
        {
            db.SubmitChanges();
        }
        #endregion         

        #region IDisposable Members

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}

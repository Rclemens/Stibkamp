using System;
using System.Collections.Generic;
using System.Collections;

namespace StibkampTest.Mocks
{
    public abstract class MockDatabase
    {
        protected MockDatabase()
        {
            InitializeDataBase();
        }

        public Dictionary<Type, IList> Tables { get; set; }

        private void InitializeDataBase()
        {
            Tables = new Dictionary<Type, IList>();
            CreateTables();
            PopulateTables();
        }

        protected abstract void CreateTables();
        protected abstract void PopulateTables();

        protected void AddTable<T>()
        {
            var table = new List<T>();
            Tables.Add(typeof(T), table);
        }

        protected List<T> GetTable<T>()
        {
            return (List<T>)Tables[typeof(T)];
        }
    }
}

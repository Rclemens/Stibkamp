using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Text;
using StibkampTest.Wrappers;
using System.Linq.Expressions;
using form.entities;


namespace StibkampTest.DataContext
{
    public class MyDataContext : ExtensibleDataContext
    {

        static MappingSource mapping = new AttributeMappingSource();
        private Table<StibContact> Stibtable;
        public MyDataContext(): base("", mapping)
        {

        }
        
        public Table<Customer> Customers
        {
            get { return this.GetTable<Customer>(); }
        }

        protected internal override IExecuteResult ExecuteImpl(Expression query)
        {
            //this.Log.WriteLine("executing query: {0}", query);
            return new ExecuteResult(new Customer[] { });
        }

    }



    public class Customer
    {
        [Column(IsPrimaryKey = true)]
        public string CustomerId;

        [Column]
        public string ContactName;
    }



    class Program
    {
        static void Main(string[] args)
        {
            MyDataContext dc = new MyDataContext();
            var query = from c in dc.Customers where c.CustomerId == "X" select c;
            var list = query.ToList();
        }
    }
}

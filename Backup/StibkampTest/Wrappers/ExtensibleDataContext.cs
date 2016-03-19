using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Reflection;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Activation;
using System.Runtime.Remoting.Proxies;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Remoting.Services;
using System.Data;
using System.Data.Common;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Data.Linq.Provider;

namespace StibkampTest.Wrappers
{

    public class ExtensibleDataContext : System.Data.Linq.DataContext
    {

        public Dictionary<Type, IList> Tables { get; set; }

        public ExtensibleDataContext(object connection, MappingSource mapping): base("", mapping)
        {
            FieldInfo providerField = typeof(System.Data.Linq.DataContext).GetField("provider", BindingFlags.Instance | BindingFlags.NonPublic);

            object proxy = new ProviderProxy(this).GetTransparentProxy();

            providerField.SetValue(this, proxy);

            this.Initialize(connection);
        }


        protected virtual void Initialize(object connection)
        {

        }


        private TextWriter LogImpl { get; set; }
        private DbConnection ConnectionImpl { get; set; }
        private DbTransaction TransactionImpl { get; set; }
        private int CommandTimeoutImpl { get; set; }

        protected internal virtual void ClearConnectionImpl()
        {

        }

        protected internal virtual void CreateDatabaseImpl()
        {

        }

        protected internal virtual void DeleteDatabaseImpl()
        {

        }

        protected internal virtual bool DatabaseExistsImpl()
        {
            return false;
        }

        protected internal virtual IExecuteResult ExecuteImpl(Expression query)
        {
            return new ExecuteResult(null);
        }

        protected class ExecuteResult : IExecuteResult
        {
            object value;

            public ExecuteResult(object value)
            {

                this.value = value;

            }



            public object GetParameterValue(int parameterIndex)
            {

                return null;

            }



            public object ReturnValue
            {

                get { return this.value; }

            }



            public void Dispose()
            {

                IDisposable d = this.value as IDisposable;

                if (d != null)

                    d.Dispose();

            }

        }



        protected internal virtual object CompileImpl(Expression query)
        {

            return null;

        }



        protected internal virtual IEnumerable TranslateImpl(Type elementType, DbDataReader reader)
        {

            return null;

        }



        protected internal virtual IMultipleResults TranslateImpl(DbDataReader reader)
        {

            return null;

        }



        protected internal virtual string GetQueryTextImpl(Expression query)
        {

            return null;

        }



        protected internal virtual DbCommand GetCommandImpl(Expression query)
        {

            return null;

        }



        public class ProviderProxy : RealProxy, IRemotingTypeInfo
        {

            ExtensibleDataContext dc;



            internal ProviderProxy(ExtensibleDataContext dc)

                : base(typeof(ContextBoundObject))
            {

                this.dc = dc;

            }



            public override IMessage Invoke(IMessage msg)
            {

                if (msg is IMethodCallMessage)
                {

                    IMethodCallMessage call = (IMethodCallMessage)msg;

                    if (call.MethodBase.DeclaringType.Name == "IProvider" && call.MethodBase.DeclaringType.IsInterface)
                    {

                        MethodInfo mi = typeof(ExtensibleDataContext).GetMethod(call.MethodBase.Name + "Impl", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.DeclaredOnly);

                        if (mi != null)
                        {

                            try
                            {

                                return new ReturnMessage(mi.Invoke(this.dc, call.Args), null, 0, null, call);

                            }

                            catch (TargetInvocationException e)
                            {

                                return new ReturnMessage(e.InnerException, call);

                            }

                        }

                    }

                }

                throw new NotImplementedException();

            }



            public bool CanCastTo(Type fromType, object o)
            {

                return true;

            }



            public string TypeName
            {

                get { return this.GetType().Name; }

                set { }

            }

        }

    }

}



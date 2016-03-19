using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace form.Helpers
{
    public class StibExceptions
    {

    }

    [Serializable()]
    public class InvalidContactInfoException : System.Exception
    {
        public InvalidContactInfoException() : base() { }
        public InvalidContactInfoException(string message) : base(message) { }
        public InvalidContactInfoException(string message, System.Exception inner) : base(message, inner) { }

        // Constructor needed for serialization 
        // when exception propagates from a remoting server to the client. 
        protected InvalidContactInfoException(System.Runtime.Serialization.SerializationInfo info,
            System.Runtime.Serialization.StreamingContext context) { }
    }

}

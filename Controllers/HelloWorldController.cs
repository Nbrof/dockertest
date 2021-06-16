using Microsoft.AspNetCore.Mvc;
using System.Text.Encodings.Web;
using System.Collections;

namespace firstapi.Controllers
{
    public class HelloWorldController : Controller
    {
        //
        // GET: /HelloWorld/

        public Hashtable Index()
        {
            // Returns a hashtable which will be serialized as json
            return new Hashtable(){{"Hello", "World"}};
        }

             // Since our route pattern includes a pattern called ID we can receive it as a parameter to our action
        public Hashtable Another(int id)
        {

            return new Hashtable(){{"Hello", id}};
        }

    }
}
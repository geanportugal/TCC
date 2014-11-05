using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace WebApplication1.Helpers
{
    public class JsonHelper
    {
        /// <summary>
        /// Deserialize json to custom object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="json"></param>
        /// <returns></returns>
        public static T FromJSON<T>(string json)
        {
            var jss = new JavaScriptSerializer();

            return jss.Deserialize<T>(json);
        }

        /// <summary>
        /// Serializes object to json
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="objectDto"></param>
        /// <returns></returns>
        public static string ToJSON<T>(T objectDto)
        {
            var jss = new JavaScriptSerializer();

            return jss.Serialize(objectDto);
        }
    }
}
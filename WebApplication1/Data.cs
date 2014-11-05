using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class Data
    {
        public double? Component1 = 0;
        public double? Component2 = 0;

        public Data(double? component1, double? component2)
        {
            Component1 = component1;
            Component2 = component2;
        }
    }   
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bitcoin.Data.Common
{
    public class RandomValue
    {
        public static string RandomStringToNumber()
        {
            Random random = new Random();
            string str = "";
            int i;
            for (i = 1;  i < 11 ; i++)
            {
                str += random.Next(1, 9).ToString();
            }
            return str;
        }
    }
}

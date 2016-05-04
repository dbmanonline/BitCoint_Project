using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RandomValue
/// </summary>
public class RandomValue
{
    public static string RandomNumberToString()
    {
        Random random = new Random();
        string str = "";
        int i;
        for (i = 1; i < 9; i++)
        {
            str += random.Next(1, 8).ToString();
        }
        return str;
    }
}
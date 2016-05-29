using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    public class PipCoinDAL
    {
        BitcoinEntities db = new BitcoinEntities();
        public int Insert(PipCoin pc)
        {
            db = new BitcoinEntities();
            db.PipCoins.Add(pc);
            return db.SaveChanges();
        }
        public List<PipCoin> GetByUserId(int UserId)
        {
            db = new BitcoinEntities();
            var lst = db.PipCoins.Include("Order").Where(p=>p.Order.UserID == UserId).ToList();
            return lst;
        }
    }
}

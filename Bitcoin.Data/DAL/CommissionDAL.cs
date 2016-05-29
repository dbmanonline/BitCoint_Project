using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    
    public class CommissionDAL
    {
        BitcoinEntities db = new BitcoinEntities();
        public int Insert(Commission c)
        {
            db = new BitcoinEntities();
            db.Commissions.Add(c);
            return db.SaveChanges();
        }
        public List<Commission> GetAllData()
        {
            db = new BitcoinEntities();
            return db.Commissions.ToList();
        }
        public List<Commission> GetByReceivedUserId(int UserId)
        {
            db = new BitcoinEntities();
            var _cms = db.Commissions.Where(c=> c.ToUserId == UserId).ToList();
            return _cms;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class CommissionBLL
    {
        CommissionDAL commissionDAL = new CommissionDAL();
        public int Insert(Commission c)
        {
            commissionDAL = new CommissionDAL();
            return commissionDAL.Insert(c);
        }
        public List<Commission> GetAllData()
        {
            commissionDAL = new CommissionDAL();
            return commissionDAL.GetAllData();
        }
        public List<Commission> GetByReceivedUserId(int UserId)
        {
            commissionDAL = new CommissionDAL();
            return commissionDAL.GetByReceivedUserId(UserId);
        }
    }
}

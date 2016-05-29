using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;
using Bitcoin.Data.DAL;

namespace Bitcoin.Data.BLL
{
    public class PipCoinBLL
    {
        PipCoinDAL pcDAL = new PipCoinDAL();
        public int Insert(PipCoin pc)
        {
            pcDAL = new PipCoinDAL();
            return pcDAL.Insert(pc);
        }
        public List<PipCoin> GetByUserId(int UserId)
        {
            pcDAL = new PipCoinDAL();
            return pcDAL.GetByUserId(UserId);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class BidDetailBLL
    {
        private readonly BidDetailDAL _bidDetailDal = new BidDetailDAL();

        public void InsertBidDetail(BidDetail bidDetail)
        {
            _bidDetailDal.InsertBidDetail(bidDetail);
        }

        public IEnumerable<BidDetail> GetAllBidDetails()
        {
            return _bidDetailDal.GetAllBidDetails();
        }

        public void UpdateBidDetail(BidDetail bidDetail)
        {
            _bidDetailDal.UpdateBidDetail(bidDetail);
        }

        public BidDetail GetBidDetailById(string grCode)
        {
            return _bidDetailDal.GetBidDetailById(grCode);
        }

        public BidDetail GetBidDetailByGPCode(string gpCode)
        {
            return _bidDetailDal.GetBidDetailByGPCode(gpCode);
        }
    }
}

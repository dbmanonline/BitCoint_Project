using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class UserBLL
    {
        public int InsertUser(User user)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.InsertUser(user);
        }
        public int UpdateFullName(User user)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.UpdateFullName(user);
        }
        public int UpdateUser(User user)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.UpdateUser(user);
        }
        public int UpdatePassword(User user)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.UpdatePassword(user);
        }
        public bool CheckSponsorIDExist(string SponsorID)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.CheckSponsorIDExist(SponsorID);
        }
        public User GetByEmailID(string EmailID)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.GetByEmailID(EmailID);
        }
        public User GetByUserID(int UserID)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.GetByUserID(UserID);
        } 
        public List<User> GetChildrenByEmailID(string EmailID)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.GetChildrenByEmailID(EmailID);
        }
        public IEnumerable<User> GetFullChildByEmailID(string EmailID)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.GetFullChildByEmailID(EmailID);
        }
        public void UpdateUserLevel(string EmailID)
        {
            UserDAL uDAL = new UserDAL();
            uDAL.UpdateUserLevel(EmailID);
        }
        public List<User> GetReferByEmailID(string EmailID)
        {
            UserDAL uDAL = new UserDAL();
            return uDAL.GetReferByEmailID(EmailID);
        }

        public bool Login(string Email, string Password)
        {
            UserDAL uDAL = new UserDAL();
            var user = uDAL.GetByEmailID(Email);
            if(user != null)
            {
                if (user.Password == Password)
                {
                    return true;
                }
                else
                    return false;
            }
            return false;
        }
    }
}

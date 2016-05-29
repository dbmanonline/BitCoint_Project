using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    public class UserDAL
    {
        public int InsertUser(User user)
        {
            int result = 9;
            if (CheckEmailIDExist(user.EmailID))
            {
                //Nếu tồn tại EmailID
                return result;
            }

            if (!CheckSponsorIDExist(user.SponsorID))
            {
                //Nếu người đỡ đầu không tồn tại
                result = 10;
                return result;
            }

            BitcoinEntities db = new BitcoinEntities();
            db.Users.Add(user);

            result = db.SaveChanges();
            return result;
        }

        public int UpdateFullName(User user)
        {
            BitcoinEntities db = new BitcoinEntities();
            var userUpdate = db.Users.Where(u => u.UserID == user.UserID).FirstOrDefault();
            userUpdate.FullName = user.FullName;
            return db.SaveChanges();
        }
        public int UpdateUser(User user)
        {
            BitcoinEntities db = new BitcoinEntities();
            var userUpdate = db.Users.Where(u => u.UserID == user.UserID).FirstOrDefault();
            userUpdate = user;
            return db.SaveChanges();
        }
        public int UpdatePassword(User user)
        {
            BitcoinEntities db = new BitcoinEntities();
            var userUpdate = db.Users.Where(u => u.UserID == user.UserID).FirstOrDefault();
            userUpdate.Password = user.Password;
            return db.SaveChanges();
        }

        public bool CheckEmailIDExist(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var query = db.Users.Where(q => q.EmailID == EmailID.ToLower().Trim());
            if (query.Count() > 0)
                return true;//Tồn tại
            else
                return false;//Không tồn tại
        }

        public bool CheckSponsorIDExist(string SponsorID)
        {
            if (SponsorID == "dbman.online@gmail.com")
                return true;

            BitcoinEntities db = new BitcoinEntities();
            var query = db.Users.Where(q => q.EmailID == SponsorID.ToLower().Trim());
            if (query.Count() > 0)
                return true;//Tồn tại
            else
                return false;//Không tồn tại
        }

        public User GetByEmailID(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var users = db.Users.Include("Level").Where(u => u.EmailID == EmailID.Trim()).FirstOrDefault();
            return users;
        }

        public User GetByUserID(int UserID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var users = db.Users.Include("Level").Where(u => u.UserID == UserID).FirstOrDefault();
            return users;
        }

        public List<User> GetChildrenByEmailID(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var userList = db.Users.Where(u => u.SponsorID == EmailID).ToList();
            List<User> lst = new List<User>();
            lst.AddRange(userList);
            foreach (var usr in userList)
            {
                lst.AddRange(GetChildrenByEmailID(usr.EmailID));
            }
            return lst;
        }
        public IEnumerable<User> GetFullChildByEmailID(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var query = db.Users.Include("Level").Where(u => u.SponsorID == EmailID).ToList();
            List<User> lst = new List<User>();
            lst.AddRange(query);
            foreach (var usr in query)
            {
                lst.AddRange(GetFullChildByEmailID(usr.EmailID));
            }
            return lst;
        }
        public User FindManagerByEmailID(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var users = db.Users.Where(u => u.EmailID == EmailID.Trim()).FirstOrDefault();
            if (!String.IsNullOrEmpty(users.EmailID) && users.EmailID != "dbman.online@gmail.com")
                users = FindManagerByEmailID(users.EmailID);
            return users;
        }
        public void UpdateUserLevel(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var userCurrent = db.Users.Where(u => u.EmailID == EmailID).FirstOrDefault();
            //Lấy thông tin người giới thiệu
            var sponsor = db.Users.Include("Level").Where(u => u.EmailID == userCurrent.SponsorID).FirstOrDefault();
            //Kiểm tra xem người giới thiệu đang ở cấp mấy và số người cần và đủ để lên cấp
            var countChildBySponsorID = db.Users.Where(u => u.SponsorID == sponsor.EmailID).Count();
            //Thăng thêm một cấp cho người giới thiệu nếu đủ điều kiện
            if (countChildBySponsorID >= sponsor.Level.PersonNumber)
            {
                sponsor.LevelID = sponsor.LevelID + 1;
                db.SaveChanges();
            }
        }
        public List<User> GetReferByEmailID(string EmailID)
        {
            BitcoinEntities db = new BitcoinEntities();
            var userList = db.Users.Where(u => u.SponsorID == EmailID).ToList();
            return userList;
        }
    }
}

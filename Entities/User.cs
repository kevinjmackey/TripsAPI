using System.Text.Json.Serialization;

namespace TripsAPI.Entities
{
    public class User
    {
        public int userID { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string middleInitial { get; set; }
        public string username { get; set; }
        [JsonIgnore]
        public string salt {get; set;}
        [JsonIgnore]
        public string hash { get; set; }
        public bool isActive { get; set; }
        public string question { get; set; }
        public string answer { get; set; }
        public string emailAddress { get; set; }
        public string employeeNumber { get; set; }

        public User()
        {
        }
    }
}
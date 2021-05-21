using TripsAPI.Entities;

namespace TripsAPI.Models
{
    public class AuthenticateResponse
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Token { get; set; }


        public AuthenticateResponse(User user, string token)
        {
            Id = user.userID;
            FirstName = user.firstName;
            LastName = user.lastName;
            Username = user.username;
            Token = token;
        }
    }
}
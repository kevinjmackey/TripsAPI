using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using Serilog;
using System.Text;
using TripsAPI.Entities;
using TripsAPI.Helpers;
using TripsAPI.Models;
using System.Security.Cryptography;

namespace TripsAPI.Services
{
    public interface IUserService
    {
        AuthenticateResponse Authenticate(AuthenticateRequest model);
        IEnumerable<User> GetAll();
        User GetById(int id);
    }

    public class UserService : IUserService
    {
        private readonly AppSettings _appSettings;

        public UserService(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }

        public AuthenticateResponse Authenticate(AuthenticateRequest model)
        {
            User user = GetByUsername(model.Username);

            // return null if user not found
            if (user == null) return null;

            //return null if user not authenticated
            if (Authenticate(user, model.Password) != true)
            {
                return null;
            }
            // authentication successful so generate jwt token
            var token = generateJwtToken(user);

            return new AuthenticateResponse(user, token);
        }

        public IEnumerable<User> GetAll()
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RCXBP].[Services].[GetUsers]";
                try
                {
                    return conn.Query<User>(procedure, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetAll Users failure");
                    return null;
                }
            }
        }

        public User GetById(int _id)
        {
            User user;
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RCXBP].[Services].[GetUserById]";
                var values = new { Id = _id };
                try
                {
                    user = conn.Query<User>(procedure, values, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                catch (Exception ex)
                {
                    Log.Error($"Caught exception: {ex.Message}");
                    user = null;
                }
                return user;
            }
        }
        private User GetByUsername(string _username)
        {
            User user;
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RCXBP].[Services].[GetUserByUsername]";
                var values = new { username = _username };
                try
                {
                    user = conn.Query<User>(procedure, values, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                catch (Exception ex)
                {
                    Log.Error($"Caught exception: {ex.Message}");
                    user = null;
                }
                return user;
            }
        }
        // helper methods
        /**
         * Method: authenticate
         * Description: Authenticates the username and password in the RCXBP database.
         * 
         *  connection - SQL connection to query against.
         *  username - Username of user to authenticate.
         *  password - Password of user to authenticate.
         */
        public bool Authenticate(User _user, string _password)
        {
            bool authenticated = false;
            string str = _user.salt + _appSettings.pepper + _password;
            SHA1 sha1 = new SHA1CryptoServiceProvider();
            ASCIIEncoding encoder = new ASCIIEncoding();
            byte[] input = encoder.GetBytes(str);
            byte[] hash = sha1.ComputeHash(input);
            string hashStr = "";
            for (int i = 0; i < hash.Length; i++)
                hashStr += hash[i].ToString("X2").ToLower();
            if (hashStr != _user.hash)
                return authenticated;
            return authenticated = true;
        }
        private string generateJwtToken(User user)
        {
            // generate token that is valid for 7 days
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] { new Claim("id", user.userID.ToString()) }),
                //Expires = DateTime.UtcNow.AddDays(7),
                Expires = DateTime.UtcNow.AddMinutes(5),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
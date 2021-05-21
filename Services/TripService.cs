using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Serilog;
using TripsAPI.Entities;
using TripsAPI.Helpers;

namespace TripsAPI.Services
{
    public interface ITripService
    {
        IEnumerable<Trip> GetAll();
        Trip GetById(int _id);
        IEnumerable<Trip> GetTripsActive();
        IEnumerable<Trip> GetTripsClosed();
        IEnumerable<Trip> GetByClientID(int _id);
        IEnumerable<Trip> GetByMasterClientID(int _id);
    }

    public class TripService : ITripService
    {
        private readonly AppSettings _appSettings;

        public TripService(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }
        public IEnumerable<Trip> GetAll()
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTrips]";
                try
                {
                    return conn.Query<Trip>(procedure, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetAll Trips failure");
                    return null;
                }
            }
        }
        public Trip GetById(int _id)
        {
            Trip trip;
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripById]";
                var values = new { Id = _id };
                try
                {
                    trip = conn.Query<Trip>(procedure, values, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetAll Trips failure");
                    trip = null;
                }
                return trip;
            }
        }
        public IEnumerable<Trip> GetTripsActive()
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripsActive]";
                try
                {
                    return conn.Query<Trip>(procedure, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetTripsActive failure");
                    return null;
                }
            }
        }
        public IEnumerable<Trip> GetTripsClosed()
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripsClosed]";
                try
                {
                    return conn.Query<Trip>(procedure, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetTripsClosed failure");
                    return null;
                }
            }
        }

        public IEnumerable<Trip> GetByClientID(int _id)
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripsByClientID]";
                var values = new { ClientID = _id };
                try
                {
                    return conn.Query<Trip>(procedure, values, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetTripsClientID failure");
                    return null;
                }
            }
        }
        public IEnumerable<Trip> GetByMasterClientID(int _id)
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripsByMasterClientID]";
                var values = new { MasterClientID = _id };
                try
                {
                    return conn.Query<Trip>(procedure, values, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetTripsMasterClientID failure");
                    return null;
                }
            }
        }
    }
}

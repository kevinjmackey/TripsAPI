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
    public interface ITripreviewService
    {
        IEnumerable<Tripreview> GetAll();
        Tripreview GetById(int _id);
        Tripreview GetByTripID(int _id);
    }

    public class TripreviewService : ITripreviewService
    {
        private readonly AppSettings _appSettings;

        public TripreviewService(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }
        public IEnumerable<Tripreview> GetAll()
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripreviews]";
                try
                {
                    return conn.Query<Tripreview>(procedure, commandType: CommandType.StoredProcedure).ToList();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetAll Tripreviews failure");
                    return null;
                }
            }
        }
        public Tripreview GetById(int _id)
        {
            Tripreview tripreview;
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripreviewById]";
                var values = new { Id = _id };
                try
                {
                    tripreview = conn.Query<Tripreview>(procedure, values, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetAll Tripreviews failure");
                    tripreview = null;
                }
                return tripreview;
            }
        }

        public Tripreview GetByTripID(int _id)
        {
            using (SqlConnection conn = new SqlConnection(_appSettings.DBRead))
            {
                var procedure = "[RailCrew].[Services].[GetTripreviewByTripID]";
                var values = new { TripID = _id };
                try
                {
                    return conn.Query<Tripreview>(procedure, values, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "GetTripreviewsTripID failure");
                    return null;
                }
            }
        }
    }
}

using System;
using System.Text.Json.Serialization;

namespace TripsAPI.Entities
{
    public class Trip
    {
        public int TripID { get; set; }
        public string Company { get; set; }
        public int MasterClientID { get; set; }
        public int ClientID { get; set; }
        public string TripNumber { get; set; }
        public string ControlNumber { get; set; }
        public int LocationID { get; set; }
        public int PickUpPointID { get; set; }
        public int DropOffPointID { get; set; }
        public DateTime PickupDateTime { get; set; }
        public Decimal Distance { get; set; }
        public int DriveTime { get; set; }
        public int TripType { get; set; }
        public Boolean ASAP { get; set; }
        public Boolean IsDYVPossible { get; set; }
        public int EstAssistHours { get; set; }
        public string LeadLocomotive { get; set; }
        public string RequesterName { get; set; }
        public string RequestorPhone { get; set; }
        public string Comments { get; set; }
        public string DispatcherNotes { get; set; }
        public int DriverID { get; set; }
        public int SubContractorID { get; set; }
        public Boolean IsAwaitingDispatch { get; set; }
        public Boolean IsWaitingResponse { get; set; }
        public Boolean IsTripClosed { get; set; }
        public int VehicleID { get; set; }
        public DateTime DriverDispatchTime { get; set; }
        public int TimeZoneID { get; set; }
        public string OverrideManager { get; set; }
        public DateTime CallDateTime { get; set; }
        public string TrainNumber { get; set; }
        public string GetNextDriverReason { get; set; }
        public int AuditUserID { get; set; }
        public DateTime AuditLastUpdate { get; set; }
        public DateTime CalledDriverDateTime { get; set; }
        public string GetNextVehicleReason { get; set; }
        public int DispatchedByUserID { get; set; }
        public DateTime DispatchedDateTime { get; set; }
        public Boolean IsAmended { get; set; }
        public string CancelReason { get; set; }
        public Boolean Cancelled { get; set; }
        public int CancelReasonID { get; set; }
        public Boolean IsMPV { get; set; }
        public DateTime OrigPickupDateTime { get; set; }
        public int DriverChangeReasonID { get; set; }
        public int VehicleChangeReasonID { get; set; }
        public Boolean HasBackhaul { get; set; }
        public int RecurringTripID { get; set; }
        public Decimal PickupAdHocLatitude { get; set; }
        public Decimal PickupAdHocLongitude { get; set; }
        public string PickupAdHocID { get; set; }
        public Decimal DropoffAdHocLatitude { get; set; }
        public Decimal DropoffAdHocLongitude { get; set; }
        public string DropoffAdHocID { get; set; }
        public int ParentTripID { get; set; }
        public string ShortKey { get; set; }

        public Trip()
        {

        }
    }
}
using System;
using System.Text.Json.Serialization;

namespace TripsAPI.Entities
{
    public class Tripreview
    {
        public int TripReviewID { get; set; }
        public int TripID { get; set; }
        public Boolean Approved { get; set; }
        public DateTime ApprovedDateTime { get; set; }
        public int ApprovedByUserID { get; set; }
        public Decimal TripMiles { get; set; }
        public Decimal TripWaitMinutes { get; set; }
        public int InvoiceID { get; set; }
        public int PayrollID { get; set; }
        public Decimal AssistMiles { get; set; }
        public Boolean IsCanceled { get; set; }
        public int CancelCode { get; set; }
        public Boolean IsDispatchApproved { get; set; }
        public Boolean Ignore { get; set; }
        public string FailReason { get; set; }
        public Boolean Repo { get; set; }
        public DateTime CreateDateTime { get; set; }
        public DateTime DispatchApprovedDateTime { get; set; }
        public DateTime FailReportIntervalDT { get; set; }
        public DateTime PendingReportIntervalDT { get; set; }
        public DateTime PendingReportIntervalFMDT { get; set; }
        public Boolean OverRide { get; set; }
        public string ApproveNotes { get; set; }
        public string ITNotes { get; set; }
        public Boolean ReviewToggle { get; set; }
        public Boolean AcceptedB2B { get; set; }
        public string B2BErrorMessage { get; set; }
        public int LitmusPassID { get; set; }
        public int LitmusRunCount { get; set; }
        public DateTime LitmusPassDT { get; set; }
        public DateTime LitmusFirstRunDT { get; set; }
        public string B2BMessageName { get; set; }
        public string DispatchApprovalReturnReason { get; set; }
        public string LateReason { get; set; }
        public string LitmusOverrideReason { get; set; }
        public DateTime DriverCalledDateTime { get; set; }
        public string DriverCalledByUser { get; set; }
        public int ForcedReviewCode { get; set; }
        public Boolean MPV { get; set; }
        public Boolean MPVLitmusHold { get; set; }
        public DateTime AcceptedB2BDateTime { get; set; }
        public Boolean OnTime { get; set; }
        public Boolean IgnoreForOTP { get; set; }
        public DateTime OTPLateTime { get; set; }
        public DateTime OTPArrivalTime { get; set; }
        public int AuditUserID { get; set; }
        public DateTime AuditLastUpdate { get; set; }
        public Boolean DriveCamSent { get; set; }
        public DateTime SheetReceivedDateTime { get; set; }
        public string SheetReceivedByUser { get; set; }
        public string ClosedBy { get; set; }
        public Boolean Mapped { get; set; }
        public int ReOpenedBy { get; set; }
        public DateTime ReOpenedDateTime { get; set; }
        public string ClientInfo { get; set; }
        public string BookerEmail { get; set; }
        public DateTime DriverETA { get; set; }
        public int SendInfoStatus { get; set; }
        public Boolean Verified { get; set; }

        public Tripreview()
        {

        }
    }
}
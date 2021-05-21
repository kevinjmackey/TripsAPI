
USE [RailCrew];
GO

IF OBJECT_ID('Services.GetTripreviews', 'P') IS NOT NULL
DROP PROCEDURE [Services].[GetTripreviews];
GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripreviews];
--GO

CREATE PROCEDURE [Services].[GetTripreviews]
AS
BEGIN
    SELECT
        [tripreviews].[TripReviewID],
        [tripreviews].[TripID],
        [tripreviews].[Approved],
        [tripreviews].[ApprovedDateTime],
        [tripreviews].[ApprovedByUserID],
        [tripreviews].[TripMiles],
        [tripreviews].[TripWaitMinutes],
        [tripreviews].[InvoiceID],
        [tripreviews].[PayrollID],
        [tripreviews].[AssistMiles],
        [tripreviews].[IsCanceled],
        [tripreviews].[CancelCode],
        [tripreviews].[IsDispatchApproved],
        [tripreviews].[Ignore],
        [tripreviews].[FailReason],
        [tripreviews].[Repo],
        [tripreviews].[CreateDateTime],
        [tripreviews].[DispatchApprovedDateTime],
        [tripreviews].[FailReportIntervalDT],
        [tripreviews].[PendingReportIntervalDT],
        [tripreviews].[PendingReportIntervalFMDT],
        [tripreviews].[OverRide],
        [tripreviews].[ApproveNotes],
        [tripreviews].[ITNotes],
        [tripreviews].[ReviewToggle],
        [tripreviews].[AcceptedB2B],
        [tripreviews].[B2BErrorMessage],
        [tripreviews].[LitmusPassID],
        [tripreviews].[LitmusRunCount],
        [tripreviews].[LitmusPassDT],
        [tripreviews].[LitmusFirstRunDT],
        [tripreviews].[B2BMessageName],
        [tripreviews].[DispatchApprovalReturnReason],
        [tripreviews].[LateReason],
        [tripreviews].[LitmusOverrideReason],
        [tripreviews].[DriverCalledDateTime],
        [tripreviews].[DriverCalledByUser],
        [tripreviews].[ForcedReviewCode],
        [tripreviews].[MPV],
        [tripreviews].[MPVLitmusHold],
        [tripreviews].[AcceptedB2BDateTime],
        [tripreviews].[OnTime],
        [tripreviews].[IgnoreForOTP],
        [tripreviews].[OTPLateTime],
        [tripreviews].[OTPArrivalTime],
        [tripreviews].[AuditUserID],
        [tripreviews].[AuditLastUpdate],
        [tripreviews].[DriveCamSent],
        [tripreviews].[SheetReceivedDateTime],
        [tripreviews].[SheetReceivedByUser],
        [tripreviews].[ClosedBy],
        [tripreviews].[Mapped],
        [tripreviews].[ReOpenedBy],
        [tripreviews].[ReOpenedDateTime],
        [tripreviews].[ClientInfo],
        [tripreviews].[BookerEmail],
        [tripreviews].[DriverETA],
        [tripreviews].[SendInfoStatus],
        [tripreviews].[Verified]
    FROM  [dbo].[TripReview] AS [tripreviews] WITH (NOLOCK);
END

GO

IF OBJECT_ID('Services.GetTripreviewById', 'P') IS NOT NULL
DROP PROCEDURE [Services].[GetTripreview];
GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripreviewById];
--GO

CREATE PROCEDURE [Services].[GetTripreviewById]
	(@Id INT)
AS
BEGIN
    SELECT
        [tripreview].[TripReviewID],
        [tripreview].[TripID],
        [tripreview].[Approved],
        [tripreview].[ApprovedDateTime],
        [tripreview].[ApprovedByUserID],
        [tripreview].[TripMiles],
        [tripreview].[TripWaitMinutes],
        [tripreview].[InvoiceID],
        [tripreview].[PayrollID],
        [tripreview].[AssistMiles],
        [tripreview].[IsCanceled],
        [tripreview].[CancelCode],
        [tripreview].[IsDispatchApproved],
        [tripreview].[Ignore],
        [tripreview].[FailReason],
        [tripreview].[Repo],
        [tripreview].[CreateDateTime],
        [tripreview].[DispatchApprovedDateTime],
        [tripreview].[FailReportIntervalDT],
        [tripreview].[PendingReportIntervalDT],
        [tripreview].[PendingReportIntervalFMDT],
        [tripreview].[OverRide],
        [tripreview].[ApproveNotes],
        [tripreview].[ITNotes],
        [tripreview].[ReviewToggle],
        [tripreview].[AcceptedB2B],
        [tripreview].[B2BErrorMessage],
        [tripreview].[LitmusPassID],
        [tripreview].[LitmusRunCount],
        [tripreview].[LitmusPassDT],
        [tripreview].[LitmusFirstRunDT],
        [tripreview].[B2BMessageName],
        [tripreview].[DispatchApprovalReturnReason],
        [tripreview].[LateReason],
        [tripreview].[LitmusOverrideReason],
        [tripreview].[DriverCalledDateTime],
        [tripreview].[DriverCalledByUser],
        [tripreview].[ForcedReviewCode],
        [tripreview].[MPV],
        [tripreview].[MPVLitmusHold],
        [tripreview].[AcceptedB2BDateTime],
        [tripreview].[OnTime],
        [tripreview].[IgnoreForOTP],
        [tripreview].[OTPLateTime],
        [tripreview].[OTPArrivalTime],
        [tripreview].[AuditUserID],
        [tripreview].[AuditLastUpdate],
        [tripreview].[DriveCamSent],
        [tripreview].[SheetReceivedDateTime],
        [tripreview].[SheetReceivedByUser],
        [tripreview].[ClosedBy],
        [tripreview].[Mapped],
        [tripreview].[ReOpenedBy],
        [tripreview].[ReOpenedDateTime],
        [tripreview].[ClientInfo],
        [tripreview].[BookerEmail],
        [tripreview].[DriverETA],
        [tripreview].[SendInfoStatus],
        [tripreview].[Verified]
    FROM  [dbo].[TripReview] AS [tripreview] WITH (NOLOCK)
    WHERE TripreviewID = @Id;
END

GO

    
 IF OBJECT_ID('Services.GetTripreviewByTripID', 'P') IS NOT NULL
 DROP PROCEDURE [Services].[GetTripreviewByTripID];
 GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripreviewByTripID];
--GO

CREATE PROCEDURE [Services].[GetTripreviewByTripID]
(@TripID INT)
AS
BEGIN
    SELECT
       [tripreview].[TripReviewID],
       [tripreview].[TripID],
       [tripreview].[Approved],
       [tripreview].[ApprovedDateTime],
       [tripreview].[ApprovedByUserID],
       [tripreview].[TripMiles],
       [tripreview].[TripWaitMinutes],
       [tripreview].[InvoiceID],
       [tripreview].[PayrollID],
       [tripreview].[AssistMiles],
       [tripreview].[IsCanceled],
       [tripreview].[CancelCode],
       [tripreview].[IsDispatchApproved],
       [tripreview].[Ignore],
       [tripreview].[FailReason],
       [tripreview].[Repo],
       [tripreview].[CreateDateTime],
       [tripreview].[DispatchApprovedDateTime],
       [tripreview].[FailReportIntervalDT],
       [tripreview].[PendingReportIntervalDT],
       [tripreview].[PendingReportIntervalFMDT],
       [tripreview].[OverRide],
       [tripreview].[ApproveNotes],
       [tripreview].[ITNotes],
       [tripreview].[ReviewToggle],
       [tripreview].[AcceptedB2B],
       [tripreview].[B2BErrorMessage],
       [tripreview].[LitmusPassID],
       [tripreview].[LitmusRunCount],
       [tripreview].[LitmusPassDT],
       [tripreview].[LitmusFirstRunDT],
       [tripreview].[B2BMessageName],
       [tripreview].[DispatchApprovalReturnReason],
       [tripreview].[LateReason],
       [tripreview].[LitmusOverrideReason],
       [tripreview].[DriverCalledDateTime],
       [tripreview].[DriverCalledByUser],
       [tripreview].[ForcedReviewCode],
       [tripreview].[MPV],
       [tripreview].[MPVLitmusHold],
       [tripreview].[AcceptedB2BDateTime],
       [tripreview].[OnTime],
       [tripreview].[IgnoreForOTP],
       [tripreview].[OTPLateTime],
       [tripreview].[OTPArrivalTime],
       [tripreview].[AuditUserID],
       [tripreview].[AuditLastUpdate],
       [tripreview].[DriveCamSent],
       [tripreview].[SheetReceivedDateTime],
       [tripreview].[SheetReceivedByUser],
       [tripreview].[ClosedBy],
       [tripreview].[Mapped],
       [tripreview].[ReOpenedBy],
       [tripreview].[ReOpenedDateTime],
       [tripreview].[ClientInfo],
       [tripreview].[BookerEmail],
       [tripreview].[DriverETA],
       [tripreview].[SendInfoStatus],
       [tripreview].[Verified]
    FROM  [dbo].[TripReview] AS [tripreview]
    WHERE [tripreview].[TripID] = @TripID;
END

GO


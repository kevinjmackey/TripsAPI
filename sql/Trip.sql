
USE [RailCrew];
GO

IF OBJECT_ID('Services.GetTrips', 'P') IS NOT NULL
DROP PROCEDURE [Services].[GetTrips];
GO

--DROP PROCEDURE IF EXISTS [Services].[GetTrips];
--GO

CREATE PROCEDURE [Services].[GetTrips]
AS
BEGIN
    SELECT
        [trips].[TripID],
        [trips].[Company],
        [trips].[MasterClientID],
        [trips].[ClientID],
        [trips].[TripNumber],
        [trips].[ControlNumber],
        [trips].[LocationID],
        [trips].[PickUpPointID],
        [trips].[DropOffPointID],
        [trips].[PickupDateTime],
        [trips].[Distance],
        [trips].[DriveTime],
        [trips].[TripType],
        [trips].[ASAP],
        [trips].[IsDYVPossible],
        [trips].[EstAssistHours],
        [trips].[LeadLocomotive],
        [trips].[RequesterName],
        [trips].[RequestorPhone],
        [trips].[Comments],
        [trips].[DispatcherNotes],
        [trips].[DriverID],
        [trips].[SubContractorID],
        [trips].[IsAwaitingDispatch],
        [trips].[IsWaitingResponse],
        [trips].[IsTripClosed],
        [trips].[VehicleID],
        [trips].[DriverDispatchTime],
        [trips].[TimeZoneID],
        [trips].[OverrideManager],
        [trips].[CallDateTime],
        [trips].[TrainNumber],
        [trips].[GetNextDriverReason],
        [trips].[AuditUserID],
        [trips].[AuditLastUpdate],
        [trips].[CalledDriverDateTime],
        [trips].[GetNextVehicleReason],
        [trips].[DispatchedByUserID],
        [trips].[DispatchedDateTime],
        [trips].[IsAmended],
        [trips].[CancelReason],
        [trips].[Cancelled],
        [trips].[CancelReasonID],
        [trips].[IsMPV],
        [trips].[OrigPickupDateTime],
        [trips].[DriverChangeReasonID],
        [trips].[VehicleChangeReasonID],
        [trips].[HasBackhaul],
        [trips].[RecurringTripID],
        [trips].[PickupAdHocLatitude],
        [trips].[PickupAdHocLongitude],
        [trips].[PickupAdHocID],
        [trips].[DropoffAdHocLatitude],
        [trips].[DropoffAdHocLongitude],
        [trips].[DropoffAdHocID],
        [trips].[ParentTripID],
        [trips].[ShortKey]
    FROM  [dbo].[Trip] AS [trips] WITH (NOLOCK);
END

GO

IF OBJECT_ID('Services.GetTripById', 'P') IS NOT NULL
DROP PROCEDURE [Services].[GetTrip];
GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripById];
--GO

CREATE PROCEDURE [Services].[GetTripById]
	(@Id INT)
AS
BEGIN
    SELECT
        [trip].[TripID],
        [trip].[Company],
        [trip].[MasterClientID],
        [trip].[ClientID],
        [trip].[TripNumber],
        [trip].[ControlNumber],
        [trip].[LocationID],
        [trip].[PickUpPointID],
        [trip].[DropOffPointID],
        [trip].[PickupDateTime],
        [trip].[Distance],
        [trip].[DriveTime],
        [trip].[TripType],
        [trip].[ASAP],
        [trip].[IsDYVPossible],
        [trip].[EstAssistHours],
        [trip].[LeadLocomotive],
        [trip].[RequesterName],
        [trip].[RequestorPhone],
        [trip].[Comments],
        [trip].[DispatcherNotes],
        [trip].[DriverID],
        [trip].[SubContractorID],
        [trip].[IsAwaitingDispatch],
        [trip].[IsWaitingResponse],
        [trip].[IsTripClosed],
        [trip].[VehicleID],
        [trip].[DriverDispatchTime],
        [trip].[TimeZoneID],
        [trip].[OverrideManager],
        [trip].[CallDateTime],
        [trip].[TrainNumber],
        [trip].[GetNextDriverReason],
        [trip].[AuditUserID],
        [trip].[AuditLastUpdate],
        [trip].[CalledDriverDateTime],
        [trip].[GetNextVehicleReason],
        [trip].[DispatchedByUserID],
        [trip].[DispatchedDateTime],
        [trip].[IsAmended],
        [trip].[CancelReason],
        [trip].[Cancelled],
        [trip].[CancelReasonID],
        [trip].[IsMPV],
        [trip].[OrigPickupDateTime],
        [trip].[DriverChangeReasonID],
        [trip].[VehicleChangeReasonID],
        [trip].[HasBackhaul],
        [trip].[RecurringTripID],
        [trip].[PickupAdHocLatitude],
        [trip].[PickupAdHocLongitude],
        [trip].[PickupAdHocID],
        [trip].[DropoffAdHocLatitude],
        [trip].[DropoffAdHocLongitude],
        [trip].[DropoffAdHocID],
        [trip].[ParentTripID],
        [trip].[ShortKey]
    FROM  [dbo].[Trip] AS [trip] WITH (NOLOCK)
    WHERE TripID = @Id;
END

GO

    
 IF OBJECT_ID('Services.GetTripsByClientID', 'P') IS NOT NULL
 DROP PROCEDURE [Services].[GetTripsByClientID];
 GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripsByClientID];
--GO

CREATE PROCEDURE [Services].[GetTripsByClientID]
(@ClientID INT)
AS
BEGIN
    SELECT
       [trips].[TripID],
       [trips].[Company],
       [trips].[MasterClientID],
       [trips].[ClientID],
       [trips].[TripNumber],
       [trips].[ControlNumber],
       [trips].[LocationID],
       [trips].[PickUpPointID],
       [trips].[DropOffPointID],
       [trips].[PickupDateTime],
       [trips].[Distance],
       [trips].[DriveTime],
       [trips].[TripType],
       [trips].[ASAP],
       [trips].[IsDYVPossible],
       [trips].[EstAssistHours],
       [trips].[LeadLocomotive],
       [trips].[RequesterName],
       [trips].[RequestorPhone],
       [trips].[Comments],
       [trips].[DispatcherNotes],
       [trips].[DriverID],
       [trips].[SubContractorID],
       [trips].[IsAwaitingDispatch],
       [trips].[IsWaitingResponse],
       [trips].[IsTripClosed],
       [trips].[VehicleID],
       [trips].[DriverDispatchTime],
       [trips].[TimeZoneID],
       [trips].[OverrideManager],
       [trips].[CallDateTime],
       [trips].[TrainNumber],
       [trips].[GetNextDriverReason],
       [trips].[AuditUserID],
       [trips].[AuditLastUpdate],
       [trips].[CalledDriverDateTime],
       [trips].[GetNextVehicleReason],
       [trips].[DispatchedByUserID],
       [trips].[DispatchedDateTime],
       [trips].[IsAmended],
       [trips].[CancelReason],
       [trips].[Cancelled],
       [trips].[CancelReasonID],
       [trips].[IsMPV],
       [trips].[OrigPickupDateTime],
       [trips].[DriverChangeReasonID],
       [trips].[VehicleChangeReasonID],
       [trips].[HasBackhaul],
       [trips].[RecurringTripID],
       [trips].[PickupAdHocLatitude],
       [trips].[PickupAdHocLongitude],
       [trips].[PickupAdHocID],
       [trips].[DropoffAdHocLatitude],
       [trips].[DropoffAdHocLongitude],
       [trips].[DropoffAdHocID],
       [trips].[ParentTripID],
       [trips].[ShortKey]
    FROM  [dbo].[Trip] AS [trips]
    WHERE [trips].[ClientID] = @ClientID;
END

GO
    
 IF OBJECT_ID('Services.GetTripsByMasterClientID', 'P') IS NOT NULL
 DROP PROCEDURE [Services].[GetTripsByMasterClientID];
 GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripsByMasterClientID];
--GO

CREATE PROCEDURE [Services].[GetTripsByMasterClientID]
(@MasterClientID INT)
AS
BEGIN
    SELECT
       [trips].[TripID],
       [trips].[Company],
       [trips].[MasterClientID],
       [trips].[ClientID],
       [trips].[TripNumber],
       [trips].[ControlNumber],
       [trips].[LocationID],
       [trips].[PickUpPointID],
       [trips].[DropOffPointID],
       [trips].[PickupDateTime],
       [trips].[Distance],
       [trips].[DriveTime],
       [trips].[TripType],
       [trips].[ASAP],
       [trips].[IsDYVPossible],
       [trips].[EstAssistHours],
       [trips].[LeadLocomotive],
       [trips].[RequesterName],
       [trips].[RequestorPhone],
       [trips].[Comments],
       [trips].[DispatcherNotes],
       [trips].[DriverID],
       [trips].[SubContractorID],
       [trips].[IsAwaitingDispatch],
       [trips].[IsWaitingResponse],
       [trips].[IsTripClosed],
       [trips].[VehicleID],
       [trips].[DriverDispatchTime],
       [trips].[TimeZoneID],
       [trips].[OverrideManager],
       [trips].[CallDateTime],
       [trips].[TrainNumber],
       [trips].[GetNextDriverReason],
       [trips].[AuditUserID],
       [trips].[AuditLastUpdate],
       [trips].[CalledDriverDateTime],
       [trips].[GetNextVehicleReason],
       [trips].[DispatchedByUserID],
       [trips].[DispatchedDateTime],
       [trips].[IsAmended],
       [trips].[CancelReason],
       [trips].[Cancelled],
       [trips].[CancelReasonID],
       [trips].[IsMPV],
       [trips].[OrigPickupDateTime],
       [trips].[DriverChangeReasonID],
       [trips].[VehicleChangeReasonID],
       [trips].[HasBackhaul],
       [trips].[RecurringTripID],
       [trips].[PickupAdHocLatitude],
       [trips].[PickupAdHocLongitude],
       [trips].[PickupAdHocID],
       [trips].[DropoffAdHocLatitude],
       [trips].[DropoffAdHocLongitude],
       [trips].[DropoffAdHocID],
       [trips].[ParentTripID],
       [trips].[ShortKey]
    FROM  [dbo].[Trip] AS [trips]
    WHERE [trips].[MasterClientID] = @MasterClientID;
END

GO

IF OBJECT_ID('Services.GetTripsActive', 'P') IS NOT NULL
DROP PROCEDURE [Services].[GetTripsActive];
GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripsActive];
--GO

CREATE PROCEDURE [Services].[GetTripsActive]
AS
BEGIN
    SELECT
        [trips].[TripID],
        [trips].[Company],
        [trips].[MasterClientID],
        [trips].[ClientID],
        [trips].[TripNumber],
        [trips].[ControlNumber],
        [trips].[LocationID],
        [trips].[PickUpPointID],
        [trips].[DropOffPointID],
        [trips].[PickupDateTime],
        [trips].[Distance],
        [trips].[DriveTime],
        [trips].[TripType],
        [trips].[ASAP],
        [trips].[IsDYVPossible],
        [trips].[EstAssistHours],
        [trips].[LeadLocomotive],
        [trips].[RequesterName],
        [trips].[RequestorPhone],
        [trips].[Comments],
        [trips].[DispatcherNotes],
        [trips].[DriverID],
        [trips].[SubContractorID],
        [trips].[IsAwaitingDispatch],
        [trips].[IsWaitingResponse],
        [trips].[IsTripClosed],
        [trips].[VehicleID],
        [trips].[DriverDispatchTime],
        [trips].[TimeZoneID],
        [trips].[OverrideManager],
        [trips].[CallDateTime],
        [trips].[TrainNumber],
        [trips].[GetNextDriverReason],
        [trips].[AuditUserID],
        [trips].[AuditLastUpdate],
        [trips].[CalledDriverDateTime],
        [trips].[GetNextVehicleReason],
        [trips].[DispatchedByUserID],
        [trips].[DispatchedDateTime],
        [trips].[IsAmended],
        [trips].[CancelReason],
        [trips].[Cancelled],
        [trips].[CancelReasonID],
        [trips].[IsMPV],
        [trips].[OrigPickupDateTime],
        [trips].[DriverChangeReasonID],
        [trips].[VehicleChangeReasonID],
        [trips].[HasBackhaul],
        [trips].[RecurringTripID],
        [trips].[PickupAdHocLatitude],
        [trips].[PickupAdHocLongitude],
        [trips].[PickupAdHocID],
        [trips].[DropoffAdHocLatitude],
        [trips].[DropoffAdHocLongitude],
        [trips].[DropoffAdHocID],
        [trips].[ParentTripID],
        [trips].[ShortKey]
    FROM  [dbo].[Trip] AS [trips] WITH (NOLOCK)
    --WHERE <some boolean condition>;
END
GO
IF OBJECT_ID('Services.GetTripsClosed', 'P') IS NOT NULL
DROP PROCEDURE [Services].[GetTripsClosed];
GO

--DROP PROCEDURE IF EXISTS [Services].[GetTripsClosed];
--GO

CREATE PROCEDURE [Services].[GetTripsClosed]
AS
BEGIN
    SELECT
        [trips].[TripID],
        [trips].[Company],
        [trips].[MasterClientID],
        [trips].[ClientID],
        [trips].[TripNumber],
        [trips].[ControlNumber],
        [trips].[LocationID],
        [trips].[PickUpPointID],
        [trips].[DropOffPointID],
        [trips].[PickupDateTime],
        [trips].[Distance],
        [trips].[DriveTime],
        [trips].[TripType],
        [trips].[ASAP],
        [trips].[IsDYVPossible],
        [trips].[EstAssistHours],
        [trips].[LeadLocomotive],
        [trips].[RequesterName],
        [trips].[RequestorPhone],
        [trips].[Comments],
        [trips].[DispatcherNotes],
        [trips].[DriverID],
        [trips].[SubContractorID],
        [trips].[IsAwaitingDispatch],
        [trips].[IsWaitingResponse],
        [trips].[IsTripClosed],
        [trips].[VehicleID],
        [trips].[DriverDispatchTime],
        [trips].[TimeZoneID],
        [trips].[OverrideManager],
        [trips].[CallDateTime],
        [trips].[TrainNumber],
        [trips].[GetNextDriverReason],
        [trips].[AuditUserID],
        [trips].[AuditLastUpdate],
        [trips].[CalledDriverDateTime],
        [trips].[GetNextVehicleReason],
        [trips].[DispatchedByUserID],
        [trips].[DispatchedDateTime],
        [trips].[IsAmended],
        [trips].[CancelReason],
        [trips].[Cancelled],
        [trips].[CancelReasonID],
        [trips].[IsMPV],
        [trips].[OrigPickupDateTime],
        [trips].[DriverChangeReasonID],
        [trips].[VehicleChangeReasonID],
        [trips].[HasBackhaul],
        [trips].[RecurringTripID],
        [trips].[PickupAdHocLatitude],
        [trips].[PickupAdHocLongitude],
        [trips].[PickupAdHocID],
        [trips].[DropoffAdHocLatitude],
        [trips].[DropoffAdHocLongitude],
        [trips].[DropoffAdHocID],
        [trips].[ParentTripID],
        [trips].[ShortKey]
    FROM  [dbo].[Trip] AS [trips] WITH (NOLOCK)
    --WHERE <some boolean condition>;
END
GO

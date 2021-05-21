using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Serilog;
using System;
using TripsAPI.Entities;
using TripsAPI.Models;
using TripsAPI.Services;

namespace TripsAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TripsController : ControllerBase
    {
        private ITripService _tripService;
        private IUserService _userService;

        public TripsController(ITripService tripService, IUserService userService)
        {
            _tripService = tripService;
            _userService = userService;
        }

        [HttpPost("authenticate")]
        public IActionResult Authenticate(AuthenticateRequest model)
        {
            var response = _userService.Authenticate(model);

            if (response == null)
                return BadRequest(new { message = "Username or password is incorrect" });

            return Ok(response);
        }
        [Authorize]
        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                IEnumerable<Trip> trips = _tripService.GetAll();
                return Ok(trips);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Trips" });
            }
        }

        [Authorize]
        [HttpGet("{id}")]
        public IActionResult GetById(int Id)
        {
            Trip trip;
            try
            {
                trip = _tripService.GetById(Id);
                return Ok(trip);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = $"Trip {Id} not found" });
            }
        }
    
        [Authorize]
        [HttpGet("active")]
        public IActionResult GetTripsActive()
        {
            try
            {
                IEnumerable<Trip> trips = _tripService.GetTripsActive();
                return Ok(trips);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Active Trips" });
            }
        }      
    
        [Authorize]
        [HttpGet("closed")]
        public IActionResult GetTripsClosed()
        {
            try
            {
                IEnumerable<Trip> trips = _tripService.GetTripsClosed();
                return Ok(trips);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Closed Trips" });
            }
        }      

        [Authorize]
        [HttpGet("client/{Id}")]
        public IActionResult GetByClientID(int Id)
        {
            try
            {
                IEnumerable<Trip> trips = _tripService.GetByClientID(Id);
                return Ok(trips);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Trips by ClientID" });
            }
        }

        [Authorize]
        [HttpGet("masterclient/{Id}")]
        public IActionResult GetByMasterClientID(int Id)
        {
            try
            {
                IEnumerable<Trip> trips = _tripService.GetByMasterClientID(Id);
                return Ok(trips);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Trips by MasterClientID" });
            }
        }
    }
}

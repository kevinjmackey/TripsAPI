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
    public class TripreviewsController : ControllerBase
    {
        private ITripreviewService _tripreviewService;

        public TripreviewsController(ITripreviewService tripreviewService)
        {
            _tripreviewService = tripreviewService;
        }

        [Authorize]
        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                IEnumerable<Tripreview> tripreviews = _tripreviewService.GetAll();
                return Ok(tripreviews);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Tripreviews" });
            }
        }

        [Authorize]
        [HttpGet("{id}")]
        public IActionResult GetById(int Id)
        {
            Tripreview tripreview;
            try
            {
                tripreview = _tripreviewService.GetById(Id);
                return Ok(tripreview);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = $"Tripreview {Id} not found" });
            }
        }

        [Authorize]
        [HttpGet("trip/{Id}")]
        public IActionResult GetByTripID(int Id)
        {
            try
            {
                Tripreview tripreview = _tripreviewService.GetByTripID(Id);
                return Ok(tripreview);
            }
            catch (System.Exception ex)
            {
                Log.Error($"Caught exception: {ex.Message}");
                return NotFound(new { message = "Failed to retrieve Tripreviews by TripID" });
            }
        }
    }
}

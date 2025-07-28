import gleam/float
import gleam/int

/// Smart Meter Gateway Data Record.
pub type SmgData {
  /// Smart Meter Gateway Data Record Constructor.
  SmgData(unix_timestamp: Int, meter_id: String, kilowatt_hours: Float)
}

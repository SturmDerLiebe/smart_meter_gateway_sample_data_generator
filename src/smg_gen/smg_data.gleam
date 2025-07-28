import gleam/float
import gleam/int

/// Smart Meter Gateway Data Record.
pub type SmgData {
  /// Smart Meter Gateway Data Record Constructor.
  SmgData(unix_timestamp: Int, meter_id: String, kilowatt_hours: Float)
}

/// Pretty-prints Smart Meter Data.
pub fn to_string(smg: SmgData) {
  "
  Smart Meter Data:" <> "
    - Timestamp: " <> int.to_string(smg.unix_timestamp) <> "
    - ID: " <> smg.meter_id <> "
    - Reading: " <> float.to_string(smg.kilowatt_hours) <> "kWh"
}

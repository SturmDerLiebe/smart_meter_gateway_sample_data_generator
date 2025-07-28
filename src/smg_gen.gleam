import gleam/erlang/process
import gleam/float
import gleam/int
import gleam/time/duration.{type Duration}
import gleam/time/timestamp
import internal/timesturm
import smg_gen/smg_data.{type SmgData}

/// Sends Smart Meta Gateway Data on `every` specified interval `to` the provded callback function.
/// **Important**: This creates an infinite loop!
pub fn send_data_on(every interval: Duration, to cb: fn(SmgData) -> Nil) {
  // Sending:
  create_random_smg_data() |> cb
  // Wait:
  timesturm.duration_to_floored_millis(interval) |> process.sleep
  // Repeat:
  send_data_on(interval, cb)
}

fn create_random_smg_data() {
  smg_data.SmgData(
    unix_timestamp: timestamp.system_time()
      |> timestamp.to_unix_seconds()
      |> float.round(),
    meter_id: int.random(1000) |> int.to_string,
    kilowatt_hours: float.random() *. 50.0 |> float.to_precision(2),
  )
}

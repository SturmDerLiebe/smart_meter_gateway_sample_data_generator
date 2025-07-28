import birdie
import smg_gen/smg_data

pub fn smg_to_string_snapshot_test() {
  smg_data.SmgData(
    unix_timestamp: 12_345,
    meter_id: "112233",
    kilowatt_hours: 1.24,
  )
  |> smg_data.to_string
  |> birdie.snap("smg_to_string_snapshot")
}

//// **Timesturm** contains little helper functions to convert from `gleam/time`'s `duration.{Duration}` to **milliseconds**.

import gleam/float
import gleam/time/duration.{type Duration}
import gleam/time/timestamp.{type Timestamp}

pub type SecondsNanoseconds =
  #(Int, Int)

pub fn duration_to_floored_millis(duration d: Duration) {
  duration.to_seconds_and_nanoseconds(d)
  |> sns_to_whole_milliseconds()
}

pub fn timestamp_to_rounded_seconds(timestamp ts: Timestamp) {
  timestamp.to_unix_seconds(ts)
  |> float.round
}

/// Converts a tuple of `#(Seconds, Nanoseconds)` to _whole_ (floored) milliseconds.
pub fn sns_to_whole_milliseconds(tuple: SecondsNanoseconds) {
  { tuple.0 * 1000 } + { tuple.1 / 1_000_000 }
}

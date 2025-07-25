import gleam/time/duration
import gleam/time/timestamp
import gleeunit/should
import internal/timesturm.{type SecondsNanoseconds}
import qcheck

pub fn should_calculate_correct_milliseconds_test() {
  timesturm.sns_to_whole_milliseconds(#(1, 1_000_000))
  |> should.equal(1001)
}

pub fn should_handle_any_sns_test() {
  use sns: SecondsNanoseconds <- qcheck.given(qcheck.tuple2(
    qcheck.uniform_int(),
    qcheck.uniform_int(),
  ))

  timesturm.sns_to_whole_milliseconds(sns)
  |> should.equal({ sns.0 * 1000 } + { sns.1 / 1_000_000 })
}

pub fn duration_to_floored_millis_test() {
  let millis = 5
  duration.milliseconds(millis)
  |> timesturm.duration_to_floored_millis
  |> should.equal(millis)
}

pub fn timestamp_to_rounded_seconds_test() {
  let unix_seconds = 12_345
  timestamp.from_unix_seconds(unix_seconds)
  |> timesturm.timestamp_to_rounded_seconds
  |> should.equal(unix_seconds)
}

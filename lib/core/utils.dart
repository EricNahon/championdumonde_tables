String stringFormattedTime(int n, Duration duration) {
  var result = '';
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  final hours = '${twoDigits(duration.inHours)} h';
  final minutes = '${twoDigits(duration.inMinutes.remainder(60))} mn';
  final seconds = '${twoDigits(duration.inSeconds.remainder(60))} sec';

  if (duration.inHours > 0) result = hours;
  if (duration.inMinutes > 0) result += minutes;
  if (duration.inSeconds > 0) result += seconds;

  return result;
}

import '../../logs/logger.dart';

Future<void> stopInitWatch(Duration minDelay, Stopwatch watch, Logger l) async {
  watch.stop();

  l.v('Initialization time: ${watch.elapsedMilliseconds} milliseconds');

  var delay = minDelay - watch.elapsed;

  if (delay.isNegative) delay = Duration.zero;

  l.v('Waiting ${delay.inMilliseconds} milliseconds delay');

  await Future<void>.delayed(delay);
}

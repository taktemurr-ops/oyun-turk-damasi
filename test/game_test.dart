import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_turk_damasi/oyun_turk_damasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(turkDamasiConfig.title.length, 33);
    expect(turkDamasiConfig.tagline.length, 33);
    for (final s in turkDamasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: turkDamasiId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = turkDamasiRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

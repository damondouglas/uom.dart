import 'package:unittest/unittest.dart';
import 'package:uom/uom.dart';
import 'dart:math';

final random = new Random();

void main() {
	group('arithmetic tests: ', (){
		test('mg/kg and mg/mL arithmetic test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();
			var random3 = random.nextDouble();

			mgPerkg dose1 = new mgPerkg(random1);
			kg wgt1 = new kg(random2);

			mg dose3 = dose1 * wgt1;

			mgPermL conc1 = new mgPermL(random3);
			mL dose4 = dose3 / conc1;

			expect(dose3.value, equals(random1*random2));
			expect(dose3.numeratorUnits, equals(['mg']));
			expect(dose3.denominatorUnits.isEmpty, isTrue);

			expect(dose4.value, equals(random1*random2/random3));
			expect(dose4.numeratorUnits, equals(['mL']));
			expect(dose4.denominatorUnits.isEmpty, isTrue);
		});
	});
}
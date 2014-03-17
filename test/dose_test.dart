import 'package:unittest/unittest.dart';
import 'package:uom/uom.dart';
import 'dart:math';

final random = new Random();

void main() {
	group('arithmetic tests: ', (){
		test('* operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mg dose1 = new mg(random1);
			mg dose2 = new mg(random2);

			mg dose3 = dose1 * dose2;

			expect(dose3.value, equals(random1*random2));
			expect(dose3.numeratorUnits, equals(['mg','mg']));
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});

		test('/ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mg dose1 = new mg(random1);
			mg dose2 = new mg(random2);

			mg dose3 = dose1 / dose2;

			expect(dose3.value, equals(random1/random2));
			expect(dose3.numeratorUnits.isEmpty, isTrue);
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});

		test('+ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mg dose1 = new mg(random1);
			mg dose2 = new mg(random2);

			mg dose3 = dose1 + dose2;

			expect(dose3.value, equals(random1+random2));
			expect(dose3.numeratorUnits, equals(['mg']));			
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});

		test('- operator test', (){
			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mg dose1 = new mg(random1);
			mg dose2 = new mg(random2);

			mg dose3 = dose1 - dose2;

			expect(dose3.value, equals(random1-random2));
			expect(dose3.numeratorUnits, equals(['mg']));			
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});
	});

	group('conversion test: ', (){
		test('mg to gm', (){

			var random1 = random.nextDouble();

			mg dose1 = new mg(random1);

			gm gm1 = dose1.convertTo(gm);

			expect(gm1.value, equals(random1/1000));
			expect(gm1.numeratorUnits, equals(['gm']));
			expect(gm1.denominatorUnits.isEmpty, isTrue);

		});


		test('gm to mg', (){

			var random1 = random.nextDouble();

			gm dose1 = new gm(random1);

			mg mg1 = dose1.convertTo(mg);

			expect(mg1.value, equals(random1*1000));
			expect(mg1.numeratorUnits, equals(['mg']));
			expect(mg1.denominatorUnits.isEmpty, isTrue);

		});
	});
}
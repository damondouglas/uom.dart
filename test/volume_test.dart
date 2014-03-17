import 'package:unittest/unittest.dart';
import 'package:uom/uom.dart';
import 'dart:math';

final random = new Random();

void main() {
	group('arithmetic tests: ', (){
		test('* operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mL dose1 = new mL(random1);
			mL dose2 = new mL(random2);

			mL dose3 = dose1 * dose2;

			expect(dose3.value, equals(random1*random2));
			expect(dose3.numeratorUnits, equals(['mL','mL']));
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});

		test('/ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mL dose1 = new mL(random1);
			mL dose2 = new mL(random2);

			mL dose3 = dose1 / dose2;

			expect(dose3.value, equals(random1/random2));
			expect(dose3.numeratorUnits.isEmpty, isTrue);
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});

		test('+ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mL dose1 = new mL(random1);
			mL dose2 = new mL(random2);

			mL dose3 = dose1 + dose2;

			expect(dose3.value, equals(random1+random2));
			expect(dose3.numeratorUnits, equals(['mL']));			
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});

		test('- operator test', (){
			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			mL dose1 = new mL(random1);
			mL dose2 = new mL(random2);

			mL dose3 = dose1 - dose2;

			expect(dose3.value, equals(random1-random2));
			expect(dose3.numeratorUnits, equals(['mL']));			
			expect(dose3.denominatorUnits.isEmpty, isTrue);
		});
	});

	group('conversion test: ', (){
		test('mL to dL', (){

			var random1 = random.nextDouble();

			mL dose1 = new mL(random1);

			dL dL1 = dose1.convertTo(dL);

			expect(dL1.value, equals(random1/100));
			expect(dL1.numeratorUnits, equals(['dL']));
			expect(dL1.denominatorUnits.isEmpty, isTrue);

		});


		test('dL to mL', (){

			var random1 = random.nextDouble();

			dL dose1 = new dL(random1);

			mL mL1 = dose1.convertTo(mL);

			expect(mL1.value, equals(random1*100));
			expect(mL1.numeratorUnits, equals(['mL']));
			expect(mL1.denominatorUnits.isEmpty, isTrue);

		});
	});
}
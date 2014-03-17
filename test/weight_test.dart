import 'package:unittest/unittest.dart';
import 'package:uom/uom.dart';
import 'dart:math';

final random = new Random();

void main() {
	group('arithmetic tests: ', (){
		test('* operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			kg wgt1 = new kg(random1);
			kg wgt2 = new kg(random2);

			kg wgt3 = wgt1 * wgt2;

			expect(wgt3.value, equals(random1*random2));
			expect(wgt3.numeratorUnits, equals(['kg','kg']));
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});

		test('/ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			kg wgt1 = new kg(random1);
			kg wgt2 = new kg(random2);

			kg wgt3 = wgt1 / wgt2;

			expect(wgt3.value, equals(random1/random2));
			expect(wgt3.numeratorUnits.isEmpty, isTrue);
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});

		test('+ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			kg wgt1 = new kg(random1);
			kg wgt2 = new kg(random2);

			kg wgt3 = wgt1 + wgt2;

			expect(wgt3.value, equals(random1+random2));
			expect(wgt3.numeratorUnits, equals(['kg']));			
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});

		test('- operator test', (){
			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			kg wgt1 = new kg(random1);
			kg wgt2 = new kg(random2);

			kg wgt3 = wgt1 - wgt2;

			expect(wgt3.value, equals(random1-random2));
			expect(wgt3.numeratorUnits, equals(['kg']));			
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});
	});

	group('conversion test: ', (){
		test('kg to lbs', (){

			var random1 = random.nextDouble();

			kg wgt1 = new kg(random1);

			lbs lbs1 = wgt1.convertTo(lbs);

			expect(lbs1.value, equals(random1*2.20462));
			expect(lbs1.numeratorUnits, equals(['lbs']));
			expect(lbs1.denominatorUnits.isEmpty, isTrue);

		});


		test('lbs to kg', (){

			var random1 = random.nextDouble();

			lbs wgt1 = new lbs(random1);

			kg kg1 = wgt1.convertTo(kg);

			expect(kg1.value, equals(random1/2.20462));
			expect(kg1.numeratorUnits, equals(['kg']));
			expect(kg1.denominatorUnits.isEmpty, isTrue);

		});
	});
}

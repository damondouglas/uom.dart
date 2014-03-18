import 'package:unittest/unittest.dart';
import 'package:uom/uom.dart';
import 'dart:math';

final random = new Random();

void main() {
	group('arithmetic tests: ', (){
		test('* operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			cm wgt1 = new cm(random1);
			cm wgt2 = new cm(random2);

			cm wgt3 = wgt1 * wgt2;

			expect(wgt3.value, equals(random1*random2));
			expect(wgt3.numeratorUnits, equals(['cm','cm']));
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});

		test('/ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			cm wgt1 = new cm(random1);
			cm wgt2 = new cm(random2);

			cm wgt3 = wgt1 / wgt2;

			expect(wgt3.value, equals(random1/random2));
			expect(wgt3.numeratorUnits.isEmpty, isTrue);
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});

		test('+ operator test', (){

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			cm wgt1 = new cm(random1);
			cm wgt2 = new cm(random2);

			cm wgt3 = wgt1 + wgt2;

			expect(wgt3.value, equals(random1+random2));
			expect(wgt3.numeratorUnits, equals(['cm']));			
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});

		test('- operator test', (){
			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			cm wgt1 = new cm(random1);
			cm wgt2 = new cm(random2);

			cm wgt3 = wgt1 - wgt2;

			expect(wgt3.value, equals(random1-random2));
			expect(wgt3.numeratorUnits, equals(['cm']));			
			expect(wgt3.denominatorUnits.isEmpty, isTrue);
		});
	});

	group('conversion test: ', (){
		test('cm to inch', (){

			var random1 = random.nextDouble();

			cm wgt1 = new cm(random1);

			inch inch1 = wgt1.convertTo(inch);

			expect(inch1.value, equals(random1*0.393701));
			expect(inch1.numeratorUnits, equals(['inch']));
			expect(inch1.denominatorUnits.isEmpty, isTrue);

		});


		test('inch to cm', (){

			var random1 = random.nextDouble();

			inch wgt1 = new inch(random1);

			cm cm1 = wgt1.convertTo(cm);

			expect(cm1.value, equals(random1/0.393701));
			expect(cm1.numeratorUnits, equals(['cm']));
			expect(cm1.denominatorUnits.isEmpty, isTrue);

		});
	});
}

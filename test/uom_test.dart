import "package:unittest/unittest.dart";
import "package:uom/uom.dart";
import "dart:math";

final random = new Random();

void main() {

	group('* operator tests: ', (){
		test('value test',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var uom3 = uom1 * uom2;

			expect(uom3.value, equals(random1 * random2));
		});
		
		test('empty numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var uom3 = uom1 * uom2;

			expect(uom3.value, equals(random1 * random2));
			expect(uom3.numeratorUnits.isEmpty, equals(true));
			expect(uom3.denominatorUnits.isEmpty, equals(true));
		});

		test('nonempty numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			var unitList3 = new List.from(unitList1);
			unitList3.addAll(unitList2);
			unitList3.sort();

			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			var uom3 = uom1 * uom2;

			expect(uom3.value, equals(random1 * random2));		
			expect(uom3.numeratorUnits, equals(unitList3));
			expect(uom3.denominatorUnits.isEmpty, equals(true));		
		});

		test('empty numerator Units and nonempty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			var unitList3 = new List.from(unitList1);
			unitList3.addAll(unitList2);
			unitList3.sort();

			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			var uom3 = uom1 * uom2;

			expect(uom3.value, equals(random1 * random2));		
			expect(uom3.denominatorUnits, equals(unitList3));
			expect(uom3.numeratorUnits.isEmpty, equals(true));		
		});

		test('nonempty numerator Units and nonempty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			var unitList3 = new List.from(unitList1);
			unitList3.addAll(unitList2);
			unitList3.sort();

			var unitList4 = _randomUnitList();
			var unitList5 = _randomUnitList();
			var unitList6 = new List.from(unitList4);
			unitList6.addAll(unitList5);
			unitList6.sort();

			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;
			uom1.denominatorUnits = unitList4;
			uom2.denominatorUnits = unitList5;

			var uom3 = uom1 * uom2;

			expect(uom3.value, equals(random1 * random2));		
			expect(uom3.numeratorUnits, equals(unitList3));
			expect(uom3.denominatorUnits, equals(unitList6));		
		});
	});

	group('+ operator tests: ', (){
		test('value test',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			try {
				var uom3 = uom1 + uom2;	
				expect(uom3.value, equals(random1 + random2));
			} catch (e) {
				exception = e;
			}
			
			expect(exception, isNull);
			
		});

		test('empty numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			try {
				var uom3 = uom1 + uom2;
	
				expect(uom3.value, equals(random1 + random2));
				expect(uom3.numeratorUnits.isEmpty, equals(true));
				expect(uom3.denominatorUnits.isEmpty, equals(true));
			} catch(e) {
				exception = e;
			}

			expect(exception, isNull);

		});

		test('nonempty matching numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = unitList1;
			var unitList3 = unitList1;
			
			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			try {
				var uom3 = uom1 + uom2;

				expect(uom3.value, equals(random1 + random2));		
				expect(uom3.numeratorUnits, equals(unitList3));
				expect(uom3.denominatorUnits.isEmpty, equals(true));		
			} catch(e) {
				exception = e;
			}

			expect(exception, isNull);
		});

		test('nonempty nonmatching numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			
			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			try {
				var uom3 = uom1 + uom2;
			} catch(e) {
				exception = e;
			}

			expect(exception, isNotNull);
		});

		test('empty numerator Units and nonempty matching denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = unitList1;
			var unitList3 = unitList1;
			
			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			try {
				var uom3 = uom1 + uom2;

				expect(uom3.value, equals(random1 + random2));
				expect(uom3.numeratorUnits.isEmpty, equals(true));	
				expect(uom3.denominatorUnits, equals(unitList3));
						
			} catch(e) {
				exception = e;
			}

			expect(exception, isNull);
		});

		test('empty numerator Units and nonempty nonmatching denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			
			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			try {
				var uom3 = uom1 + uom2;
			} catch(e) {
				exception = e;
			}

			expect(exception, isNotNull);
		});	
	});

	group('- operator tests: ', (){
		test('value test',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			try {
				var uom3 = uom1 - uom2;	
				expect(uom3.value, equals(random1 - random2));
			} catch (e) {
				exception = e;
			}
			
			expect(exception, isNull);
			
		});

		test('empty numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			try {
				var uom3 = uom1 - uom2;
	
				expect(uom3.value, equals(random1 - random2));
				expect(uom3.numeratorUnits.isEmpty, equals(true));
				expect(uom3.denominatorUnits.isEmpty, equals(true));
			} catch(e) {
				exception = e;
			}

			expect(exception, isNull);

		});

		test('nonempty matching numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = unitList1;
			var unitList3 = unitList1;
			
			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			try {
				var uom3 = uom1 - uom2;

				expect(uom3.value, equals(random1 - random2));		
				expect(uom3.numeratorUnits, equals(unitList3));
				expect(uom3.denominatorUnits.isEmpty, equals(true));		
			} catch(e) {
				exception = e;
			}

			expect(exception, isNull);
		});

		test('nonempty nonmatching numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			
			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			try {
				var uom3 = uom1 - uom2;
			} catch(e) {
				exception = e;
			}

			expect(exception, isNotNull);
		});

		test('empty numerator Units and nonempty matching denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = unitList1;
			var unitList3 = unitList1;
			
			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			try {
				var uom3 = uom1 - uom2;

				expect(uom3.value, equals(random1 - random2));
				expect(uom3.numeratorUnits.isEmpty, equals(true));	
				expect(uom3.denominatorUnits, equals(unitList3));
						
			} catch(e) {
				exception = e;
			}

			expect(exception, isNull);
		});

		test('empty numerator Units and nonempty nonmatching denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var exception;

			var unitList1 = _randomUnitList();
			var unitList2 = _randomUnitList();
			
			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			try {
				var uom3 = uom1 - uom2;
			} catch(e) {
				exception = e;
			}

			expect(exception, isNotNull);
		});	
	});

	group('/ operator tests: ', (){
		test('value test', (){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var uom3 = uom1 / uom2;

			expect(uom3.value, equals(random1 / random2));
		});

		test('empty numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var uom3 = uom1 / uom2;

			expect(uom3.value, equals(random1 / random2));
			expect(uom3.numeratorUnits.isEmpty, equals(true));
			expect(uom3.denominatorUnits.isEmpty, equals(true));
		});

		test('nonempty all matching numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = unitList1;

			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			var uom3 = uom1 / uom2;

			expect(uom3.value, equals(random1 / random2));		
			expect(uom3.numeratorUnits.isEmpty, equals(true));
			expect(uom3.denominatorUnits.isEmpty, equals(true));			
		});

		test('nonempty partial matching numerator Units and empty denominator Units',(){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = new List.from(unitList1);
			unitList1
			..addAll(_randomUnitList())
			..sort();

			uom1.numeratorUnits = unitList1;
			uom2.numeratorUnits = unitList2;

			var uom3 = uom1 / uom2;

			var numeratorUnits = new List.from(uom3.numeratorUnits);
			var denominatorUnits = new List.from(uom3.denominatorUnits);

			var shareList = new List.from(unitList1);
			shareList.retainWhere((item) => unitList2.contains(item));

			numeratorUnits.removeWhere((item) => shareList.contains(item));
			denominatorUnits.removeWhere((item) => shareList.contains(item));

			expect(uom3.value, equals(random1 / random2));
			expect(numeratorUnits, equals(uom3.numeratorUnits));
			expect(denominatorUnits, equals(uom3.denominatorUnits));
		});

		test('empty numerator Units and nonempty all matching denominator Units', (){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = unitList1;

			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			var uom3 = uom1 / uom2;

			expect(uom3.value, equals(random1 / random2));		
			expect(uom3.numeratorUnits.isEmpty, equals(true));
			expect(uom3.denominatorUnits.isEmpty, equals(true));	
		});

		test('empty numerator Units and nonempty partial matching denominator Units', (){
			var uom1 = new Uom();
			var uom2 = new Uom();

			var random1 = random.nextDouble();
			var random2 = random.nextDouble();

			uom1.value = random1;
			uom2.value = random2;

			var unitList1 = _randomUnitList();
			var unitList2 = new List.from(unitList1);
			unitList1
			..addAll(_randomUnitList())
			..sort();

			uom1.denominatorUnits = unitList1;
			uom2.denominatorUnits = unitList2;

			var uom3 = uom1 / uom2;

			var numeratorUnits = new List.from(uom3.numeratorUnits);
			var denominatorUnits = new List.from(uom3.denominatorUnits);

			var shareList = new List.from(unitList1);
			shareList.retainWhere((item) => unitList2.contains(item));

			numeratorUnits.removeWhere((item) => shareList.contains(item));
			denominatorUnits.removeWhere((item) => shareList.contains(item));

			expect(uom3.value, equals(random1 / random2));
			expect(numeratorUnits, equals(uom3.numeratorUnits));
			expect(denominatorUnits, equals(uom3.denominatorUnits));
		});
	});
}

List<String> _randomUnitList() => new List.generate(2+random.nextInt(2), (int index) => _randomUnit())..sort();

String _randomUnit() {
	var randomList = new List.generate(2+random.nextInt(2), (int index) => 97 + random.nextInt(25));
	var randomUnit = new String.fromCharCodes(randomList);

	return randomUnit;
}
part of uom;

class mg extends Uom {
	mg(num value) {
		this.value = value;
		numeratorUnits = ['mg'];
		convertMap[gm] = 1/1000;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == gm) return new gm(factor*value);


		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}


class gm extends Uom {
	gm(num value) {
		this.value = value;
		numeratorUnits = ['gm'];
		convertMap[mg] = 1000;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == mg) return new mg(factor*value);

		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}



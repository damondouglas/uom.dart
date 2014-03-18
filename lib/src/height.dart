part of uom;

class cm extends Uom {
	cm(num value) {
		this.value = value;
		numeratorUnits = ['cm'];
		convertMap[inch] = 0.393701;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == inch) return new inch(factor*value);


		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}


class inch extends Uom {
	inch(num value) {
		this.value = value;
		numeratorUnits = ['inch'];
		convertMap[cm] = 1/0.393701;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == cm) return new cm(factor*value);

		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}



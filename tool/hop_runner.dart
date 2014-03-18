library hop_runner;

import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';

void main(List<String> args) {
	addTask('test_uom', createProcessTask('dart',args:['test/uom_test.dart']), description:'Run unit tests on uom.dart');
	addTask('test_weight', createProcessTask('dart',args:['test/weight_test.dart']), description:'Run unit tests on weight.dart');
	addTask('test_volume', createProcessTask('dart',args:['test/volume_test.dart']), description:'Run unit tests on volume.dart');
	addTask('test_height', createProcessTask('dart',args:['test/height_test.dart']), description:'Run unit tests on height.dart');
	addTask('test_dose', createProcessTask('dart',args:['test/dose_test.dart']), description:'Run unit tests on dose.dart');
	addTask('test_ratio', createProcessTask('dart',args:['test/ratio_test.dart']), description:'Run unit tests on ratio.dart');
	addTask('analyze_lib', createAnalyzerTask(['lib/uom.dart']));


	runHop(args);
}

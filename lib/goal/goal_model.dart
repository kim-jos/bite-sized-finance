import '/flutter_flow/flutter_flow_util.dart';
import 'goal_widget.dart' show GoalWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GoalModel extends FlutterFlowModel<GoalWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for Slider widget.
  double? sliderValue3;
  // State field(s) for Deadline widget.
  FocusNode? deadlineFocusNode;
  TextEditingController? deadlineTextController;
  String? Function(BuildContext, String?)? deadlineTextControllerValidator;
  // State field(s) for CreditScore widget.
  FocusNode? creditScoreFocusNode;
  TextEditingController? creditScoreTextController;
  final creditScoreMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? creditScoreTextControllerValidator;
  String? _creditScoreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the date of birth of the patient.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    creditScoreTextControllerValidator = _creditScoreTextControllerValidator;
  }

  @override
  void dispose() {
    deadlineFocusNode?.dispose();
    deadlineTextController?.dispose();

    creditScoreFocusNode?.dispose();
    creditScoreTextController?.dispose();
  }
}

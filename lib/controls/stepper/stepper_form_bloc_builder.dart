import 'package:flutter/material.dart' hide Stepper, Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:sendify/controls/stepper/stepper.dart';

class StepperFormBlocBuilderExt<T extends FormBloc> extends StatelessWidget {
  const StepperFormBlocBuilderExt({
    Key? key,
    this.formBloc,
    required this.stepsBuilder,
    this.physics,
    this.type = StepperType.vertical,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.footer,
    this.backgroundColor,
  }) : super(key: key);

  final T? formBloc;

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [stepsBuilder] must not change.
  final List<FormBlocStep> Function(T? formBloc) stepsBuilder;

  /// How the stepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the stepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics? physics;

  final Widget? footer;

  final Color? backgroundColor;

  /// The type of stepper that determines the layout. In the case of
  /// [StepperType.horizontal], the content of the current step is displayed
  /// underneath as opposed to the [StepperType.vertical] case where it is
  /// displayed in-between.
  final StepperType type;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final void Function(FormBloc? formBloc, int step)? onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will call [FormBloc.submit]
  final void Function(FormBloc? formBloc)? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will call [FormBloc.previousStep]
  final void Function(FormBloc? formBloc)? onStepCancel;

  /// The callback for creating custom controls.
  ///
  /// If null, the default controls from the current theme will be used.
  ///
  /// This callback which takes in a context and two functions,[onStepContinue]
  /// and [onStepCancel]. These can be used to control the stepper.
  ///
  /// {@tool dartpad --template=stateless_widget_scaffold}
  /// Creates a stepper control with custom buttons.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Stepper(
  ///     controlsBuilder:
  ///       (BuildContext context, int step, VoidCallback onStepContinue, VoidCallback onStepCancel, FormBloc formBloc) {
  ///          return Row(
  ///            children: <Widget>[
  ///              FlatButton(
  ///                onPressed: onStepContinue,
  ///                child: const Text('NEXT'),
  ///              ),
  ///              FlatButton(
  ///                onPressed: onStepCancel,
  ///                child: const Text('CANCEL'),
  ///              ),
  ///            ],
  ///          );
  ///       },
  ///     steps: const <Step>[
  ///       Step(
  ///         title: Text('A'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///       Step(
  ///         title: Text('B'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///     ],
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  final Widget Function(
    BuildContext context,
    VoidCallback? onStepContinue,
    VoidCallback? onStepCancel,
    int step,
    FormBloc formBloc,
  )? controlsBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, FormBlocState>(
      bloc: formBloc,
      buildWhen: (p, c) =>
          p.numberOfSteps != c.numberOfSteps || p.currentStep != c.currentStep,
      builder: (context, state) {
        final formBloc = this.formBloc ?? context.read<T>();

        final formBlocSteps = stepsBuilder(formBloc);
        return Stepper(
          footer: footer,
          key: Key('__stepper_form_bloc_${formBlocSteps.length}__'),
          currentStep: state.currentStep,
          onStepCancel: onStepCancel == null
              ? (state.isFirstStep ? null : formBloc.previousStep)
              : () => onStepCancel?.call(formBloc),
          onStepContinue: onStepContinue == null
              ? formBloc.submit
              : () => onStepContinue?.call(formBloc),
          onStepTapped: onStepTapped == null
              ? null
              : (step) => onStepTapped?.call(formBloc, step),
          physics: physics,
          type: type,
          steps: [
            for (var i = 0; i < formBlocSteps.length; i++)
              Step(
                  title: formBlocSteps[i].title,
                  isActive: formBlocSteps[i].isActive ?? i == state.currentStep,
                  content: formBlocSteps[i].content,
                  state: formBlocSteps[i].state,
                  subtitle: formBlocSteps[i].subtitle)
          ],
          controlsBuilder: controlsBuilder == null
              ? null
              : (context, step, onStepContinue, onStepCancel) =>
                  controlsBuilder!(
                      context, onStepContinue, onStepCancel, step, formBloc),
        );
      },
    );
  }
}

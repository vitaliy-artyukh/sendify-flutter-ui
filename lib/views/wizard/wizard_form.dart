import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/bloc/statefull_builder.dart';
import 'package:sendify/bloc/wizard/verify_state_cubit.dart';
import 'package:sendify/bloc/wizard/wizard_form_bloc.dart';
import 'package:sendify/controls/stepper/stepper_form_bloc_builder.dart';
import 'package:sendify/styles/app_style.dart';
import 'package:sendify/views/main/footer_view.dart';
import 'package:sendify/views/wizard/steps/deposit_funds_step.dart';
import 'package:sendify/views/wizard/steps/personal_details_step.dart';
import 'package:sendify/views/wizard/steps/recipient_details_step.dart';
import 'package:sendify/views/wizard/steps/review_details_step.dart';
import 'package:sendify/views/wizard/steps/verify_identity_step.dart';

import '../dialogs/loading_dialog.dart';
import '../dialogs/success_screen.dart';

class WizardForm extends StatelessWidget {
  WizardForm({Key? key}) : super(key: key);

  final wizardFormBloc = WizardFormBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => wizardFormBloc,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Padding(
              padding: EdgeInsets.fromLTRB(80.0, 0, 0, 0),
              child: Text(
                'Sendify',
              ),
            ),
            titleTextStyle: headerTextStyle,
            toolbarHeight: 80,
            centerTitle: false,
          ),
          body: Material(
            color: const Color(0xffAEAEAE),
            child: FormBlocListener<WizardFormBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSuccess: (context, state) {
                LoadingDialog.hide(context);

                if (state.stepCompleted == state.lastStep) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const SuccessScreen()));
                }
              },
              onFailure: (context, state) {
                // LoadingDialog.hide(context);
              },
              child: StatefulBuilderExt(
                builder: (context, _) {
                  return StepperFormBlocBuilderExt<WizardFormBloc>(
                    backgroundColor: backgroundColor,
                    footer: FooterView(),
                    formBloc: context.read<WizardFormBloc>(),
                    type: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                        ? StepperType.vertical
                        : StepperType.horizontal,
                    physics: const ClampingScrollPhysics(),
                    stepsBuilder: (formBloc) {
                      return [
                        PersonalDetailsStep(formBloc!),
                        RecipientDetailsStep(formBloc),
                        ReviewTransferStep(formBloc),
                        DepositFundsStep(formBloc),
                        VerifyIdentityStep(formBloc),
                      ];
                    },
                    controlsBuilder: (context, onStepContinue, onStepCancel,
                        step, formBloc) {
                      if (step == 4 &&
                          wizardFormBloc.verifySate.state !=
                              VerifyState.verified) {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }

                      String title;

                      switch (step) {
                        case 3:
                          title = tr('IHaveCompletedTheTransfer');
                          break;
                        case 4:
                          title = tr('checkTransferProgress');
                          break;
                        default:
                          title = tr('Continue');
                          break;
                      }

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          constraints: const BoxConstraints(
                              maxWidth: 400, minWidth: 100),
                          child: OutlinedButton(
                            onPressed: onStepContinue,
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                            ),
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1, color: wizardButtonColor),
                                backgroundColor: wizardButtonColor),
                          ),
                        ),
                      );
                    },
                  );
                },
                dispose: () {
                  wizardFormBloc.close();
                },
              ),
            ),
          ),
        ));
  }
}

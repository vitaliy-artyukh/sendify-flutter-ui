import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sendify/styles/app_style.dart';

class TermsOfUseDialog extends StatelessWidget {
  const TermsOfUseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    double minWidth =
        mediaQuery.size.width >= 726 ? 726 : mediaQuery.size.width;
    double minHeight =
        mediaQuery.size.height >= 870 ? 870 : mediaQuery.size.height;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
            minHeight: minHeight,
            minWidth: minWidth,
            maxHeight: minHeight,
            maxWidth: minWidth),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            SizedBox(
              width: minWidth,
              child: Text(
                tr('PleaseReadAndAcceptTheTermsOfUse'),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              //TODO: Change to real terms of usage
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel sapien at turpis viverra gravida ac et risus. Duis sagittis sed ex eget dictum. Nulla convallis mattis varius. Donec sed ornare dolor. Etiam vel mollis nisi, vitae rhoncus lorem. Duis vulputate facilisis tortor, eu porttitor dolor. Cras lobortis elit vel orci bibendum, ut rhoncus nibh cursus. Quisque vitae pretium nunc. In quis condimentum massa. Sed lorem risus, varius suscipit elementum et, lobortis sed urna. Sed sed augue et sapien fermentum bibendum id ut ligula. Curabitur a lacus efficitur, auctor lacus vel, auctor augue. Donec ut mi id ligula venenatis tempus a ac ligula. Mauris vitae commodo magna, a aliquet ex. Suspendisse ac commodo nibh.Quisque finibus et sem id varius. Mauris sed neque sed augue ullamcorper condimentum. Duis gravida gravida diam et vestibulum. Vivamus eu tortor sed ex mattis pharetra molestie vel elit. Vestibulum tincidunt, ligula sed tincidunt malesuada, mauris magna pharetra sem, eget sagittis felis diam sollicitudin mauris. Sed condimentum auctor orci sed ultricies. Pellentesque iaculis dui eget ante accumsan lacinia. Aliquam tincidunt elit quis lobortis dictum. Phasellus fermentum ullamcorper dui, quis molestie neque suscipit sed. Nunc finibus, arcu semper hendrerit euismod, nibh purus accumsan sem, vitae blandit dolor velit eu elit. In hac habitasse platea dictumst.Vivamus eget ultricies nibh. Fusce felis quam, commodo at magna vitae, laoreet consequat velit. Suspendisse a erat eget nibh accumsan efficitur. Vestibulum luctus turpis a turpis volutpat iaculis. Phasellus eget commodo erat, sit amet consectetur neque. Donec eget lacus a ipsum mattis mollis eget a dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec urna nibh, pharetra at purus non, vestibulum aliquam nunc. Aenean in ex tempus eros fermentum suscipit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;Cras sit amet elit a enim facilisis luctus. Nulla viverra suscipit risus. Sed sagittis ultrices sagittis. Integer eget placerat massa, et suscipit nunc. Quisque vulputate sem sit amet justo porta rhoncus. Nunc vestibulum lectus at purus dignissim gravida. Curabitur quis sapien a nibh gravida molestie. Mauris commodo massa vel metus interdum mattis. Vestibulum lacinia elementum nibh ac hendrerit. Fusce vehicula odio a neque luctus volutpat. Nulla ut elementum sapien, sit amet cursus libero. In blandit sapien nec arcu dictum, ut bibendum eros aliquam.Nunc in est vel justo mattis molestie. Nullam quis bibendum magna. Nullam commodo odio sapien, et egestas sapien ultricies nec. Integer lobortis porttitor dolor id viverra. Praesent at dolor turpis. Vivamus molestie non sapien sit amet vulputate. Praesent aliquam, risus in semper dapibus, felis arcu condimentum lorem, non euismod ex risus vel nisi. Curabitur commodo urna a dignissim vehicula. Phasellus eu dapibus tortor. Curabitur congue diam in elementum dictum. Ut eget ligula in lorem suscipit faucibus.",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Container(
                height: 48,
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 305, minWidth: 100),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    tr('iAcceptTheTermsOfUse'),
                    style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                  ),
                  style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(width: 1, color: wizardButtonColor),
                      backgroundColor: wizardButtonColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    tr('iDontAcceptCancelDeposit'),
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        color: const Color(0xff4E4E4E)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

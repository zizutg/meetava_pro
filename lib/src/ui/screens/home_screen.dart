import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/util/constants.dart';
import '../../src.dart';

class MeetAvaHome extends ConsumerStatefulWidget {
  const MeetAvaHome({super.key});

  @override
  MeetAvaHomeState createState() => MeetAvaHomeState();
}

class MeetAvaHomeState extends ConsumerState<MeetAvaHome> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute is PageRoute) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();

    final showFeedbackModal = ref.read(showModalNotifierProvider.notifier);
    if (showFeedbackModal.isFeedBackShown) {
      _showModalBottomSheet();
      showFeedbackModal.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    final creditCardFactors = ref.watch(creditCardFactorNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).push('/emp_disp');
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              )),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Palette.deepPurple),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const BaseHeaderWidget(),
              const SectionHeader(title: 'Chart'),
              const CreditScoreWidget(
                atBaseHeader: false,
              ),
              const SectionHeader(title: 'Credit factors'),
              SingleChildScrollView(
                padding: AppPadding.allMedium,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: creditCardFactors.map((factor) {
                    return CreditFactorCard(creditFactorModel: factor);
                  }).toList(),
                ),
              ),
              const SectionHeader(title: 'Account details'),
              const AccountDetailsWidget(),
              const CreditCardUtilization(),
              const SectionHeader(title: 'Open credit card accounts'),
              const OpenAccountsWidget(),
            ],
          )),
    );
  }

  void _showModalBottomSheet() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return FeedbackWidget();
            },
          );
        },
      );
    });
  }
}

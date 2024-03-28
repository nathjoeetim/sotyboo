import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/matches/viewmodels/match_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/favourite/viewmodel/favourite_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/viewmodel/live_chat_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/viewmodel/lineup_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/stats/viewmodel/stats_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/viewmodel/search_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/change_password/change_password_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/contact_details/contact_details_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/preferences/preferences_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/residential_address/residential_address_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/account_verification_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/viewmodel/deposit_limit_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/my_activities/viewmodel/my_activities_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/time_out/viewmodel/timeout_viemmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/viewmodels/activities_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/message_details_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notification_tabs_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/viewmodel/rewards_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/viewmodel/rewards_tasks_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/viewmodels/add_deposit_card_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/viewmodels/deposit_cards_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/viewmodels/add_withdrawal_account_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/viewmodels/withdrawal_accounts_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/security_viewmodel.dart';

import '../../modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import '../home/sportboo_user_provider.dart';
import 'notification_provider.dart';

class ProvidersList {
  static List<SingleChildWidget> getProviders() => [
        /*
         Authentication
         */
        // ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => HomeProvider()),

        ChangeNotifierProvider(create: (_) => SportbooUserProvider()),
        // ChangeNotifierProvider(create: (_) => CreateOddsProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),

        /*
         Livescores tab
         */
        ChangeNotifierProvider(create: (_) => MatchViewmodel()),
        ChangeNotifierProvider(create: (_) => SearchViewmodel()),
        ChangeNotifierProvider(create: (_) => FavouriteViewmodel()),
        ChangeNotifierProvider(create: (_) => StatsViewmodel()),
        ChangeNotifierProvider(create: (_) => LineupViewmodel()),
        ChangeNotifierProvider(create: (_) => LiveChatViewmodel()),

        /*
         Profile tab
         */
        // Account
        ChangeNotifierProvider(create: (_) => ContactDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => ResidentialAddressViewmodel()),
        ChangeNotifierProvider(create: (_) => PreferencesViewmodel()),
        ChangeNotifierProvider(create: (_) => ChangePasswordViewmodel()),
        ChangeNotifierProvider(create: (_) => AccountVerificationViewmodel()),

        // Messaging
        ChangeNotifierProvider(create: (_) => MessagingTabViewmodel()),
        ChangeNotifierProvider(create: (_) => MessagingViewmodel()),
        ChangeNotifierProvider(
          create: (context) => MessageDetailsViewmodel(
            messagingViewmodel:
                Provider.of<MessagingViewmodel>(context, listen: false),
          ),
        ),

        // Notifications
        ChangeNotifierProvider(create: (_) => NotificationTabsViewmodel()),
        ChangeNotifierProvider(create: (_) => NotificationsViewmodel()),

        // Activities
        ChangeNotifierProvider(create: (_) => ActivitiesTabsViewmodel()),
        ChangeNotifierProvider(create: (_) => MyActivitiesViewmodel()),
        ChangeNotifierProvider(create: (_) => DepositLimitViewmodel()),
        ChangeNotifierProvider(create: (_) => TimeoutViewmodel()),

        //Reward
        ChangeNotifierProvider(create: (_) => RewardsTasksViewmodel()),
        ChangeNotifierProvider(create: (_) => RewardsTabViewmodel()),

        //Settings
        ChangeNotifierProvider(create: (_) => DepositCardsViewmodel()),
        ChangeNotifierProvider(
          create: (context) => AddDepositCardViewmodel(
            depositCardsViewmodel:
                Provider.of<DepositCardsViewmodel>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(create: (_) => WithdrawalAccountsViewmodel()),
        ChangeNotifierProvider(
          create: (context) => AddWithdrawalAccountViewmodel(
            withdrawalAccountsViewmodel:
                Provider.of<WithdrawalAccountsViewmodel>(context,
                    listen: false),
          ),
        ),
        ChangeNotifierProvider(create: (_) => NotificationsSettingsViewmodel()),
        ChangeNotifierProvider(create: (_) => SecurityViewmodel()),


      ];
  

}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/biller_category.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../l10n/app_localizations.dart';

/// Screen E1 — Bill Categories
///
/// Entry point for the bills module — product.md Module E. Tapping a
/// category pushes E2 (Biller Select) with the category as route `extra`.
class BillCategoriesScreen extends StatelessWidget {
  const BillCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.billCategoriesTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.2,
            children: [
              for (final category in BillerCategory.values)
                NPCard(
                  onTap: () =>
                      context.push(Routes.billsBiller, extra: category),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _iconFor(category),
                        size: 32,
                        color: colors.accentPrimary,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        _labelFor(category, l10n),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          NPListTile(
            leading: Icon(Icons.speed_outlined, color: colors.inkPrimary),
            title: l10n.billSmartMeterEntry,
            onTap: () => context.push(Routes.billsSmartMeter),
          ),
        ],
      ),
    );
  }

  IconData _iconFor(BillerCategory category) {
    return switch (category) {
      BillerCategory.electricity => Icons.bolt,
      BillerCategory.water => Icons.water_drop_outlined,
      BillerCategory.telecom => Icons.phone_android,
      BillerCategory.internet => Icons.wifi,
      BillerCategory.tvEntertainment => Icons.live_tv,
    };
  }

  String _labelFor(BillerCategory category, AppLocalizations l10n) {
    return switch (category) {
      BillerCategory.electricity => l10n.billCategoryElectricity,
      BillerCategory.water => l10n.billCategoryWater,
      BillerCategory.telecom => l10n.billCategoryTelecom,
      BillerCategory.internet => l10n.billCategoryInternet,
      BillerCategory.tvEntertainment => l10n.billCategoryTvEntertainment,
    };
  }
}

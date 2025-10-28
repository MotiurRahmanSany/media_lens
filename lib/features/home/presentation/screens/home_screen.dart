import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/constants/api_constants.dart';
import '../../../../core/common/constants/app_colors.dart';
import '../../../../core/common/constants/app_strings.dart';
import '../../../../core/common/widgets/article_card.dart';
import '../../../../core/common/widgets/article_card_shimmer.dart';
import '../../../../core/common/widgets/empty_view.dart';
import '../../../../core/common/widgets/error_view.dart';
import '../controllers/headlines_provider.dart';
import '../../../details/presentation/screens/article_detail_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedCategory = 'general';

  @override
  Widget build(BuildContext context) {
    final headlinesAsync = ref.watch(
      headlinesProvider(category: selectedCategory),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.appName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.appTagline,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Tabs
          Container(
            color: AppColors.primary,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: ApiConstants.categories.map((category) {
                  final isSelected = selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(
                        AppStrings.categoryNames[category] ?? category,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textPrimary,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        }
                      },
                      selectedColor:
                          AppColors.categoryColors[category] ??
                          AppColors.accent,
                      backgroundColor: Colors.white,
                      elevation: isSelected ? 4 : 1,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Headlines List
          Expanded(
            child: headlinesAsync.when(
              data: (articles) {
                if (articles.isEmpty) {
                  return const EmptyView();
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(
                          headlinesProvider(
                            category: selectedCategory,
                          ).notifier,
                        )
                        .refresh(category: selectedCategory);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return ArticleCard(
                        article: article,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDetailScreen(article: article),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              loading: () {
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ArticleCardShimmer();
                  },
                );
              },
              error: (error, stack) {
                return ErrorView(
                  message: error.toString(),
                  onRetry: () {
                    ref.invalidate(
                      headlinesProvider(category: selectedCategory),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

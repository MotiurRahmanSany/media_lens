import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/constants/app_colors.dart';
import '../../../../core/common/constants/app_strings.dart';
import '../../../../core/common/widgets/article_card.dart';
import '../../../../core/common/widgets/article_card_shimmer.dart';
import '../../../../core/common/widgets/empty_view.dart';
import '../../../../core/common/widgets/error_view.dart';
import '../controllers/search_provider.dart';
import '../../../details/presentation/screens/article_detail_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _hasSearched = true;
      });
      ref.read(searchNewsProvider.notifier).search(query);
    }
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _hasSearched = false;
    });
    ref.read(searchNewsProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final searchResultsAsync = ref.watch(searchNewsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(AppStrings.searchTitle),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                hintStyle: const TextStyle(color: AppColors.textHint),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: _clearSearch,
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                setState(() {});
              },
              onSubmitted: (value) => _performSearch(),
            ),
          ),

          // Search Results
          Expanded(
            child: !_hasSearched
                ? const EmptyView(message: 'Search for news articles')
                : searchResultsAsync.when(
                    data: (articles) {
                      if (articles.isEmpty) {
                        return const EmptyView(message: AppStrings.noResults);
                      }

                      return ListView.builder(
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
                        onRetry: _performSearch,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

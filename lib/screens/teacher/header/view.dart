import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';

class TeacherHeader extends StatefulWidget implements PreferredSizeWidget {
  const TeacherHeader({super.key});

  @override
  State<TeacherHeader> createState() => _TeacherHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(88);
}

class _TeacherHeaderState extends State<TeacherHeader> {
  final TextEditingController _searchController = TextEditingController();
  bool _searchClear = false;

  void _onSearchSubmitted(String value) {
    if (value.isNotEmpty) {
      debugPrint('Search Submitted: $value');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('검색어를 입력하세요.')),
      );
    }
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchClear = value.isNotEmpty;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchClear = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: OrmeeColor.white,
      toolbarHeight: 88,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: OrmeeColor.gray[200]!,
          width: 1,
        ),
      ),
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Image.asset(
              '../assets/images/logo.png',
              height: 48,
            ),
            const Spacer(),
            _buildSearchBar(),
            const SizedBox(width: 28),
            SvgPicture.asset(
              'assets/icons/type=bell.svg',
              color: OrmeeColor.gray[500],
              height: 32,
            ),
            const SizedBox(width: 28),
            SvgPicture.asset(
              'assets/icons/type=settings.svg',
              color: OrmeeColor.gray[500],
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 480,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: OrmeeColor.gray[100],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              style: TextStyle(
                color: OrmeeColor.gray[900],
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: '찾으시는 정보를 검색해보세요.',
                hintStyle: TextStyle(
                  color: OrmeeColor.gray[500],
                  fontFamily: 'Pretendard',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          if (_searchClear)
            GestureDetector(
              onTap: _clearSearch,
              child: SvgPicture.asset(
                'assets/icons/type=circle_x.svg',
                color: OrmeeColor.gray[300],
                height: 24,
              ),
            ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              _onSearchSubmitted(_searchController.text);
            },
            child: SvgPicture.asset(
              'assets/icons/type=search.svg',
              color: OrmeeColor.gray[600],
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}

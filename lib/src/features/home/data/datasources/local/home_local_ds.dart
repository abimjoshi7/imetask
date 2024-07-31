import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

abstract class HomeLocalDS {
  Future<void> persistMenus(BaseResponseDTO response);
  Future<void> persistUser(BaseResponseDTO response);
  Future<void> persistWallet(BaseResponseDTO response);
  Future<void> persistReward(BaseResponseDTO response);
  Future<List<HomeMenu>> fetchMenus();
  Future<List<MenuItem>> fetchCategories();
  Future<List<SubMenuItem>> fetchSubCategories();
}

@LazySingleton(as: HomeLocalDS)
class HomeLocalDSImpl implements HomeLocalDS {
  final UserDao _userDao;
  final WalletDao _walletDao;
  final RewardDao _rewardDao;
  final HomeMenuDao _menuDao;
  final MenuItemDao _menuItemDao;
  final SubMenuItemDao _subMenuItemDao;

  HomeLocalDSImpl({
    required UserDaoFactory userDao,
    required WalletDaoFactory walletDao,
    required RewardDaoFactory rewardDao,
    required HomeMenuDaoFactory menuDao,
    required MenuItemDaoFactory menuItemDao,
    required SubMenuItemDaoFactory subMenuItemDao,
  })  : _userDao = userDao.create(),
        _walletDao = walletDao.create(),
        _rewardDao = rewardDao.create(),
        _menuDao = menuDao.create(),
        _menuItemDao = menuItemDao.create(),
        _subMenuItemDao = subMenuItemDao.create();

  @override
  Future<void> persistMenus(BaseResponseDTO response) async {
    try {
      final menuDetails = response.responseData.menuDetails;
      final headerMenu = menuDetails.headerMenu;
      final homeMenu = menuDetails.homeMenu;
      final footerMenu = menuDetails.footerMenu;

      // home
      for (var homeMenuElement in homeMenu) {
        await _menuDao.insertHomeMenu(
          HomeMenu(
            id: int.parse(
                "${homeMenuElement.displayOrder}${homeMenuElement.categoryTheme}"),
            categoryTitleEng: homeMenuElement.categoryTitleEng,
            categoryTitle: homeMenuElement.categoryTitle,
            displayOrder: homeMenuElement.displayOrder,
            categoryTheme: homeMenuElement.categoryTheme,
            promotionalTxt: homeMenuElement.promotionalTxt,
          ),
        );
        for (var homeCategoryItem in homeMenuElement.categoryContent) {
          _menuItemDao.insertMenuItem(
            MenuItem(
              homeMenuId: int.parse(
                  "${homeMenuElement.displayOrder}${homeMenuElement.categoryTheme}"),
              title: homeCategoryItem.title,
              titleEng: homeCategoryItem.titleEng ?? '',
              icon: homeCategoryItem.icon,
              redirectionType: homeCategoryItem.redirectionType,
              redirectionModule: homeCategoryItem.redirectionModule,
              redirectionValue: homeCategoryItem.redirectionValue,
              displayOrder: homeCategoryItem.displayOrder,
              isDisabled: homeCategoryItem.isDisabled,
              disableMsg: homeCategoryItem.disableMesg,
              promotionalTxt: homeCategoryItem.promotionalTxt,
            ),
          );
          final menuItemId1 = await _menuItemDao.getMenuItemId(
              int.parse(
                  "${homeMenuElement.displayOrder}${homeMenuElement.categoryTheme}"),
              homeCategoryItem.title);
          if (homeCategoryItem.subCategory != null && menuItemId1 != null) {
            for (var homeSubCategoryItem
                in homeCategoryItem.subCategory ?? []) {
              _subMenuItemDao.insertSubMenuItem(
                SubMenuItem(
                  menuItemId: menuItemId1,
                  title: homeSubCategoryItem.title,
                  titleEng: homeSubCategoryItem.titleEng ?? '',
                  icon: homeSubCategoryItem.icon,
                  redirectionType: homeSubCategoryItem.redirectionType,
                  redirectionModule: homeSubCategoryItem.redirectionModule,
                  redirectionValue: homeSubCategoryItem.redirectionValue,
                  displayOrder: homeSubCategoryItem.displayOrder,
                  isDisabled: homeSubCategoryItem.isDisabled,
                  disableMsg: homeSubCategoryItem.disableMesg,
                  promotionalTxt: homeSubCategoryItem.promotionalTxt,
                ),
              );
            }
          }
        }
      }

      //footer
      _menuDao.insertHomeMenu(
        HomeMenu(
          id: int.parse(
              "${footerMenu.displayOrder}${footerMenu.categoryTheme}"),
          categoryTitleEng: footerMenu.categoryTitleEng,
          categoryTitle: footerMenu.categoryTitle,
          displayOrder: footerMenu.displayOrder,
          categoryTheme: footerMenu.categoryTheme,
          promotionalTxt: footerMenu.promotionalTxt,
        ),
      );
      for (var footerCategoryItem in footerMenu.categoryContent) {
        _menuItemDao.insertMenuItem(
          MenuItem(
            homeMenuId: int.parse(
                "${footerMenu.displayOrder}${footerMenu.categoryTheme}"),
            title: footerCategoryItem.title,
            titleEng: footerCategoryItem.titleEng ?? '',
            icon: footerCategoryItem.icon,
            redirectionType: footerCategoryItem.redirectionType,
            redirectionModule: footerCategoryItem.redirectionModule,
            redirectionValue: footerCategoryItem.redirectionValue,
            displayOrder: footerCategoryItem.displayOrder,
            isDisabled: footerCategoryItem.isDisabled,
            disableMsg: footerCategoryItem.disableMesg,
            promotionalTxt: footerCategoryItem.promotionalTxt,
          ),
        );
        final menuItemId2 =
            await _menuItemDao.getMenuItemId(2, footerCategoryItem.title);
        if (footerCategoryItem.subCategory != null && menuItemId2 != null) {
          for (var footerSubCategoryItem in footerCategoryItem.subCategory!) {
            _subMenuItemDao.insertSubMenuItem(
              SubMenuItem(
                menuItemId: menuItemId2,
                title: footerSubCategoryItem.title,
                titleEng: footerSubCategoryItem.titleEng,
                icon: footerSubCategoryItem.icon,
                redirectionType: footerSubCategoryItem.redirectionType,
                redirectionModule: footerSubCategoryItem.redirectionModule,
                redirectionValue: footerSubCategoryItem.redirectionValue,
                displayOrder: footerSubCategoryItem.displayOrder,
                isDisabled: footerSubCategoryItem.isDisabled,
                disableMsg: footerSubCategoryItem.disableMesg,
                promotionalTxt: footerSubCategoryItem.promotionalTxt,
              ),
            );
          }
        }
      }

      // Header
      _menuDao.insertHomeMenu(
        HomeMenu(
          id: int.parse(
              "${headerMenu.displayOrder}${headerMenu.categoryTheme}"),
          categoryTitleEng: headerMenu.categoryTitleEng,
          categoryTitle: headerMenu.categoryTitle,
          displayOrder: headerMenu.displayOrder,
          categoryTheme: headerMenu.categoryTheme,
          promotionalTxt: headerMenu.promotionalTxt,
        ),
      );
      for (var headerCategoryItem in headerMenu.categoryContent) {
        _menuItemDao.insertMenuItem(
          MenuItem(
            homeMenuId: int.parse(
                "${headerMenu.displayOrder}${headerMenu.categoryTheme}"),
            title: headerCategoryItem.title,
            titleEng: headerCategoryItem.titleEng ?? '',
            icon: headerCategoryItem.icon,
            redirectionType: headerCategoryItem.redirectionType,
            redirectionModule: headerCategoryItem.redirectionModule,
            redirectionValue: headerCategoryItem.redirectionValue,
            displayOrder: headerCategoryItem.displayOrder,
            isDisabled: headerCategoryItem.isDisabled,
            disableMsg: headerCategoryItem.disableMesg,
            promotionalTxt: headerCategoryItem.promotionalTxt,
          ),
        );
        final menuItemId3 = await _menuItemDao.getMenuItemId(
            int.parse("${headerMenu.displayOrder}${headerMenu.categoryTheme}"),
            headerCategoryItem.title);
        if (headerCategoryItem.subCategory != null && menuItemId3 != null) {
          for (var headerSubCategoryItem
              in headerCategoryItem.subCategory ?? []) {
            _subMenuItemDao.insertSubMenuItem(
              SubMenuItem(
                menuItemId: menuItemId3,
                title: headerSubCategoryItem.title,
                titleEng: headerSubCategoryItem.titleEng ?? '',
                icon: headerSubCategoryItem.icon,
                redirectionType: headerSubCategoryItem.redirectionType,
                redirectionModule: headerSubCategoryItem.redirectionModule,
                redirectionValue: headerSubCategoryItem.redirectionValue,
                displayOrder: headerSubCategoryItem.displayOrder,
                isDisabled: headerSubCategoryItem.isDisabled,
                disableMsg: headerSubCategoryItem.disableMesg,
                promotionalTxt: headerSubCategoryItem.promotionalTxt,
              ),
            );
          }
        }
      }
    } catch (e) {
      throw DatabaseException(
        e.toString(),
      );
    }
  }

  @override
  Future<void> persistReward(BaseResponseDTO response) async => _rewardDao
      .insertRewardDetail(
        response.responseData.rewardDetails,
      )
      .catchError(
        (e) => throw DatabaseException(
          e.toString(),
        ),
      );

  @override
  Future<void> persistUser(BaseResponseDTO response) async => _userDao
      .insertUserDetail(
        response.responseData.userInfo,
      )
      .catchError(
        (e) => throw DatabaseException(
          e.toString(),
        ),
      );

  @override
  Future<void> persistWallet(BaseResponseDTO response) async => _walletDao
      .insertWalletDetail(
        response.responseData.walletDetails,
      )
      .catchError(
        (e) => throw DatabaseException(
          e.toString(),
        ),
      );

  @override
  Future<List<MenuItem>> fetchCategories() async =>
      _menuItemDao.getAllMenuItems();

  @override
  Future<List<HomeMenu>> fetchMenus() async => _menuDao.getAllHomeMenus();

  @override
  Future<List<SubMenuItem>> fetchSubCategories() async =>
      _subMenuItemDao.getAllSubMenuItems();
}

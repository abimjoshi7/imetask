# imepay

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

<!-- class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            getInitialDataUsecase: locator(),
          )..fetchInitialData(),
        ),
        BlocProvider(
          create: (context) => MenuCubit(
            locator(),
          )..fetchMenu(),
        ),
      ],
      child: child,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetInitialDataUsecase getInitialDataUsecase,
  })  : _getInitialDataUsecase = getInitialDataUsecase,
        super(HomeInitial());

  final GetInitialDataUsecase _getInitialDataUsecase;

  Future<void> fetchInitialData() async {
    emit(HomeLoading());
    return _getInitialDataUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              HomeFailure(
                l,
              ),
            ),
            (r) => emit(
              HomeSuccess(r),
            ),
          ),
        );
  }
}

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDS _remoteDS;
  final HomeLocalDS _localDS;

  HomeRepositoryImpl({
    required HomeRemoteDS remoteDS,
    required HomeLocalDS localDs,
  })  : _remoteDS = remoteDS,
        _localDS = localDs;
  @override
  TaskEither<String, BaseResponseDTO> fetchData() => TaskEither.tryCatch(
        () async {
          final response = await _remoteDS.fetchData();
          await _localDS.persistMenus(response);
          await _localDS.persistReward(response);
          await _localDS.persistUser(response);
          await _localDS.persistWallet(response);
          return response;
        },
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, List<HomeMenu>> fetchHomeMenu() => TaskEither.tryCatch(
        () async => _localDS.fetchMenus(),
        (error, _) => error.toString(),
      );
}

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
  Future<List<HomeMenu>> fetchMenus() async => _menuDao.getAllHomeMenus();

} -->

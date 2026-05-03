import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/core/core.dart';
import 'package:portal1409/features/home/account/data/data.dart';
import 'package:portal1409/features/home/account/presentation/cubit/account_cubit.dart';
import 'package:portal1409/features/home/account/presentation/widgets/widgets.dart';
import 'package:portal1409/repository/account/account_repository.dart';
import 'package:portal1409/router/router.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.heroTag});

  final String heroTag;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final String name =
      "${GetIt.I<AccountRepository>().getName()?.split(" ")[1]} ${GetIt.I<AccountRepository>().getName()?.split(" ")[2]}";
  final String? login = GetIt.I<AccountRepository>().getLogin();
  final TextEditingController controllerSymbol = TextEditingController();
  final TextEditingController controllerBirthdayDay = TextEditingController();
  final TextEditingController controllerExtraInfo = TextEditingController();

  late String? classNumberValue = GetIt.I<AccountRepository>()
      .getGroupNumber()
      .toString();

  late String? campusValue = GetIt.I<AccountRepository>().getCampus();
  late String? birthdayDay = GetIt.I<AccountRepository>().getBirthday()?.split(
    ".",
  )[0];
  late String? birthdayMonth = GetIt.I<AccountRepository>()
      .getBirthday()
      ?.split(".")[1];

  @override
  void initState() {
    super.initState();
    controllerSymbol.text = GetIt.I<AccountRepository>().getGroupSymbol() ?? "";
    controllerBirthdayDay.text = birthdayDay ?? "";
    controllerExtraInfo.text =
        GetIt.I<AccountRepository>().getExtraInfo() ?? "";
  }

  @override
  void dispose() {
    controllerSymbol.dispose();
    controllerBirthdayDay.dispose();
    controllerExtraInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: header(context, [
        Center(
          child: Padding(
            padding: const .only(top: 64, left: 12, right: 12),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [Colors.transparent, Colors.black, Colors.black],
                  stops: [0.0, 0.1, 1.0],
                ).createShader(rect);
              },
              blendMode: .dstIn,
              child: ListView(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Hero(
                      tag: widget.heroTag,
                      child: Image.asset(
                        "assets/images/account_icon.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  Text(
                    name,
                    textAlign: .center,
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 32),
                  ),

                  const SizedBox(height: 32),

                  BasicCard(
                    leadingIcon: Icons.settings_outlined,
                    text: "Настройки",
                    func: () => context.router.pushPath("/settings"),
                    actionIcon: Icons.arrow_forward_ios,
                    actionIconColor: theme.hintColor,
                    actionIconSize: 24,
                  ),

                  const SizedBox(height: 12),

                  BasicCard(
                    leadingIcon: Icons.support_agent_outlined,
                    text: "Помощь",
                    func: () {},
                    actionIcon: Icons.arrow_forward_ios,
                    actionIconColor: theme.hintColor,
                    actionIconSize: 24,
                  ),

                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: .circular(23),
                    child: BackdropFilter(
                      filter: .blur(sigmaX: 26, sigmaY: 26),
                      child: Container(
                        width: double.infinity,
                        padding: const .symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: .circular(23),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Center(
                              child: Text(
                                "Аккаунт",
                                style: theme.textTheme.titleMedium,
                              ),
                            ),

                            const SizedBox(height: 24),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "Логин:",
                                  style: theme.textTheme.labelLarge,
                                ),
                                Text(
                                  login ?? "ошибка загрузки",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            const Divider(),

                            const SizedBox(height: 18),

                            Text(
                              "Класс по умолчанию",
                              style: theme.textTheme.titleSmall,
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                AccountSmallCustomDropButton(
                                  placeholder: "Цифра",
                                  list: [
                                    [CupertinoIcons.person_2_square_stack, "7"],
                                    [CupertinoIcons.person_2_square_stack, "8"],
                                    [CupertinoIcons.person_2_square_stack, "9"],
                                    [
                                      CupertinoIcons.person_2_square_stack,
                                      "10",
                                    ],
                                    [
                                      CupertinoIcons.person_2_square_stack,
                                      "11",
                                    ],
                                  ],
                                  onSelect: (value) => classNumberValue = value,
                                  isError: false,
                                  defaultText: classNumberValue,
                                ),
                                const SizedBox(width: 8),
                                AccountSmallTextField(
                                  controller: controllerSymbol,
                                  placeholder: "Буква",
                                  isError: false,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            AccountButton(
                              text: "Сохранить класс",
                              onTap: () => context.read<AccountCubit>().update({
                                "default_group_number": classNumberValue,
                                "default_group_letter": controllerSymbol.text
                              }),
                            ),

                            const SizedBox(height: 32),

                            Text("Корпус", style: theme.textTheme.titleSmall),

                            const SizedBox(height: 12),

                            CustomDropButton(
                              placeholder: campusValue == "modern"
                                  ? "Модерн"
                                  : campusValue == "historical"
                                  ? "Ходынка"
                                  : "Ошибка загрузки",
                              onSelect: (value) => campusValue = value,
                              list: [
                                [Icons.corporate_fare_rounded, "Ходынка"],
                                [Icons.blinds_outlined, "Модерн"],
                              ],
                            ),

                            const SizedBox(height: 24),

                            AccountButton(
                              text: "Сохранить корпус",
                              onTap: () => context.read<AccountCubit>().update({
                                "campus": campusValue == "Модерн"
                                    ? "modern"
                                    : "historical",
                              }),
                            ),

                            const SizedBox(height: 32),

                            Text(
                              "День рождения",
                              style: theme.textTheme.titleSmall,
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                AccountSmallTextField(
                                  controller: controllerBirthdayDay,
                                  placeholder: "День",
                                ),
                                const SizedBox(width: 8),
                                AccountSmallCustomDropButton(
                                  placeholder: birthdayMonth != null
                                      ? "${birthdayData[birthdayMonth]}"
                                      : "Месяц",
                                  onSelect: (value) => birthdayMonth = value,
                                  defaultText: birthdayMonth != null
                                      ? "${birthdayData[birthdayMonth]}"
                                      : "Месяц",
                                  list: monthData,
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            Text(
                              "Доп информация",
                              style: theme.textTheme.titleSmall,
                            ),

                            const SizedBox(height: 12),

                            BasicTextField(
                              controller: controllerExtraInfo,
                              placeholder: "Например: Учитель из 430 кабинета ",
                            ),

                            const SizedBox(height: 24),

                            AccountButton(
                              text: "Сохранить данные",
                              onTap: () => context.read<AccountCubit>().update({
                                "birth_date":
                                    "${controllerBirthdayDay.text}.${birthdayDataReverse[birthdayMonth]}",
                                "extra_info": controllerExtraInfo.text,
                              }),
                            ),

                            const SizedBox(height: 32),

                            SwitchCard(
                              text: "Блокировка выхода",
                              funcOn: () => context.read<AccountCubit>().update(
                                {"block_class_exit": true},
                              ),
                              funcOff: () => context
                                  .read<AccountCubit>()
                                  .update({"block_class_exit": false}),
                              default_: GetIt.I<AccountRepository>()
                                  .getBlockClassExit(),
                            ),

                            const SizedBox(height: 12),

                            SwitchCard(
                              text: "Показывать колегам",
                              funcOn: () => context.read<AccountCubit>().update(
                                {"show_contact_to_colleagues": true},
                              ),
                              funcOff: () =>
                                  context.read<AccountCubit>().update({
                                    "show_contact_to_colleagues": false,
                                  }),
                              default_: GetIt.I<AccountRepository>()
                                  .getShowContactToColleagues(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  ClipRRect(
                    borderRadius: .circular(23),
                    child: BackdropFilter(
                      filter: .blur(sigmaX: 26, sigmaY: 26),
                      child: Container(
                        width: double.infinity,
                        padding: const .symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: .circular(23),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Center(
                              child: Text(
                                "Регистрация учащихся",
                                style: theme.textTheme.titleMedium,
                              ),
                            ),

                            const SizedBox(height: 24),
                            
                            BlocConsumer<AccountCubit, AccountState>(
                              listener: (context, state) {
                                if (state is AccountLoadedRegistrLink) {
                                  context.router.push(CreateStudentRoute(link: state.link));
                                }
                              },
                              builder: (context, state) {
                                if (state is AccountLoadingRegistrLink) {
                                  return const Center(child: CircularProgressIndicator());
                                }
                                return AccountButton(text: "Открыть создание", onTap: () => context.read<AccountCubit>().onCreateStudent());
                              },
                            )

                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

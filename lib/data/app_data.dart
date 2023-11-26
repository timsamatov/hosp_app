import 'package:hosp_app/data/model/info_widget_model.dart';
import 'package:hosp_app/presentation/theme/app_pngs.dart';

abstract class AppData{
  static List<InfoWidgetModel> data = [
      InfoWidgetModel(
          image: AppPngs.hospital,
          title: 'Записывайтесь на прием к самым лучшим специалистам'),
      InfoWidgetModel(
          image: AppPngs.clipboard,
          title:
              'Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку'),
      InfoWidgetModel(
          image: AppPngs.speech,
          title:
              'Просматривайте отзывы о врачах и дополняйте собственными комментариями'),
      InfoWidgetModel(
          image: AppPngs.bell,
          title: 'Получайте уведомления о приеме или о поступивших сообщениях')
    ];
}
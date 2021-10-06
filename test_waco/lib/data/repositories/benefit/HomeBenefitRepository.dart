import 'package:test_waco/domain/entities/noDb/Benefit.dart';
import 'package:test_waco/domain/repositories/BenefitRepository.dart';

class HomeBenefitRepository implements BenefitRepository{
  Future<List<Benefit>> getAll() async {
    //future db read
    List<Benefit> benefits = [
      Benefit(image: 'assets/benefits/last_tecnologies.svg', text: 'Trabajar en ultimas tecnologias'),
      Benefit(image: 'assets/benefits/home_office.svg', text: 'Home office'),
      Benefit(image: 'assets/benefits/capacitations.svg', text: 'Capacitaciones y workshops'),
      Benefit(image: 'assets/benefits/snacks.svg', text: 'Snacks, frutas y bebidas gratis'),
      Benefit(image: 'assets/benefits/remote_week.svg', text: 'Semana Remota'),
      Benefit(image: 'assets/benefits/flexible_scheduler.svg', text: 'Flexibilidad Horaria'),
    ];
    return benefits;
  }

  @override
  Future<Benefit> get(String id) {
    throw UnimplementedError();
  }
}
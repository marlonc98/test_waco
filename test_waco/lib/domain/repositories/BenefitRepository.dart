import 'package:test_waco/domain/entities/noDb/Benefit.dart';

abstract class BenefitRepository{
  Future<Benefit> get(String id);
  Future<List<Benefit>> getAll();
}
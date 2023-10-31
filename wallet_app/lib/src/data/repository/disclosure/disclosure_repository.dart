import '../../../../bridge_generated.dart';
import '../../../domain/model/disclosure/start_disclosure_result.dart';

export '../../../domain/model/disclosure/start_disclosure_result.dart';
export '../../../feature/disclosure/model/disclosure_request.dart';

abstract class DisclosureRepository {
  Stream<StartDisclosureResult> startDisclosure(Uri disclosureUri);

  Future<void> cancelDisclosure();

  Future<WalletInstructionResult> acceptDisclosure(String pin);
}
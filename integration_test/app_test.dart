import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:modulo_d1_v1/appController.dart';

void main() {
  final binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Meus Testes', (tester) async {
    //1
    await tester.pumpWidget(Appcontroller());
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //2
    await tester.tap(find.byType(GestureDetector).at(0));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //3
    await tester.tap(find.byType(TextButton).at(0));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //4
    await tester.tap(find.byType(TextField).at(0));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    tester.testTextInput.enterText('Atividade 01');
    await tester.pump(Duration(seconds: 1));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.text('Baixa').last);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.byType(TextButton).at(0));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //5
    await tester.tap(find.byType(TextButton).last);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.byType(TextField).at(0));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    tester.testTextInput.enterText('Atividade 02');
    await tester.pump(Duration(seconds: 1));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.text('Alta').last);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(find.byType(TextButton).at(0));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //6
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(
      find.widgetWithText(GestureDetector, 'Ver Kanban'),
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //7 Apenas observar

    //8
    await tester.tap(
      find.widgetWithIcon(IconButton, Icons.arrow_forward_ios).first,
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //9
    await tester.tap(
      find.widgetWithIcon(IconButton, Icons.arrow_forward_ios).last,
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //10
    await tester.tap(
      find.widgetWithIcon(IconButton, Icons.arrow_forward_ios).last,
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //11
    await tester.tap(
      find.widgetWithIcon(IconButton, Icons.arrow_back_ios).last,
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //12
    await tester.tap(
      find.widgetWithIcon(IconButton, Icons.arrow_back_ios).last,
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //13
    await tester.tap(
      find.widgetWithIcon(IconButton, Icons.arrow_back_ios).first,
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    //14
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(
      find.widgetWithText(GestureDetector, 'Gerar relatório'),
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.binding.reassembleApplication();
    await tester.pump(Duration(seconds: 1));
    print('App reiniciado (Reassemnle)');
    await tester.pump(Duration(seconds: 4));
    await tester.pumpWidget(Appcontroller());
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.tap(
      find.widgetWithText(GestureDetector, 'Ver Kanban'),
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 4));

    await tester.pumpAndSettle();
  });
}

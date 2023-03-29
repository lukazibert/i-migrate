import 'package:flutter/material.dart';
import 'package:i_migrate/components/cards/agent_info_card.dart';
import 'package:i_migrate/views/details_page.dart';

class MigrationAgentView extends StatelessWidget {
  const MigrationAgentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Migration Agent',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            AgentInfoCard(
              title: 'Pre Requirements',
              items: [
                "Placeholder 1",
                "Placeholder 2",
                "Placeholder 3",
                "Placeholder 4",
              ],
              onContinuePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TaskDetailsPage(title: 'Pre Requirements'),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AgentInfoCard(
              title: 'Visa Application Projects',
              items: [
                "Placeholder 1",
                "Placeholder 2",
                "Placeholder 3",
                "Placeholder 4",
              ],
              onContinuePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TaskDetailsPage(title: 'Visa Application Projects'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

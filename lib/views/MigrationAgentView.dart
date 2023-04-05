import 'package:flutter/material.dart';

import '../components/cards/AgentInfoCard.dart';
import 'TaskDetailesPage.dart';

class MigrationAgentView extends StatelessWidget {
  const MigrationAgentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgentInfoCard(
                title: 'Pre Requirements',
                items: [
                  "Acceptance at a German university",
                  "Financial means",
                  "Health insurance",
                  "Language proficiency",
                  // "Educational qualifications",
                  // "Clean criminal record",
                  // "Application fee"
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
                  "Gather the required documents",
                  "Make an appointment",
                  "Attend the visa appointment",
                  "Wait for your visa to be processed",
                ],
                onContinuePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TaskDetailsPage(title: 'Visa Appointment'),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              AgentInfoCard(
                title: 'Learn befoure you go',
                items: [
                  "Find sutable housing",
                  "Look for a job",
                  "Popular cities",
                  "Public transportation",
                ],
                onContinuePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TaskDetailsPage(title: 'Learn befoure you go'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

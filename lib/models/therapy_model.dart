class TherapyModel {
  String? name, pdfPath;

  TherapyModel({
    required this.name,
    required this.pdfPath,
  });
}

List<TherapyModel> therapiesList = [
  TherapyModel(
    name: "Practice Gratitude",
    pdfPath: "assets/therapies/practice_gratitude.pdf",
  ),
  TherapyModel(
    name: "Minfulness Technique",
    pdfPath: "assets/therapies/minfulness_technique.pdf",
  ),
  TherapyModel(
    name: "Meditation",
    pdfPath: "assets/therapies/meditation.pdf",
  ),
  TherapyModel(
    name: "Concentration Techniques",
    pdfPath: "assets/therapies/concentration_technique.pdf",
  ),
  TherapyModel(
    name: "Journaling and Thought Records",
    pdfPath: "assets/therapies/journaling_thoughts.pdf",
  ),
  TherapyModel(
    name: "Role Playing",
    pdfPath: "assets/therapies/role_playing.pdf",
  ),
  TherapyModel(
    name: "Relaxation and Stress Reduction",
    pdfPath: "assets/therapies/relaxation_technique.pdf",
  ),
];

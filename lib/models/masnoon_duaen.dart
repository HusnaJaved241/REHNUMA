import 'package:flutter/material.dart';

import '../constants.dart';

class MasnoonDua {
  String? name, dua, translation;

  MasnoonDua({
    required this.name,
    required this.dua,
    required this.translation,
  });
}

List<MasnoonDua> masnoonDuaList = [
  MasnoonDua(
    name: "Before Meals",
    dua: "بِسْمِ اللّٰہ وَعَلٰی بَرَكَةِ اللّٰہِ",
    translation:
        "In the name of Allah and with the blessings of Allah I begin (eating)",
  ),
  MasnoonDua(
    name: "After Meals",
    dua:
        "الْحَمْدُ لِلَّه اِلَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِينَ",
    translation:
        "Thanks to Allah Azzawajal who fed us and made us among Muslims.",
  ),
  MasnoonDua(
    name: "Before sleeping",
    dua: "اَللّٰھُمَّ بِاسْمِكَ أَمُوتُ وَ أَحْيَا",
    translation: "O Allah (Almighty) I live and die in your name.",
  ),
  MasnoonDua(
    name: "Waking up from sleep",
    dua:
        "الْحَمْدُ لِلّٰہ اِلَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَ إِلَيْهِ النُّشُورُ",
    translation:
        "All Praise onto Allah (Almighty) Who granted us life after death (Sleep) and we are returned to him.",
  ),
  MasnoonDua(
    name: "When entering the home",
    dua:
        "اَللّٰھُمَّ اِنِّیْ اَسْ ئَلُكَ خَیْرَالْمَوْلَجِ وَخَیْرَالْمَخْرَجِ",
    translation:
        "O Allah( عَزَّ وَجَلَّ )! I ask you for the goodness of the places of entering and exiting.",
  ),
  MasnoonDua(
    name: "When leaving the house",
    dua:
        "بِسْمِِ اللّٰہ تَوَكَّلْتُ عَلَى اللّٰہ وَِ لَا حَوْلَ وَ لَا قُوَّةَ لَّاإِِ بِا للّٰہ",
    translation:
        "In the name of Allah Almighty (I comeout of my house) I trust Allah Almighty, there is no capability of saving oneself from sins and neither is there capability to do good deeds but from Allah Almighty.",
  ),
  MasnoonDua(
    name: "When entering the Mosque",
    dua: "اَللّٰهُمَّ افْتَحْ لِيْ اَبْوَابَ رَحْمَتِکَ",
    translation: "Oh Allah! Open the doors for me of your Blessings.",
  ),
  MasnoonDua(
    name: "When leaving the Mosque",
    dua: "اَللّٰهُمَّ اِنِّيْ اَسْاَلُکَ مِنْ فَضْلِکَ وَرَحْمَتِکَ",
    translation: "Oh Allah! I ask you of your Favour.",
  ),
  MasnoonDua(
    name: "For traveling & journey",
    dua:
        "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَ إِنَّا إِلَىٰ رَبِّنَا لَمُنقَلِبُونَ",
    translation:
        "Thanks to Allah Azzawajal. Pure is he who subdued this, otherwise we could not make this obedient.",
  ),
  MasnoonDua(
    name: "When Entering the Market (Bazaar)",
    dua:
        "لَا إِلٰهَ إِلَّا اللّٰہ وَُحْدَهٗ لَا شَرِيكَ لَهٗ ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيِي وَيُمِيتُ وَهُوَ حَيٌّ لَا يَمُوتُ بِيَدِهِالْخَيْرُ وَهُوَ عَلٰی كُلِّ شَيْءٍ قَدِيرٍ",
    translation:
        "There is no deity except Allah Azzawajal he is unique, He has no partner, His is the kingship, and for him is praise, he brings to lie and he kills, He is alive(as such death will not come to him. All virtues are in his hand of power, He can do what ever he wants.",
  ),
  MasnoonDua(
    name: "Upon sneezing",
    dua: "اَلْحَمْدُ لِلّٰہِ",
    translation: "All praise onto Allah Almighty.",
  ),
  MasnoonDua(
    name: "When hearing someone Sneeze",
    dua: "يَرْحَمُكَ اللّٰہُ",
    translation: "May Allah Almighty Have Mercy on you.",
  ),
  MasnoonDua(
    name: "When facing trouble and difficulties",
    dua:
        "إِنَّا لِله وَِ إِنَّا إِلَيْهِ رَاجِعُوْن. اَللّٰهُمَّ أْجُرْنِيْ فِيْ مُصِيبَتِيْ وَاخْلُفْ لِيْ خَيْرا مِنْهَا",
    translation:
        "To Allaah we belong and unto Him is our return. O Allaah, recompense me for my affliction and replace it for me with something better.",
  ),
  MasnoonDua(
    name: "For relief from hardships",
    dua:
        "لَا إِلٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ",
    translation:
        "None has the right to be worshiped except You. How perfect You are, verily I was among the wrong-doers",
  ),
  MasnoonDua(
    name: "At the time of dressing",
    dua:
        "الْحَمْدُ لِلَّه اِلَّذِي كَسَانِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَ لَا قُوَّةٍ",
    translation:
        "All excellencies are for Allah Azzawajal Who gave me this cloth to wear and granted me without (using) any strength and Power.",
  ),
  MasnoonDua(
    name: "When visiting the sick",
    dua: "لَا بَ أْسَ طَهُورٌ إِنْ شَآءَ اللّٰہُ",
    translation:
        "This is not a thing of harm In Sha Allah Azzawajal this illness purifies from sins.",
  ),
  MasnoonDua(
    name: "Before ablution",
    dua: "بِسْمِِ اللّٰہ وَلْحَمْدُ لِلّٰہِ",
    translation:
        "Allah Azzawajal in the name of the most affectionate, the merciful.",
  ),
  MasnoonDua(
    name: "While performing Ablution",
    dua:
        "اَللّٰهُمَّ اغْفِرْ لِي ذَنْبِي وَوَسِّعْ لِي فِي دَارِي وَبَارِكْ لِي فِي رِزْقِي",
    translation:
        "O Allah Azzawajal forgive me and give me abundance and blessing in my house and grant me abundance in my livelihood.",
  ),
  MasnoonDua(
    name: "Before entering toilet",
    dua: "اَللّٰھُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَا ئِثِ",
    translation:
        "O Allah (Almighty) I seek your refuge from impure Jinnat (male and female).",
  ),
  MasnoonDua(
    name: "After leaving toilet",
    dua: "اَلْحَمْدُ لِلّٰہ اِلَّذِي أَذْهَبَ عَنِّي ا لْأَذَى وَعَافَانِي",
    translation:
        "Thanks to Allah Almighty Who removed pain from me and granted me relief.",
  ),
  MasnoonDua(
    name: "Before entering cemetery",
    dua:
        "لسَّ لَا مُ عَلَيْكُمُ يَا أَهْلَ الْقُبُورِ يَغْفِرُ اللَّه لَُنَا وَلَكُمْ أَنْتُمُ سَلَفُنَا وَنَحْنُ بِا لْأَثَرِ",
    translation:
        "O dwellers of the graves peace be upon you. May Allah Azzawajal forgive us and you. You reached before us and we will follow behind you.",
  ),
  MasnoonDua(
    name: "When looking in the mirror",
    dua: "اَللّٰهُمَّ أَنْتَ حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
    translation:
        "O Allah Azzawajal as you made my outward appearance good make my character good too.",
  ),
  MasnoonDua(
    name: "When something is lost",
    dua:
        "اللَّهُمَّ رَادَّ الضَّالَّةِ وَهَادِي الضَّالَّةِ أَنْتَ تَهْدِي مِنَ الضَّ لَا لَةِ ارْدُدْ عَلَيَّ ضَالَّتِي بِقُدْرَتِكَوَسُلْطَانِكَ فَ إِنَّهَا مِنْ عَطَا ئِكَ وَفَضْلِكَ",
    translation:
        "O Allah, the One who returns the lost, by Your power and awe return what I have lost, for surely I have received it as Your gift and favor (boon).",
  ),
];

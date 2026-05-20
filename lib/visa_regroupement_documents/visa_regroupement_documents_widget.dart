import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisaRegroupementDocumentsWidget extends StatefulWidget {
  const VisaRegroupementDocumentsWidget({Key key}) : super(key: key);

  @override
  _VisaRegroupementDocumentsWidgetState createState() =>
      _VisaRegroupementDocumentsWidgetState();
}

class _VisaRegroupementDocumentsWidgetState
    extends State<VisaRegroupementDocumentsWidget>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  // Checklist state for each document
  final Map<String, bool> _checkedDemandeur = {};
  final Map<String, bool> _checkedFamille = {};

  static const List<Map<String, dynamic>> _docsDemandeur = [
    {
      'id': 'd1',
      'titre': 'Titre de séjour ou carte de résident',
      'detail': 'Original + photocopie recto-verso. Doit être valide.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.idCard,
    },
    {
      'id': 'd2',
      'titre': 'Justificatif de domicile',
      'detail': 'Bail de location ou acte de propriété, factures récentes (eau, gaz, EDF).',
      'obligatoire': true,
      'icon': FontAwesomeIcons.home,
    },
    {
      'id': 'd3',
      'titre': 'Justificatif de ressources',
      'detail': '12 derniers bulletins de salaire ou bilans pour les indépendants. Dernier avis d\'imposition.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.moneyCheckAlt,
    },
    {
      'id': 'd4',
      'titre': 'Attestation de sécurité sociale',
      'detail': 'Attestation récente de droits à l\'Assurance Maladie.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.heartbeat,
    },
    {
      'id': 'd5',
      'titre': 'Acte de mariage',
      'detail': 'Original + traduction assermentée si rédigé en langue étrangère. Légalisé ou apostillé.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.ring,
    },
    {
      'id': 'd6',
      'titre': 'Actes de naissance des enfants',
      'detail': 'Actes de moins de 3 mois. Originaux + traductions assermentées si nécessaire.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.baby,
    },
    {
      'id': 'd7',
      'titre': 'Photos d\'identité récentes',
      'detail': '4 photos d\'identité récentes (moins de 3 mois) format 35x45 mm.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.camera,
    },
    {
      'id': 'd8',
      'titre': 'Formulaire OFII complété',
      'detail': 'Formulaire cerfa n°11436*07 de demande de regroupement familial, rempli et signé.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.wpforms,
    },
    {
      'id': 'd9',
      'titre': 'Passeport du demandeur',
      'detail': 'Photocopie des pages d\'identité et des visas.',
      'obligatoire': false,
      'icon': FontAwesomeIcons.passport,
    },
    {
      'id': 'd10',
      'titre': 'Justificatif d\'emploi',
      'detail': 'Contrat de travail, attestation employeur ou extrait Kbis pour les indépendants.',
      'obligatoire': false,
      'icon': FontAwesomeIcons.briefcase,
    },
  ];

  static const List<Map<String, dynamic>> _docsFamille = [
    {
      'id': 'f1',
      'titre': 'Passeports valides',
      'detail': 'Passeport valide pour chaque membre de la famille. Photocopies de toutes les pages.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.passport,
    },
    {
      'id': 'f2',
      'titre': 'Acte de mariage authentifié',
      'detail': 'Acte de mariage officiel légalisé ou apostillé par les autorités du pays d\'origine + traduction assermentée.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.ring,
    },
    {
      'id': 'f3',
      'titre': 'Actes de naissance',
      'detail': 'Actes de naissance originaux de chaque membre de la famille légalisés + traductions.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.fileAlt,
    },
    {
      'id': 'f4',
      'titre': 'Photos d\'identité',
      'detail': '4 photos d\'identité récentes (moins de 3 mois) format 35x45 mm pour chaque membre.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.camera,
    },
    {
      'id': 'f5',
      'titre': 'Certificat médical',
      'detail': 'Examen médical réalisé par un médecin agréé par les autorités consulaires françaises.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.stethoscope,
    },
    {
      'id': 'f6',
      'titre': 'Décision d\'accord de l\'OFII',
      'detail': 'Copie de la décision favorable rendue par l\'OFII transmise par le demandeur.',
      'obligatoire': true,
      'icon': FontAwesomeIcons.fileSignature,
    },
    {
      'id': 'f7',
      'titre': 'Justificatif de résidence actuelle',
      'detail': 'Document prouvant l\'adresse actuelle dans le pays d\'origine.',
      'obligatoire': false,
      'icon': FontAwesomeIcons.mapMarkerAlt,
    },
    {
      'id': 'f8',
      'titre': 'Acte de tutelle ou d\'adoption',
      'detail': 'Si applicable : jugement d\'adoption ou acte de tutelle légalisé.',
      'obligatoire': false,
      'icon': FontAwesomeIcons.gavel,
    },
    {
      'id': 'f9',
      'titre': 'Autorisation de sortie du territoire',
      'detail': 'Pour les enfants dont l\'autre parent n\'accompagne pas : autorisation parentale légalisée.',
      'obligatoire': false,
      'icon': FontAwesomeIcons.plane,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    for (final doc in _docsDemandeur) {
      _checkedDemandeur[doc['id'] as String] = false;
    }
    for (final doc in _docsFamille) {
      _checkedFamille[doc['id'] as String] = false;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get _checkedDemandeurCount =>
      _checkedDemandeur.values.where((v) => v).length;
  int get _checkedFamilleCount =>
      _checkedFamille.values.where((v) => v).length;
  int get _obligatoireDemandeur =>
      _docsDemandeur.where((d) => d['obligatoire'] == true).length;
  int get _obligatoireFamille =>
      _docsFamille.where((d) => d['obligatoire'] == true).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Documents requis',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          tabs: [
            Tab(
              text: 'Demandeur (${_checkedDemandeurCount}/${_docsDemandeur.length})',
            ),
            Tab(
              text: 'Famille (${_checkedFamilleCount}/${_docsFamille.length})',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDocumentList(
            docs: _docsDemandeur,
            checkedMap: _checkedDemandeur,
            checkedCount: _checkedDemandeurCount,
            obligatoireCount: _obligatoireDemandeur,
            description:
                'Documents à préparer par le demandeur résidant en France pour le dépôt à l\'OFII.',
          ),
          _buildDocumentList(
            docs: _docsFamille,
            checkedMap: _checkedFamille,
            checkedCount: _checkedFamilleCount,
            obligatoireCount: _obligatoireFamille,
            description:
                'Documents à rassembler par les membres de la famille dans leur pays d\'origine pour la demande de visa.',
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentList({
    List<Map<String, dynamic>> docs,
    Map<String, bool> checkedMap,
    int checkedCount,
    int obligatoireCount,
    String description,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressSummary(
            checkedCount: checkedCount,
            total: docs.length,
            obligatoire: obligatoireCount,
            description: description,
          ),
          const SizedBox(height: 16),
          _buildLegend(),
          const SizedBox(height: 16),
          ...docs.map((doc) => _buildDocCard(doc, checkedMap)),
          const SizedBox(height: 16),
          _buildImportantNote(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProgressSummary({
    int checkedCount,
    int total,
    int obligatoire,
    String description,
  }) {
    final progress = total == 0 ? 0.0 : checkedCount / total;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3474E0), Color(0xFF1A56C4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$checkedCount / $total documents',
                style: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: FlutterFlowTheme.subtitle1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white30,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: FlutterFlowTheme.bodyText2.override(
              fontFamily: 'Poppins',
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _legendItem(const Color(0xFFEA4335), 'Obligatoire'),
        const SizedBox(width: 16),
        _legendItem(const Color(0xFF757575), 'Complémentaire'),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Poppins',
            color: const Color(0xFF616161),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDocCard(Map<String, dynamic> doc, Map<String, bool> checkedMap) {
    final id = doc['id'] as String;
    final isChecked = checkedMap[id] ?? false;
    final isObligatoire = doc['obligatoire'] as bool;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: isChecked
              ? const Color(0xFFE8F5E9)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isChecked
                ? const Color(0xFF81C784)
                : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isChecked
                      ? const Color(0xFF34A853).withOpacity(0.15)
                      : FlutterFlowTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: FaIcon(
                    isChecked
                        ? FontAwesomeIcons.checkCircle
                        : doc['icon'] as IconData,
                    color: isChecked
                        ? const Color(0xFF34A853)
                        : FlutterFlowTheme.primaryColor,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            doc['titre'] as String,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: isChecked
                                  ? const Color(0xFF2E7D32)
                                  : const Color(0xFF303030),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isObligatoire
                                ? const Color(0xFFEA4335).withOpacity(0.1)
                                : const Color(0xFF757575).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            isObligatoire ? 'Obligatoire' : 'Optionnel',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Poppins',
                              color: isObligatoire
                                  ? const Color(0xFFEA4335)
                                  : const Color(0xFF757575),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doc['detail'] as String,
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF757575),
                        fontSize: 12,
                        lineHeight: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: isChecked,
                onChanged: (val) =>
                    setState(() => checkedMap[id] = val),
                activeColor: const Color(0xFF34A853),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImportantNote() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFE082)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber_outlined,
                  color: Color(0xFFF9A825), size: 18),
              const SizedBox(width: 8),
              Text(
                'Points importants',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF5D4037),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _noteItem('Tous les documents étrangers doivent être légalisés ou apostillés par les autorités du pays d\'origine.'),
          _noteItem('Les traductions doivent être effectuées par un traducteur assermenté reconnu par les tribunaux français.'),
          _noteItem('Les documents ne doivent pas dater de plus de 3 mois au moment du dépôt.'),
          _noteItem('Conservez les originaux : l\'OFII peut les demander à tout moment.'),
        ],
      ),
    );
  }

  Widget _noteItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ',
              style: TextStyle(color: Color(0xFF795548), fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFF795548),
                fontSize: 12,
                lineHeight: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisaRegroupementEligibiliteWidget extends StatefulWidget {
  const VisaRegroupementEligibiliteWidget({Key key}) : super(key: key);

  @override
  _VisaRegroupementEligibiliteWidgetState createState() =>
      _VisaRegroupementEligibiliteWidgetState();
}

class _VisaRegroupementEligibiliteWidgetState
    extends State<VisaRegroupementEligibiliteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, bool> _checklist = {
    'sejour18mois': false,
    'logement': false,
    'ressources': false,
    'assuranceMaladie': false,
    'pasOQTF': false,
  };

  int get _checkedCount => _checklist.values.where((v) => v).length;
  bool get _isEligible => _checkedCount == _checklist.length;

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
          'Vérifier mon éligibilité',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressCard(),
            const SizedBox(height: 20),
            Text(
              'Conditions du demandeur',
              style: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Cochez les conditions que vous remplissez',
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFF9E9E9E),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            _buildConditionCard(
              key: 'sejour18mois',
              icon: FontAwesomeIcons.idCard,
              iconColor: FlutterFlowTheme.primaryColor,
              title: 'Séjour régulier depuis 18 mois',
              description:
                  'Vous devez être titulaire d\'un titre de séjour valide (carte de résident ou autre) depuis au moins 18 mois à la date du dépôt de votre demande.',
              alertText: 'Exception : carte de résident de 10 ans = dépôt possible dès l\'obtention',
            ),
            _buildConditionCard(
              key: 'logement',
              icon: FontAwesomeIcons.home,
              iconColor: const Color(0xFF34A853),
              title: 'Logement suffisant',
              description:
                  'Votre logement doit avoir une surface minimum selon la composition de votre famille :\n• 1 personne : 16 m²\n• 2 personnes : 22 m²\n• Par personne supplémentaire : +9 m²',
              alertText: null,
            ),
            _buildConditionCard(
              key: 'ressources',
              icon: FontAwesomeIcons.moneyBillWave,
              iconColor: const Color(0xFFFBBC04),
              title: 'Ressources stables et suffisantes',
              description:
                  'Vos revenus doivent être au moins équivalents au SMIC net (environ 1 400 €/mois) hors aides sociales (APL, RSA). Ces ressources doivent être stables sur les 12 derniers mois.',
              alertText: 'Les allocations familiales ne sont pas comptabilisées',
            ),
            _buildConditionCard(
              key: 'assuranceMaladie',
              icon: FontAwesomeIcons.heartbeat,
              iconColor: const Color(0xFFEA4335),
              title: 'Assurance maladie',
              description:
                  'Vous devez bénéficier d\'une couverture maladie (Sécurité Sociale, complémentaire santé) qui sera étendue à votre famille lors de son arrivée en France.',
              alertText: null,
            ),
            _buildConditionCard(
              key: 'pasOQTF',
              icon: FontAwesomeIcons.shieldAlt,
              iconColor: const Color(0xFF9C27B0),
              title: 'Pas de mesure d\'éloignement',
              description:
                  'Ni vous ni les membres de votre famille ne devez faire l\'objet d\'une obligation de quitter le territoire français (OQTF) ou de tout autre mesure d\'éloignement.',
              alertText: null,
            ),
            const SizedBox(height: 20),
            _buildBeneficiairesSection(),
            const SizedBox(height: 20),
            _buildResultCard(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3474E0), Color(0xFF1A56C4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mon score d\'éligibilité',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_checkedCount / ${_checklist.length} conditions',
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _isEligible
                      ? const Color(0xFF34A853)
                      : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _isEligible ? '✓ Éligible' : 'En cours...',
                  style: FlutterFlowTheme.bodyText2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _checklist.isEmpty ? 0 : _checkedCount / _checklist.length,
              minHeight: 8,
              backgroundColor: Colors.white30,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF34A853)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConditionCard({
    String key,
    IconData icon,
    Color iconColor,
    String title,
    String description,
    String alertText,
  }) {
    final isChecked = _checklist[key] ?? false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isChecked
                ? const Color(0xFF34A853).withOpacity(0.4)
                : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: FaIcon(icon, color: iconColor, size: 18),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          description,
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFF757575),
                            fontSize: 12,
                            lineHeight: 1.5,
                          ),
                        ),
                        if (alertText != null) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF8E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.lightbulb_outline,
                                    color: Color(0xFFF9A825), size: 14),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    alertText,
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFF795548),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (val) =>
                          setState(() => _checklist[key] = val),
                      activeColor: const Color(0xFF34A853),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBeneficiairesSection() {
    final beneficiaires = [
      {
        'titre': 'Conjoint(e)',
        'icon': FontAwesomeIcons.ring,
        'color': const Color(0xFFE91E63),
        'details':
            'Époux ou épouse marié(e) légalement. Le PACS ou l\'union libre ne sont pas reconnus. Le mariage doit être antérieur d\'au moins 18 mois à la demande.',
      },
      {
        'titre': 'Enfants mineurs',
        'icon': FontAwesomeIcons.child,
        'color': FlutterFlowTheme.primaryColor,
        'details':
            'Enfants de moins de 19 ans à la date d\'entrée en France. Doivent être célibataires et à votre charge. Inclut les enfants adoptés légalement.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bénéficiaires éligibles',
          style: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: const Color(0xFF303030),
          ),
        ),
        const SizedBox(height: 12),
        ...beneficiaires.map((b) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: (b['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FaIcon(
                          b['icon'] as IconData,
                          color: b['color'] as Color,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b['titre'] as String,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            b['details'] as String,
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
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildResultCard() {
    if (_isEligible) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF81C784)),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle, color: Color(0xFF34A853), size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vous semblez éligible !',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Consultez les étapes de la procédure et préparez vos documents pour déposer votre dossier.',
                    style: FlutterFlowTheme.bodyText2.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF388E3C),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFCC80)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFFE65100), size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Cochez toutes les conditions pour vérifier votre éligibilité complète.',
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFFBF360C),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

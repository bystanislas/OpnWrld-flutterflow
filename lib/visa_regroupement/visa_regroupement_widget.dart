import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../visa_regroupement_eligibilite/visa_regroupement_eligibilite_widget.dart';
import '../visa_regroupement_etapes/visa_regroupement_etapes_widget.dart';
import '../visa_regroupement_documents/visa_regroupement_documents_widget.dart';
import '../visa_regroupement_membres/visa_regroupement_membres_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisaRegroupementWidget extends StatefulWidget {
  const VisaRegroupementWidget({Key key}) : super(key: key);

  @override
  _VisaRegroupementWidgetState createState() => _VisaRegroupementWidgetState();
}

class _VisaRegroupementWidgetState extends State<VisaRegroupementWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          'Regroupement Familial',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Que souhaitez-vous faire ?',
                style: FlutterFlowTheme.subtitle1.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF303030),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: FontAwesomeIcons.clipboardCheck,
              iconColor: const Color(0xFF34A853),
              title: 'Vérifier mon éligibilité',
              subtitle: 'Conditions requises pour faire une demande',
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const VisaRegroupementEligibiliteWidget(),
                ),
              ),
            ),
            _buildMenuCard(
              context,
              icon: FontAwesomeIcons.listOl,
              iconColor: FlutterFlowTheme.primaryColor,
              title: 'Les étapes de la procédure',
              subtitle: 'Guide complet de A à Z en 7 étapes',
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const VisaRegroupementEtapesWidget(),
                ),
              ),
            ),
            _buildMenuCard(
              context,
              icon: FontAwesomeIcons.fileAlt,
              iconColor: const Color(0xFFEA4335),
              title: 'Documents requis',
              subtitle: 'Liste complète des pièces à fournir',
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const VisaRegroupementDocumentsWidget(),
                ),
              ),
            ),
            _buildMenuCard(
              context,
              icon: FontAwesomeIcons.users,
              iconColor: const Color(0xFFFBBC04),
              title: 'Membres de la famille',
              subtitle: 'Gérer les bénéficiaires de votre demande',
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const VisaRegroupementMembresWidget(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoBanner(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3474E0), Color(0xFF1A56C4)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Visa & Immigration',
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Rejoignez votre famille\nen France',
            style: FlutterFlowTheme.title2.override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Le regroupement familial permet à un étranger résidant légalement en France de faire venir son conjoint et ses enfants mineurs.',
            style: FlutterFlowTheme.bodyText2.override(
              fontFamily: 'Poppins',
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatChip(Icons.timer_outlined, 'Délai : 6 mois'),
              const SizedBox(width: 12),
              _buildStatChip(Icons.location_on_outlined, 'Via OFII'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: FlutterFlowTheme.bodyText2.override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    IconData icon,
    Color iconColor,
    String title,
    String subtitle,
    VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: FaIcon(icon, color: iconColor, size: 22),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF9E9E9E),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFFBDBDBD),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8E1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFE082)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info_outline, color: Color(0xFFF9A825), size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bon à savoir',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF5D4037),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'La demande de regroupement familial doit être déposée auprès de l\'OFII (Office Français de l\'Immigration et de l\'Intégration) dans votre département de résidence.',
                    style: FlutterFlowTheme.bodyText2.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF795548),
                      fontSize: 12,
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
}

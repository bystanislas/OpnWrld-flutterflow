import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisaRegroupementEtapesWidget extends StatefulWidget {
  const VisaRegroupementEtapesWidget({Key key}) : super(key: key);

  @override
  _VisaRegroupementEtapesWidgetState createState() =>
      _VisaRegroupementEtapesWidgetState();
}

class _VisaRegroupementEtapesWidgetState
    extends State<VisaRegroupementEtapesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _expandedIndex = 0;

  static const List<Map<String, dynamic>> _etapes = [
    {
      'numero': '01',
      'titre': 'Vérification des conditions',
      'duree': '1-2 semaines',
      'icon': FontAwesomeIcons.clipboardCheck,
      'color': Color(0xFF3474E0),
      'details': [
        'Vérifiez que vous remplissez toutes les conditions d\'éligibilité (séjour de 18 mois, logement, ressources, assurance maladie).',
        'Rassemblez les informations sur les membres de votre famille qui souhaitent vous rejoindre.',
        'Consultez un conseiller juridique ou l\'OFII pour confirmer votre situation.',
      ],
      'conseil':
          'Utilisez notre outil de vérification d\'éligibilité dans l\'application pour commencer.',
    },
    {
      'numero': '02',
      'titre': 'Constitution du dossier',
      'duree': '2-4 semaines',
      'icon': FontAwesomeIcons.fileAlt,
      'color': Color(0xFF9C27B0),
      'details': [
        'Collectez tous les documents requis (titre de séjour, justificatifs de revenus, justificatif de domicile, actes d\'état civil).',
        'Faites légaliser ou apostiller les documents étrangers par les autorités compétentes.',
        'Faites traduire les documents par un traducteur assermenté si nécessaire.',
        'Préparez les photos d\'identité des membres de la famille.',
      ],
      'conseil':
          'Consultez notre liste complète des documents requis dans la section dédiée.',
    },
    {
      'numero': '03',
      'titre': 'Dépôt de la demande à l\'OFII',
      'duree': '1 jour',
      'icon': FontAwesomeIcons.building,
      'color': Color(0xFF34A853),
      'details': [
        'Déposez votre dossier complet à la direction territoriale de l\'OFII compétente pour votre lieu de résidence.',
        'Vous pouvez également déposer votre demande en ligne sur le portail de l\'OFII (ofii.fr).',
        'Obtenez un récépissé de dépôt avec la date et le numéro de votre dossier.',
        'Conservez précieusement ce récépissé : il vous sera demandé tout au long de la procédure.',
      ],
      'conseil':
          'Prenez rendez-vous à l\'avance à l\'OFII pour éviter les longues attentes.',
    },
    {
      'numero': '04',
      'titre': 'Instruction du dossier',
      'duree': 'Jusqu\'à 6 mois',
      'icon': FontAwesomeIcons.search,
      'color': Color(0xFFFBBC04),
      'details': [
        'L\'OFII instruit votre demande et vérifie votre logement (visite possible par un agent).',
        'La mairie de votre commune est consultée pour vérifier que votre logement est conforme aux normes.',
        'L\'OFII peut vous demander des documents complémentaires pendant l\'instruction.',
        'Vous recevez une décision dans un délai maximum de 6 mois après le dépôt du dossier complet.',
      ],
      'conseil':
          'Soyez disponible pour la visite de l\'agent OFII et répondez rapidement aux demandes de pièces complémentaires.',
    },
    {
      'numero': '05',
      'titre': 'Notification de la décision',
      'duree': '2-4 semaines',
      'icon': FontAwesomeIcons.envelope,
      'color': Color(0xFFEA4335),
      'details': [
        'L\'OFII vous notifie la décision par courrier (accord ou refus motivé).',
        'En cas d\'accord, l\'OFII transmet la décision aux autorités consulaires françaises du pays de résidence de votre famille.',
        'En cas de refus, vous pouvez former un recours gracieux auprès de l\'OFII ou un recours contentieux devant le tribunal administratif.',
      ],
      'conseil':
          'Gardez votre adresse à jour auprès de l\'OFII pour recevoir la notification à temps.',
    },
    {
      'numero': '06',
      'titre': 'Visa long séjour pour la famille',
      'duree': '2-3 mois',
      'icon': FontAwesomeIcons.passport,
      'color': Color(0xFF00BCD4),
      'details': [
        'Votre famille dépose une demande de visa de long séjour au consulat français de leur pays de résidence.',
        'Chaque membre doit se présenter en personne avec les documents requis (décision d\'accord OFII, passeport, photos, etc.).',
        'Les enfants de moins de 12 ans bénéficient d\'une visite médicale simplifiée.',
        'Un examen médical OFII est réalisé pour les membres de la famille.',
      ],
      'conseil':
          'Prenez rendez-vous au consulat dès que vous avez reçu l\'accord de l\'OFII.',
    },
    {
      'numero': '07',
      'titre': 'Arrivée en France & titre de séjour',
      'duree': '1-3 mois',
      'icon': FontAwesomeIcons.planeLanding,
      'color': Color(0xFF4CAF50),
      'details': [
        'Votre famille entre en France avec le visa de long séjour valant titre de séjour (VLS-TS).',
        'Dans les 3 mois suivant l\'arrivée, chaque membre doit valider son visa sur le site de l\'OFII (timbrefiscal.impots.gouv.fr).',
        'Une convocation pour un bilan de santé et une journée d\'accueil sera envoyée par l\'OFII.',
        'Après validation, votre famille peut travailler, étudier et accéder aux services publics en France.',
        'Au bout d\'un an, demandez le renouvellement du titre de séjour en préfecture.',
      ],
      'conseil':
          'La validation du visa dans les 3 mois est OBLIGATOIRE sous peine d\'invalidation du titre.',
    },
  ];

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
          'Étapes de la procédure',
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
          children: [
            _buildDurationBanner(),
            const SizedBox(height: 20),
            ...List.generate(
              _etapes.length,
              (index) => _buildEtapeCard(index),
            ),
            const SizedBox(height: 20),
            _buildContactOfii(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3474E0), Color(0xFF1A56C4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.route,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7 étapes • 6 à 12 mois',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Durée variable selon votre situation et le délai de traitement de l\'OFII',
                  style: FlutterFlowTheme.bodyText2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white70,
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

  Widget _buildEtapeCard(int index) {
    final etape = _etapes[index];
    final isExpanded = _expandedIndex == index;
    final color = etape['color'] as Color;
    final isLast = index == _etapes.length - 1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isExpanded ? color : color.withOpacity(0.15),
                shape: BoxShape.circle,
                boxShadow: isExpanded
                    ? [
                        BoxShadow(
                          color: color.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: FaIcon(
                  etape['icon'] as IconData,
                  color: isExpanded ? Colors.white : color,
                  size: 18,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: isExpanded ? null : 40,
                constraints: BoxConstraints(
                  minHeight: isExpanded ? 60 : 40,
                ),
                color: color.withOpacity(0.25),
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GestureDetector(
              onTap: () =>
                  setState(() => _expandedIndex = isExpanded ? -1 : index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isExpanded ? color.withOpacity(0.5) : Colors.transparent,
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
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Étape ${etape['numero']}',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Poppins',
                                color: color,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              etape['titre'] as String,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: const Color(0xFFBDBDBD),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    if (!isExpanded)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 13, color: Color(0xFF9E9E9E)),
                            const SizedBox(width: 4),
                            Text(
                              etape['duree'] as String,
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Poppins',
                                color: const Color(0xFF9E9E9E),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (isExpanded) ...[
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.access_time,
                                    size: 14, color: Color(0xFF757575)),
                                const SizedBox(width: 6),
                                Text(
                                  'Durée estimée : ${etape['duree']}',
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFF757575),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ...(etape['details'] as List<String>)
                                .map((detail) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 6,
                                            height: 6,
                                            margin: const EdgeInsets.only(
                                                top: 5, right: 10),
                                            decoration: BoxDecoration(
                                              color: color,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              detail,
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: const Color(0xFF616161),
                                                fontSize: 13,
                                                lineHeight: 1.5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: color.withOpacity(0.2)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.lightbulb,
                                    color: color,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      etape['conseil'] as String,
                                      style: FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Poppins',
                                        color: color.withOpacity(0.8),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactOfii() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF90CAF9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.phone,
                color: Color(0xFF1565C0),
                size: 16,
              ),
              const SizedBox(width: 10),
              Text(
                'Contacter l\'OFII',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1565C0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildContactRow(Icons.language, 'Site web', 'www.ofii.fr'),
          const SizedBox(height: 6),
          _buildContactRow(Icons.phone, 'Téléphone', '01 53 69 53 70'),
          const SizedBox(height: 6),
          _buildContactRow(
              Icons.location_on,
              'Adresse nationale',
              '44 rue Bargue, 75015 Paris'),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF42A5F5)),
        const SizedBox(width: 8),
        Text(
          '$label : ',
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Poppins',
            color: const Color(0xFF546E7A),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: FlutterFlowTheme.bodyText2.override(
              fontFamily: 'Poppins',
              color: const Color(0xFF1565C0),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

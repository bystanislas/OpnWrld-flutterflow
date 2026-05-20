import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum StatutDossier { enCours, approuve, rejete, enAttente }

class MembreFamille {
  final String id;
  String prenom;
  String nom;
  String lienFamilial;
  String dateNaissance;
  String numeroPasport;
  String paysResidence;
  StatutDossier statut;

  MembreFamille({
    this.id,
    this.prenom = '',
    this.nom = '',
    this.lienFamilial = 'Conjoint(e)',
    this.dateNaissance = '',
    this.numeroPasport = '',
    this.paysResidence = '',
    this.statut = StatutDossier.enAttente,
  });
}

class VisaRegroupementMembresWidget extends StatefulWidget {
  const VisaRegroupementMembresWidget({Key key}) : super(key: key);

  @override
  _VisaRegroupementMembresWidgetState createState() =>
      _VisaRegroupementMembresWidgetState();
}

class _VisaRegroupementMembresWidgetState
    extends State<VisaRegroupementMembresWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<MembreFamille> _membres = [];

  static const List<String> _liensOptions = [
    'Conjoint(e)',
    'Enfant',
    'Autre',
  ];

  static const Map<StatutDossier, Map<String, dynamic>> _statutConfig = {
    StatutDossier.enAttente: {
      'label': 'En attente',
      'color': Color(0xFF9E9E9E),
      'bgColor': Color(0xFFF5F5F5),
      'icon': Icons.hourglass_empty,
    },
    StatutDossier.enCours: {
      'label': 'En cours',
      'color': Color(0xFFFBBC04),
      'bgColor': Color(0xFFFFF8E1),
      'icon': Icons.sync,
    },
    StatutDossier.approuve: {
      'label': 'Approuvé',
      'color': Color(0xFF34A853),
      'bgColor': Color(0xFFE8F5E9),
      'icon': Icons.check_circle_outline,
    },
    StatutDossier.rejete: {
      'label': 'Refusé',
      'color': Color(0xFFEA4335),
      'bgColor': Color(0xFFFFEBEE),
      'icon': Icons.cancel_outlined,
    },
  };

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
          'Membres de la famille',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          if (_membres.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white, size: 26),
              onPressed: () => _showAddMemberDialog(context),
            ),
        ],
      ),
      floatingActionButton: _membres.isEmpty
          ? null
          : FloatingActionButton.extended(
              backgroundColor: FlutterFlowTheme.primaryColor,
              onPressed: () => _showAddMemberDialog(context),
              icon: const Icon(Icons.person_add, color: Colors.white),
              label: Text(
                'Ajouter',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
      body: _membres.isEmpty ? _buildEmptyState(context) : _buildMembersList(),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: FlutterFlowTheme.primaryColor,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Aucun membre ajouté',
              style: FlutterFlowTheme.subtitle1.override(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Ajoutez les membres de votre famille que vous souhaitez faire venir en France pour suivre leur dossier.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFF9E9E9E),
                fontSize: 13,
                lineHeight: 1.6,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.person_add, color: Colors.white),
              label: Text(
                'Ajouter un membre',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => _showAddMemberDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembersList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryCard(),
          const SizedBox(height: 20),
          Text(
            '${_membres.length} bénéficiaire${_membres.length > 1 ? 's' : ''}',
            style: FlutterFlowTheme.subtitle2.override(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF303030),
            ),
          ),
          const SizedBox(height: 12),
          ..._membres.asMap().entries.map((entry) =>
              _buildMemberCard(entry.value, entry.key)),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    final approuves = _membres
        .where((m) => m.statut == StatutDossier.approuve)
        .length;
    final enCours = _membres
        .where((m) => m.statut == StatutDossier.enCours)
        .length;
    final enAttente = _membres
        .where((m) => m.statut == StatutDossier.enAttente)
        .length;

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suivi du dossier',
                style: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${_membres.length} personne${_membres.length > 1 ? 's' : ''}',
                style: FlutterFlowTheme.bodyText2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryItem('Approuvés', approuves, const Color(0xFF34A853)),
              _buildSummaryItem('En cours', enCours, const Color(0xFFFBBC04)),
              _buildSummaryItem('En attente', enAttente, Colors.white54),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          '$count',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Poppins',
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Poppins',
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildMemberCard(MembreFamille membre, int index) {
    final statutInfo = _statutConfig[membre.statut];
    final color = statutInfo['color'] as Color;
    final bgColor = statutInfo['bgColor'] as Color;
    final icon = statutInfo['icon'] as IconData;
    final label = statutInfo['label'] as String;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
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
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor:
                        FlutterFlowTheme.primaryColor.withOpacity(0.1),
                    child: Text(
                      membre.prenom.isNotEmpty
                          ? membre.prenom[0].toUpperCase()
                          : '?',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${membre.prenom} ${membre.nom}'.trim().isEmpty
                              ? 'Nom non renseigné'
                              : '${membre.prenom} ${membre.nom}'.trim(),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          membre.lienFamilial,
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, color: color, size: 13),
                        const SizedBox(width: 5),
                        Text(
                          label,
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Poppins',
                            color: color,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (membre.dateNaissance.isNotEmpty ||
                membre.paysResidence.isNotEmpty ||
                membre.numeroPasport.isNotEmpty) ...[
              const Divider(height: 1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    if (membre.dateNaissance.isNotEmpty)
                      _buildInfoRow(
                          Icons.cake_outlined, 'Né(e) le', membre.dateNaissance),
                    if (membre.paysResidence.isNotEmpty)
                      _buildInfoRow(Icons.location_on_outlined,
                          'Pays de résidence', membre.paysResidence),
                    if (membre.numeroPasport.isNotEmpty)
                      _buildInfoRow(FontAwesomeIcons.passport,
                          'N° passeport', membre.numeroPasport,
                          isFa: true),
                  ],
                ),
              ),
            ],
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.edit_outlined,
                        size: 16, color: Color(0xFF757575)),
                    label: Text(
                      'Modifier',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF757575),
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () =>
                        _showEditMemberDialog(context, membre, index),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    icon: const Icon(Icons.sync_outlined,
                        size: 16, color: Color(0xFF3474E0)),
                    label: Text(
                      'Statut',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () => _showStatutDialog(context, membre, index),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete_outline,
                        size: 16, color: Color(0xFFEA4335)),
                    label: Text(
                      'Supprimer',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFEA4335),
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () => _confirmDelete(context, index),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(dynamic icon, String label, String value,
      {bool isFa = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          isFa
              ? FaIcon(icon as IconData,
                  size: 12, color: const Color(0xFF9E9E9E))
              : Icon(icon as IconData,
                  size: 14, color: const Color(0xFF9E9E9E)),
          const SizedBox(width: 8),
          Text(
            '$label : ',
            style: FlutterFlowTheme.bodyText2.override(
              fontFamily: 'Poppins',
              color: const Color(0xFF9E9E9E),
              fontSize: 12,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFF424242),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddMemberDialog(BuildContext context) {
    final membre = MembreFamille(
        id: DateTime.now().millisecondsSinceEpoch.toString());
    _showMemberFormDialog(
      context,
      membre: membre,
      titre: 'Ajouter un membre',
      onSave: () => setState(() => _membres.add(membre)),
    );
  }

  void _showEditMemberDialog(
      BuildContext context, MembreFamille membre, int index) {
    _showMemberFormDialog(
      context,
      membre: membre,
      titre: 'Modifier le membre',
      onSave: () => setState(() {}),
    );
  }

  void _showMemberFormDialog(
    BuildContext context, {
    MembreFamille membre,
    String titre,
    VoidCallback onSave,
  }) {
    final prenomCtrl = TextEditingController(text: membre.prenom);
    final nomCtrl = TextEditingController(text: membre.nom);
    final dateCtrl = TextEditingController(text: membre.dateNaissance);
    final passCtrl = TextEditingController(text: membre.numeroPasport);
    final paysCtrl = TextEditingController(text: membre.paysResidence);
    String selectedLien = membre.lienFamilial;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      titre,
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Lien de parenté'),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedLien,
                            isExpanded: true,
                            items: _liensOptions
                                .map((l) => DropdownMenuItem(
                                      value: l,
                                      child: Text(l),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setModalState(() => selectedLien = val);
                              membre.lienFamilial = val;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildField('Prénom', prenomCtrl,
                          (v) => membre.prenom = v),
                      _buildField('Nom de famille', nomCtrl,
                          (v) => membre.nom = v),
                      _buildField(
                          'Date de naissance (JJ/MM/AAAA)',
                          dateCtrl,
                          (v) => membre.dateNaissance = v,
                          hint: 'ex. 15/06/1990'),
                      _buildField(
                          'Pays de résidence actuel',
                          paysCtrl,
                          (v) => membre.paysResidence = v,
                          hint: 'ex. Maroc'),
                      _buildField(
                          'Numéro de passeport',
                          passCtrl,
                          (v) => membre.numeroPasport = v,
                          hint: 'ex. AB123456'),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: FlutterFlowTheme.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            membre.prenom = prenomCtrl.text;
                            membre.nom = nomCtrl.text;
                            membre.dateNaissance = dateCtrl.text;
                            membre.numeroPasport = passCtrl.text;
                            membre.paysResidence = paysCtrl.text;
                            onSave();
                            Navigator.pop(ctx);
                          },
                          child: Text(
                            'Enregistrer',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: FlutterFlowTheme.bodyText1.override(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: const Color(0xFF424242),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller,
      void Function(String) onChanged,
      {String hint}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(label),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            onChanged: onChanged,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFFBDBDBD),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: FlutterFlowTheme.primaryColor, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showStatutDialog(
      BuildContext context, MembreFamille membre, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Changer le statut',
          style: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: StatutDossier.values.map((statut) {
            final info = _statutConfig[statut];
            final color = info['color'] as Color;
            final icon = info['icon'] as IconData;
            final label = info['label'] as String;
            final isSelected = membre.statut == statut;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() => _membres[index].statut = statut);
                  Navigator.pop(ctx);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color.withOpacity(0.1)
                        : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? color : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: color, size: 18),
                      const SizedBox(width: 12),
                      Text(
                        label,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: color,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.normal,
                        ),
                      ),
                      if (isSelected) ...[
                        const Spacer(),
                        Icon(Icons.check, color: color, size: 18),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Supprimer ce membre ?',
          style: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Cette action est irréversible. Voulez-vous vraiment supprimer ce membre de votre liste ?',
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Poppins',
            color: const Color(0xFF757575),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Annuler',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: const Color(0xFF757575),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() => _membres.removeAt(index));
              Navigator.pop(ctx);
            },
            child: Text(
              'Supprimer',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: const Color(0xFFEA4335),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

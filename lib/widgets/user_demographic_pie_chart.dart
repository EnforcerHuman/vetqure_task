// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:vetqure_task/widgets/common/section_header.dart';

// class UserDemographicsPieChart extends StatelessWidget {
//   const UserDemographicsPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isLandscape = constraints.maxWidth > constraints.maxHeight;
//         final size = isLandscape
//             ? constraints.maxHeight * 0.8
//             : constraints.maxWidth * 0.8;
//         var media = MediaQuery.of(context).size;
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SizedBox(
//             height: media.height * 0.5,
//             child: Card(
//               color: Colors.white,
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     SectionHeader(
//                       title: 'User Demographics',
//                     ),
//                     const SizedBox(height: 16),
//                     _buildChartAndLegend(size, isLandscape),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildChartAndLegend(double size, bool isLandscape) {
//     final chartSize = size * 0.6;

//     if (isLandscape) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildPieChart(chartSize),
//           _buildLegend(),
//         ],
//       );
//     } else {
//       return Column(
//         children: [
//           _buildPieChart(chartSize),
//           const SizedBox(height: 24),
//           _buildLegend(),
//         ],
//       );
//     }
//   }

//   Widget _buildPieChart(double size) {
//     return SizedBox(
//       width: 0,
//       height: 0,
//       child: PieChart(
//         PieChartData(
//           sectionsSpace: 0,
//           centerSpaceRadius: size * 0.1,
//           sections: _getSections(size),
//         ),
//       ),
//     );
//   }

//   Widget _buildLegend() {
//     return Wrap(
//       spacing: 16,
//       runSpacing: 8,
//       alignment: WrapAlignment.center,
//       children: [
//         _buildLegendItem(Colors.green, 'Pattom'),
//         _buildLegendItem(Colors.pink[200]!, 'Thampanoor'),
//         _buildLegendItem(Colors.purple[300]!, 'Kowdiar'),
//       ],
//     );
//   }

//   List<PieChartSectionData> _getSections(double size) {
//     return [
//       _buildSection(Colors.purple[300]!, 35, size),
//       _buildSection(Colors.pink[200]!, 25, size),
//       _buildSection(Colors.green, 50, size),
//     ];
//   }

//   PieChartSectionData _buildSection(Color color, double value, double size) {
//     return PieChartSectionData(
//       color: color,
//       value: value,
//       title: '${value.toInt()}%',
//       radius: size * 0.4,
//       titleStyle: TextStyle(
//         fontSize: size * 0.05,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     );
//   }

//   Widget _buildLegendItem(Color color, String label) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 16,
//           height: 16,
//           decoration: BoxDecoration(
//             color: color,
//             shape: BoxShape.circle,
//           ),
//         ),
//         const SizedBox(width: 4),
//         Text(label),
//       ],
//     );
//   }
// }

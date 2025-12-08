import 'dart:math';
import 'package:flutter/material.dart';
import '../../constants.dart';

class SocialGraphScreen extends StatefulWidget {
  final VoidCallback onClose;
  const SocialGraphScreen({super.key, required this.onClose});

  @override
  State<SocialGraphScreen> createState() => _SocialGraphScreenState();
}

class _SocialGraphScreenState extends State<SocialGraphScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Point3D> _points = [];
  double _rotationX = 0;
  double _rotationY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _initPoints();
  }

  void _initPoints() {
    const numPoints = 50;
    final phi = pi * (3 - sqrt(5)); // Golden angle

    for (int i = 0; i < numPoints; i++) {
      final y = 1 - (i / (numPoints - 1)) * 2;
      final radius = sqrt(1 - y * y);
      final theta = phi * i;
      final x = cos(theta) * radius;
      final z = sin(theta) * radius;

      _points.add(
        Point3D(
          x: x * 150,
          y: y * 150,
          z: z * 150,
          color: HSLColor.fromAHSL(
            1.0,
            Random().nextDouble() * 360,
            0.7,
            0.5,
          ).toColor(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xFF2A1A4A), Color(0xFF121212)],
          radius: 1.0,
        ),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _rotationY += details.delta.dx * 0.01;
                _rotationX -= details.delta.dy * 0.01;
              });
            },
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Auto rotate slowly + manual rotation
                final autoRot = _controller.value * 2 * pi;
                return CustomPaint(
                  painter: GraphPainter(
                    _points,
                    _rotationX,
                    _rotationY + autoRot,
                  ),
                  size: Size.infinite,
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Global Network",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "Swipe to rotate",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: widget.onClose,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Close Map",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Point3D {
  double x, y, z;
  final Color color;
  Point3D({
    required this.x,
    required this.y,
    required this.z,
    required this.color,
  });
}

class GraphPainter extends CustomPainter {
  final List<Point3D> points;
  final double rotationX;
  final double rotationY;

  GraphPainter(this.points, this.rotationX, this.rotationY);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Project points
    final projected = points.map((p) {
      // Rotate Y
      final cosY = cos(rotationY);
      final sinY = sin(rotationY);
      final x1 = p.x * cosY - p.z * sinY;
      final z1 = p.z * cosY + p.x * sinY;

      // Rotate X
      final cosX = cos(rotationX);
      final sinX = sin(rotationX);
      final y2 = p.y * cosX - z1 * sinX;
      final z2 = z1 * cosX + p.y * sinX;

      // Perspective
      final scale = 400 / (400 - z2);
      final x2d = x1 * scale + centerX;
      final y2d = y2 * scale + centerY;

      return _ProjectedPoint(x2d, y2d, z2, scale, p.color);
    }).toList();

    // Sort by Z (painters algorithm)
    projected.sort((a, b) => a.z.compareTo(b.z));

    // Draw lines (connections) - simplified for performance: just connect random nearby
    final linePaint = Paint()
      ..color = AppTheme.secondary.withOpacity(0.2)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw generic connections
    for (int i = 0; i < projected.length; i++) {
      for (int j = i + 1; j < projected.length; j++) {
        final dist =
            (projected[i].dx - projected[j].dx).abs() +
            (projected[i].dy - projected[j].dy).abs();
        if (dist < 80) {
          canvas.drawLine(
            Offset(projected[i].dx, projected[i].dy),
            Offset(projected[j].dx, projected[j].dy),
            linePaint,
          );
        }
      }
    }

    // Draw Nodes
    for (final p in projected) {
      final nodeRadius = 4 * p.scale;
      final paint = Paint()..color = p.color;
      canvas.drawCircle(Offset(p.dx, p.dy), nodeRadius, paint);

      // Glow if in front
      if (p.z > -50) {
        final glowPaint = Paint()
          ..color = Colors.white.withOpacity(0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * p.scale;
        canvas.drawCircle(Offset(p.dx, p.dy), nodeRadius, glowPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _ProjectedPoint {
  final double dx, dy, z, scale;
  final Color color;
  _ProjectedPoint(this.dx, this.dy, this.z, this.scale, this.color);
}

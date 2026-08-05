import 'package:flutter/material.dart';

import 'package:fog_edge_blur/fog_edge_blur.dart';
import 'package:fog_edge_blur/fog_edge_child.dart';

class TopEdgeBlur extends StatelessWidget {
  const TopEdgeBlur({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FogEdgeBlur(
      edgeAlign: EdgeAlign.top,
      fogEdgeChild: FogEdgeChild(
        heightEdge: MediaQuery.of(context).padding.top + 4,
        colorEdge: Colors.black26
      ),
      child: child,
    );
  }
}

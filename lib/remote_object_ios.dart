import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class RemoteObjectIOS extends StatefulWidget {
  @override
  _RemoteObjectIOSState createState() => _RemoteObjectIOSState();
}

class _RemoteObjectIOSState extends State<RemoteObjectIOS> {
  ARKitController arkitController;
  ARKitReferenceNode node;
  String anchorId;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Custom object on plane Sample')),
        body: Container(
          child: ARKitSceneView(
            showFeaturePoints: true,
            planeDetection: ARPlaneDetection.horizontal,
            onARKitViewCreated: onARKitViewCreated,
          ),
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitPlaneAnchor) {
      _addPlane(arkitController, anchor);
    }
  }

  void _addPlane(ARKitController controller, ARKitPlaneAnchor anchor) {
    anchorId = anchor.identifier;
    if (node != null) {
      controller.remove(node.name);
    }
    node = ARKitReferenceNode(
      url: 'models.scnassets/dash.dae',
      scale: vector.Vector3.all(0.3),
    );
    controller.add(node, parentNodeName: anchor.nodeName);
  }
}

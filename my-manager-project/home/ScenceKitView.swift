import SwiftUI
import SceneKit // 3d model

struct ScenceKitView: View {
    @State var scene: SCNScene = {
        let scene: SCNScene
        
        // load object
        let filePath = "../scnassets/piggybank_base.obj"
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            scene = try SCNScene(url: fileURL, options: nil)
            print("SCNScene load successed")
        } catch {
            fatalError("SCNScene load failed: \(error.localizedDescription)")
        }
        
        
        // camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene.rootNode.addChildNode(cameraNode)
                
        return scene
    }()
    
    var body: some View {
        SceneView(
            scene: scene,
            pointOfView: scene.rootNode.childNodes.first(where: { $0.camera != nil }),
            options: [ .autoenablesDefaultLighting, .temporalAntialiasingEnabled ]
        )
        .border(.black, width: 3)
    }
}



#Preview {
    ScenceKitView()
}


    import XCTest
    @testable import SwiftAlgorithms
    
    class Tree: TreeParentable, Hashable {
        var children = [Tree]()
        var id: String
        
        init(_ id: String) {
            self.id = id
        }
        
        static func == (lhs: Tree, rhs: Tree) -> Bool {
            lhs === rhs
        }

        func hash(into hasher: inout Hasher) {
            ObjectIdentifier(self).hash(into: &hasher)
        }
    }

    final class SwiftTreeTests: XCTestCase {
        func testTree() {
            let tree = Tree("root")
            tree.children.append(Tree("child1"))
            tree.children.append(Tree("child2"))
            
            var count = 0
            tree.forEach{// _ in
                print($0.id)
                count += 1
            }
            XCTAssertEqual(count, 3)
        }
    }

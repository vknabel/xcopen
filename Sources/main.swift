import Foundation
import PathKit
import Commandant

let main = CommandRegistry<OpenError>()
main.register(OpenAllCommand())
main.register(OpenWorkCommand())
main.register(OpenProjectCommand())
main.register(OpenPackageCommand())
main.register(HelpCommand(registry: main))

main.main(defaultVerb: "all") { (error: OpenError) in
    print("❌ \(error.localizedDescription)")
    exit(1)
}

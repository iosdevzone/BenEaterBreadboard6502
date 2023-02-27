import Foundation 

let noop = UInt8(0xea)
let romSize = 0x8000
let romImage = Data(repeating: noop, count: romSize)
assert(romImage.count == 32768)
guard let desktop = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first else {
    fatalError("Failed to get URL for desktop.")
    
}
let outputURL = desktop.appending(path: "noop_rom.bin")
do {
    try romImage.write(to: outputURL)
    print("Wrote ROM image to \(outputURL)")
}
catch {
    fatalError("Failed to write ROM to \(outputURL).\nError: \(error)")
}

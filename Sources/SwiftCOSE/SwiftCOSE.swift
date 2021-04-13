@testable import SwiftCBOR
@testable import GRPC
@testable import NIO

struct SwiftCOSE {
    var text = "Hello, World!"
}

extension String {
    func fromBase45()->Data {
        let BASE45_CHARSET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:"
        var d = Data()
        var o = Data()
        
        for c in self {
            if let at = BASE45_CHARSET.firstIndex(of: c) {
                let idx  = BASE45_CHARSET.distance(from: BASE45_CHARSET.startIndex, to: at)
                d.append(UInt8(idx))
                }
        }
        for i in stride(from:0, to:d.count, by: 3) {
            var x : UInt32 = UInt32(d[i]) + UInt32(d[i+1])*45
            if (d.count - i >= 3) {
                x += 45 * 45 * UInt32(d[i+2])
                o.append(UInt8(x / 256))
                o.append(UInt8(x % 256))
            } else {
                o.append(UInt8(x % 256))
            }
        }
        return o
    }

}

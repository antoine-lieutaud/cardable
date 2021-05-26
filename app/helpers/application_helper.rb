require "rqrcode"
module ApplicationHelper
    def qr_code_to_svg(qr)
        qrcode = RQRCode::QRCode.new(qr)
        svg = qrcode.as_svg(
            color: "000",
            shape_rendering: "crispEdges",
            module_size: 11,
            standalone: true,
            use_path: true
       ).html_safe
    end
end

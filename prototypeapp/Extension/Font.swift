//
//  Font.swift
//  prototypeapp
//
//  Created by Constantin Senila on 04.04.2023.
//

import SwiftUI

extension Font {
    // Font names = = [["Verdana", "Verdana-Italic", "Verdana-Bold",
    static func verdanItalic33() -> Font {
        Font.custom("Verdana-Italic", size: 33)
    }
    
    static func verdan50() -> Font {
        Font.custom("Verdana", size: 50)
    }
    static func verdan45() -> Font {
        Font.custom("Verdana", size: 45)
    }
    
    static func verdan30() -> Font {
        Font.custom("Verdana", size: 30)
    }
    
    static func verdan35() -> Font {
        Font.custom("Verdana", size: 35)
    }
    
    static func verdan20() -> Font {
        Font.custom("Verdana", size: 20)
    }
    
    static func verdan25() -> Font {
        Font.custom("Verdana", size: 25)
    }
    
    static func verdan15() -> Font {
        Font.custom("Verdana", size: 15)
    }
    
    static func timesNewRoman35() -> Font {
        Font.custom("TimesNewRomanPSMT", size: 35)
    }
    
    static func timesNewRoman60() -> Font {
        Font.custom("TimesNewRomanPSMT", size: 60)
    }
    
    static func timesNewRoman45() -> Font {
        Font.custom("TimesNewRomanPSMT", size: 45)
    }
    
    static func timesNewRomanBold35() -> Font {
        Font.custom("TimesNewRomanPS-BoldMT", size: 35)
    }
    
    static func timesNewRomanItalic35() -> Font {
        Font.custom("TimesNewRomanPS-ItalicMT", size: 35)
    }
    
    static func timesNewRomanItalic40() -> Font {
        Font.custom("TimesNewRomanPS-ItalicMT", size: 40)
    }
    
    static func timesNewRomanBoldItalic35() -> Font {
        Font.custom("TimesNewRomanPS-BoldItalicMT", size: 35)
    }
    
}

//--------
//Font Family name -> [Avenir]
//Font names = = [["Avenir-Book", "Avenir-Roman", "Avenir-BookOblique", "Avenir-Oblique", "Avenir-Light", "Avenir-LightOblique", "Avenir-Medium", "Avenir-MediumOblique", "Avenir-Heavy", "Avenir-HeavyOblique", "Avenir-Black", "Avenir-BlackOblique"]]
//- - - - - -
//- - - - - -
//Font Family name -> [Academy Engraved LET]
//Font names = = [["AcademyEngravedLetPlain"]]
//- - - - - -
//Font Family name -> [Al Nile]
//Font names = = [["AlNile", "AlNile-Bold"]]
//- - - - - -
//Font Family name -> [American Typewriter]
//Font names = = [["AmericanTypewriter", "AmericanTypewriter-Light", "AmericanTypewriter-Semibold", "AmericanTypewriter-Bold", "AmericanTypewriter-Condensed", "AmericanTypewriter-CondensedLight", "AmericanTypewriter-CondensedBold"]]
//- - - - - -
//Font Family name -> [Apple Color Emoji]
//Font names = = [["AppleColorEmoji"]]
//- - - - - -
//Font Family name -> [Apple SD Gothic Neo]
//Font names = = [["AppleSDGothicNeo-Regular", "AppleSDGothicNeo-Thin", "AppleSDGothicNeo-UltraLight", "AppleSDGothicNeo-Light", "AppleSDGothicNeo-Medium", "AppleSDGothicNeo-SemiBold", "AppleSDGothicNeo-Bold"]]
//- - - - - -
//Font Family name -> [Apple Symbols]
//Font names = = [["AppleSymbols"]]
//- - - - - -
//Font Family name -> [Arial]
//Font names = = [["ArialMT", "Arial-ItalicMT", "Arial-BoldMT", "Arial-BoldItalicMT"]]
//- - - - - -
//Font Family name -> [Arial Hebrew]
//Font names = = [["ArialHebrew", "ArialHebrew-Light", "ArialHebrew-Bold"]]
//- - - - - -
//Font Family name -> [Arial Rounded MT Bold]
//Font names = = [["ArialRoundedMTBold"]]
//- - - - - -

//Font Family name -> [Avenir Next]
//Font names = = [["AvenirNext-Regular", "AvenirNext-Italic", "AvenirNext-UltraLight", "AvenirNext-UltraLightItalic", "AvenirNext-Medium", "AvenirNext-MediumItalic", "AvenirNext-DemiBold", "AvenirNext-DemiBoldItalic", "AvenirNext-Bold", "AvenirNext-BoldItalic", "AvenirNext-Heavy", "AvenirNext-HeavyItalic"]]
//- - - - - -
//Font Family name -> [Avenir Next Condensed]
//Font names = = [["AvenirNextCondensed-Regular", "AvenirNextCondensed-Italic", "AvenirNextCondensed-UltraLight", "AvenirNextCondensed-UltraLightItalic", "AvenirNextCondensed-Medium", "AvenirNextCondensed-MediumItalic", "AvenirNextCondensed-DemiBold", "AvenirNextCondensed-DemiBoldItalic", "AvenirNextCondensed-Bold", "AvenirNextCondensed-BoldItalic", "AvenirNextCondensed-Heavy", "AvenirNextCondensed-HeavyItalic"]]
//- - - - - -
//Font Family name -> [Baskerville]
//Font names = = [["Baskerville", "Baskerville-Italic", "Baskerville-SemiBold", "Baskerville-SemiBoldItalic", "Baskerville-Bold", "Baskerville-BoldItalic"]]
//- - - - - -
//Font Family name -> [Bodoni 72]
//Font names = = [["BodoniSvtyTwoITCTT-Book", "BodoniSvtyTwoITCTT-BookIta", "BodoniSvtyTwoITCTT-Bold"]]
//- - - - - -
//Font Family name -> [Bodoni 72 Oldstyle]
//Font names = = [["BodoniSvtyTwoOSITCTT-Book", "BodoniSvtyTwoOSITCTT-BookIt", "BodoniSvtyTwoOSITCTT-Bold"]]
//- - - - - -
//Font Family name -> [Bodoni 72 Smallcaps]
//Font names = = [["BodoniSvtyTwoSCITCTT-Book"]]
//- - - - - -
//Font Family name -> [Bodoni Ornaments]
//Font names = = [["BodoniOrnamentsITCTT"]]
//- - - - - -
//Font Family name -> [Bradley Hand]
//Font names = = [["BradleyHandITCTT-Bold"]]
//- - - - - -
//Font Family name -> [Chalkboard SE]
//Font names = = [["ChalkboardSE-Regular", "ChalkboardSE-Light", "ChalkboardSE-Bold"]]
//- - - - - -
//Font Family name -> [Chalkduster]
//Font names = = [["Chalkduster"]]
//- - - - - -
//Font Family name -> [Charter]
//Font names = = [["Charter-Roman", "Charter-Italic", "Charter-Bold", "Charter-BoldItalic", "Charter-Black", "Charter-BlackItalic"]]
//- - - - - -
//Font Family name -> [Cochin]
//Font names = = [["Cochin", "Cochin-Italic", "Cochin-Bold", "Cochin-BoldItalic"]]
//- - - - - -
//Font Family name -> [Copperplate]
//Font names = = [["Copperplate", "Copperplate-Light", "Copperplate-Bold"]]
//- - - - - -
//Font Family name -> [Courier New]
//Font names = = [["CourierNewPSMT", "CourierNewPS-ItalicMT", "CourierNewPS-BoldMT", "CourierNewPS-BoldItalicMT"]]
//- - - - - -
//Font Family name -> [Damascus]
//Font names = = [["Damascus", "DamascusLight", "DamascusMedium", "DamascusSemiBold", "DamascusBold"]]
//- - - - - -
//Font Family name -> [Devanagari Sangam MN]
//Font names = = [["DevanagariSangamMN", "DevanagariSangamMN-Bold"]]
//- - - - - -
//Font Family name -> [Didot]
//Font names = = [["Didot", "Didot-Italic", "Didot-Bold"]]
//- - - - - -
//Font Family name -> [DIN Alternate]
//Font names = = [["DINAlternate-Bold"]]
//- - - - - -
//Font Family name -> [DIN Condensed]
//Font names = = [["DINCondensed-Bold"]]
//- - - - - -
//Font Family name -> [Euphemia UCAS]
//Font names = = [["EuphemiaUCAS", "EuphemiaUCAS-Italic", "EuphemiaUCAS-Bold"]]
//- - - - - -
//Font Family name -> [Farah]
//Font names = = [["Farah"]]
//- - - - - -
//Font Family name -> [Futura]
//Font names = = [["Futura-Medium", "Futura-MediumItalic", "Futura-Bold", "Futura-CondensedMedium", "Futura-CondensedExtraBold"]]
//- - - - - -
//Font Family name -> [Galvji]
//Font names = = [["Galvji", "Galvji-Bold"]]
//- - - - - -
//Font Family name -> [Geeza Pro]
//Font names = = [["GeezaPro", "GeezaPro-Bold"]]
//- - - - - -
//Font Family name -> [Georgia]
//Font names = = [["Georgia", "Georgia-Italic", "Georgia-Bold", "Georgia-BoldItalic"]]
//- - - - - -
//Font Family name -> [Gill Sans]
//Font names = = [["GillSans", "GillSans-Italic", "GillSans-Light", "GillSans-LightItalic", "GillSans-SemiBold", "GillSans-SemiBoldItalic", "GillSans-Bold", "GillSans-BoldItalic", "GillSans-UltraBold"]]
//- - - - - -
//Font Family name -> [Grantha Sangam MN]
//Font names = = [["GranthaSangamMN-Regular", "GranthaSangamMN-Bold"]]
//- - - - - -
//Font Family name -> [Helvetica]
//Font names = = [["Helvetica", "Helvetica-Oblique", "Helvetica-Light", "Helvetica-LightOblique", "Helvetica-Bold", "Helvetica-BoldOblique"]]
//- - - - - -
//Font Family name -> [Helvetica Neue]
//Font names = = [["HelveticaNeue", "HelveticaNeue-Italic", "HelveticaNeue-UltraLight", "HelveticaNeue-UltraLightItalic", "HelveticaNeue-Thin", "HelveticaNeue-ThinItalic", "HelveticaNeue-Light", "HelveticaNeue-LightItalic", "HelveticaNeue-Medium", "HelveticaNeue-MediumItalic", "HelveticaNeue-Bold", "HelveticaNeue-BoldItalic", "HelveticaNeue-CondensedBold", "HelveticaNeue-CondensedBlack"]]
//- - - - - -
//Font Family name -> [Hiragino Maru Gothic ProN]
//Font names = = [["HiraMaruProN-W4"]]
//- - - - - -
//Font Family name -> [Hiragino Mincho ProN]
//Font names = = [["HiraMinProN-W3", "HiraMinProN-W6"]]
//- - - - - -
//Font Family name -> [Hiragino Sans]
//Font names = = [["HiraginoSans-W3", "HiraginoSans-W6", "HiraginoSans-W7"]]
//- - - - - -
//Font Family name -> [Hoefler Text]
//Font names = = [["HoeflerText-Regular", "HoeflerText-Italic", "HoeflerText-Black", "HoeflerText-BlackItalic"]]
//- - - - - -
//Font Family name -> [Impact]
//Font names = = [["Impact"]]
//- - - - - -
//Font Family name -> [Kailasa]
//Font names = = [["Kailasa", "Kailasa-Bold"]]
//- - - - - -
//Font Family name -> [Kefa]
//Font names = = [["Kefa-Regular"]]
//- - - - - -
//Font Family name -> [Khmer Sangam MN]
//Font names = = [["KhmerSangamMN"]]
//- - - - - -
//Font Family name -> [Kohinoor Bangla]
//Font names = = [["KohinoorBangla-Regular", "KohinoorBangla-Light", "KohinoorBangla-Semibold"]]
//- - - - - -
//Font Family name -> [Kohinoor Devanagari]
//Font names = = [["KohinoorDevanagari-Regular", "KohinoorDevanagari-Light", "KohinoorDevanagari-Semibold"]]
//- - - - - -
//Font Family name -> [Kohinoor Gujarati]
//Font names = = [["KohinoorGujarati-Regular", "KohinoorGujarati-Light", "KohinoorGujarati-Bold"]]
//- - - - - -
//Font Family name -> [Kohinoor Telugu]
//Font names = = [["KohinoorTelugu-Regular", "KohinoorTelugu-Light", "KohinoorTelugu-Medium"]]
//- - - - - -
//Font Family name -> [Lao Sangam MN]
//Font names = = [["LaoSangamMN"]]
//- - - - - -
//Font Family name -> [Malayalam Sangam MN]
//Font names = = [["MalayalamSangamMN", "MalayalamSangamMN-Bold"]]
//- - - - - -
//Font Family name -> [Marker Felt]
//Font names = = [["MarkerFelt-Thin", "MarkerFelt-Wide"]]
//- - - - - -
//Font Family name -> [Menlo]
//Font names = = [["Menlo-Regular", "Menlo-Italic", "Menlo-Bold", "Menlo-BoldItalic"]]
//- - - - - -
//Font Family name -> [Mishafi]
//Font names = = [["DiwanMishafi"]]
//- - - - - -
//Font Family name -> [Mukta Mahee]
//Font names = = [["MuktaMahee-Regular", "MuktaMahee-Light", "MuktaMahee-Bold"]]
//- - - - - -
//Font Family name -> [Myanmar Sangam MN]
//Font names = = [["MyanmarSangamMN", "MyanmarSangamMN-Bold"]]
//- - - - - -
//Font Family name -> [Noteworthy]
//Font names = = [["Noteworthy-Light", "Noteworthy-Bold"]]
//- - - - - -
//Font Family name -> [Noto Nastaliq Urdu]
//Font names = = [["NotoNastaliqUrdu", "NotoNastaliqUrdu-Bold"]]
//- - - - - -
//Font Family name -> [Noto Sans Kannada]
//Font names = = [["NotoSansKannada-Regular", "NotoSansKannada-Light", "NotoSansKannada-Bold"]]
//- - - - - -
//Font Family name -> [Noto Sans Myanmar]
//Font names = = [["NotoSansMyanmar-Regular", "NotoSansMyanmar-Light", "NotoSansMyanmar-Bold"]]
//- - - - - -
//Font Family name -> [Noto Sans Oriya]
//Font names = = [["NotoSansOriya", "NotoSansOriya-Bold"]]
//- - - - - -
//Font Family name -> [Optima]
//Font names = = [["Optima-Regular", "Optima-Italic", "Optima-Bold", "Optima-BoldItalic", "Optima-ExtraBlack"]]
//- - - - - -
//Font Family name -> [Palatino]
//Font names = = [["Palatino-Roman", "Palatino-Italic", "Palatino-Bold", "Palatino-BoldItalic"]]
//- - - - - -
//Font Family name -> [Papyrus]
//Font names = = [["Papyrus", "Papyrus-Condensed"]]
//- - - - - -
//Font Family name -> [Party LET]
//Font names = = [["PartyLetPlain"]]
//- - - - - -
//Font Family name -> [PingFang HK]
//Font names = = [["PingFangHK-Regular", "PingFangHK-Ultralight", "PingFangHK-Thin", "PingFangHK-Light", "PingFangHK-Medium", "PingFangHK-Semibold"]]
//- - - - - -
//Font Family name -> [PingFang SC]
//Font names = = [["PingFangSC-Regular", "PingFangSC-Ultralight", "PingFangSC-Thin", "PingFangSC-Light", "PingFangSC-Medium", "PingFangSC-Semibold"]]
//- - - - - -
//Font Family name -> [PingFang TC]
//Font names = = [["PingFangTC-Regular", "PingFangTC-Ultralight", "PingFangTC-Thin", "PingFangTC-Light", "PingFangTC-Medium", "PingFangTC-Semibold"]]
//- - - - - -
//Font Family name -> [Rockwell]
//Font names = = [["Rockwell-Regular", "Rockwell-Italic", "Rockwell-Bold", "Rockwell-BoldItalic"]]
//- - - - - -
//Font Family name -> [Savoye LET]
//Font names = = [["SavoyeLetPlain"]]
//- - - - - -
//Font Family name -> [Sinhala Sangam MN]
//Font names = = [["SinhalaSangamMN", "SinhalaSangamMN-Bold"]]
//- - - - - -
//Font Family name -> [Snell Roundhand]
//Font names = = [["SnellRoundhand", "SnellRoundhand-Bold", "SnellRoundhand-Black"]]
//- - - - - -
//Font Family name -> [STIX Two Math]
//Font names = = [["STIXTwoMath-Regular"]]
//- - - - - -
//Font Family name -> [STIX Two Text]
//Font names = = [["STIXTwoText", "STIXTwoText-Italic", "STIXTwoText_Medium", "STIXTwoText-Italic_Medium-Italic", "STIXTwoText_SemiBold", "STIXTwoText-Italic_SemiBold-Italic", "STIXTwoText_Bold", "STIXTwoText-Italic_Bold-Italic"]]
//- - - - - -
//Font Family name -> [Symbol]
//Font names = = [["Symbol"]]
//- - - - - -
//Font Family name -> [Tamil Sangam MN]
//Font names = = [["TamilSangamMN", "TamilSangamMN-Bold"]]
//- - - - - -
//Font Family name -> [Thonburi]
//Font names = = [["Thonburi", "Thonburi-Light", "Thonburi-Bold"]]
//- - - - - -
//Font Family name -> [Times New Roman]
//Font names = = [["TimesNewRomanPSMT", "TimesNewRomanPS-ItalicMT", "TimesNewRomanPS-BoldMT", "TimesNewRomanPS-BoldItalicMT"]]
//- - - - - -
//Font Family name -> [Trebuchet MS]
//Font names = = [["TrebuchetMS", "TrebuchetMS-Italic", "TrebuchetMS-Bold", "Trebuchet-BoldItalic"]]
//- - - - - -
//Font Family name -> [Verdana]
//Font names = = [["Verdana", "Verdana-Italic", "Verdana-Bold", "Verdana-BoldItalic"]]
//- - - - - -
//Font Family name -> [Zapf Dingbats]
//Font names = = [["ZapfDingbatsITC"]]
//- - - - - -
//Font Family name -> [Zapfino]
//Font names = = [["Zapfino"]]
//

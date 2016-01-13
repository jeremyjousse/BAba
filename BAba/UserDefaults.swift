import Cocoa

class UserDefaults {
    private let userDefaults = NSUserDefaults.standardUserDefaults()

    private let activeViewKey = "activeView"
    private let syllableKey = "syllable"
    private let numberGeneratorKey = "numberGenerator"

//    private let activeVoiceKey = "activeVoice"
//    private let activeTextKey = "activeText"

    init () {
        registerDefaultPreferences()
    }

    func registerDefaultPreferences() {
        let defaults = [
            syllableKey : [
                "actualConsonant" : 0,
                "actualVowel" : 0
            ],
            numberGeneratorKey : [
                "maxNumberLabel" : 100,
                "minNumber" : 0,
                "actualNumber" : 1
            ],
            activeViewKey : ""
        ]
        userDefaults.registerDefaults(defaults)
    }

    var activeView: String? {
        get {
            return userDefaults.objectForKey(activeViewKey) as? String
        }
        set(newActiveView) {
            userDefaults.setObject(newActiveView, forKey: activeViewKey)
        }
    }
}

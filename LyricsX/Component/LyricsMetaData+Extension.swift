//
//  LyricsMetaData+Extension.swift
//
//  This file is part of LyricsX - https://github.com/ddddxxx/LyricsX
//  Copyright (C) 2017  Xander Deng. Licensed under GPLv3.
//

import Foundation
import LyricsCore

extension Lyrics.MetaData.Key {
    static var localURL = Lyrics.MetaData.Key("localURL")
    static var title = Lyrics.MetaData.Key("title")
    static var artist = Lyrics.MetaData.Key("artist")
    static var needsPersist = Lyrics.MetaData.Key("needsPersist")
    static var language = Lyrics.MetaData.Key("language")
}

extension Lyrics.MetaData {
    
    var localURL: URL? {
        get { return data[.localURL] as? URL }
        set { data[.localURL] = newValue }
    }
    
    var title: String? {
        get { return request?.title ?? data[.title] as? String }
        set { data[.title] = newValue }
    }
    
    var artist: String? {
        get { return request?.artist ?? data[.artist] as? String }
        set { data[.artist] = newValue }
    }
    
    var needsPersist: Bool {
        get { return data[.needsPersist] as? Bool ?? false }
        set { data[.needsPersist] = newValue }
    }
    
    var language: String? {
        get { return data[.language] as? String }
        set { data[.language] = newValue }
    }
    
    var translationLanguages: [String] {
        return attachmentTags.compactMap { $0.translationLanguageCode }
    }
}

private extension LyricsLine.Attachments.Tag {
    var translationLanguageCode: String? {
        guard rawValue.hasPrefix("tr:") else {
            return nil
        }
        let code = rawValue.dropFirst(3)
        return code.isEmpty ? nil : String(code)
    }
}

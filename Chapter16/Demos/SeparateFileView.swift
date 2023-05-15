//
//  SepFileView.swift
//  Chapter16
//
//  Created by Mike Panitz on 5/14/23.
//

import SwiftUI

struct SeparateFileView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("This is a separate structure")
                Text("that's stored in a separate file")
                Spacer()
            }
            Spacer()
        }.background(Color.green)
    }
}

struct SeparateFileView_Previews: PreviewProvider {
    static var previews: some View {
        SeparateFileView()
    }
}

//
//  ChangeAppIconView.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import SwiftUI

struct ChangeAppIconView: View {
    @StateObject var viewModel = ChangeAppIconViewModel()

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 11) {
                    ForEach(AppIcon.allCases) { appIcon in
                        VStack {
                            HStack(spacing: 16) {
                                Image(uiImage: appIcon.preview)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(12)
                                Text(appIcon.description)
                                    .font(.body)
                                Spacer()
                                CheckboxView(isSelected: viewModel.selectedAppIcon == appIcon)
                            }
                            .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.updateAppIcon(to: appIcon)
                                }
                            }
                            Divider()
                        }
                    }
                }.padding(.horizontal)
                    .padding(.vertical, 40)
            }
        }
        .navigationTitle(R.string.localizable.settings_app_icon())
    }
}

struct ChangeAppIconView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAppIconView()
    }
}

struct CheckboxView: View {
    let isSelected: Bool

    private var image: Image {
        let imageName = isSelected ? "checkmark.square" : "square"
        return Image(systemName: imageName)
    }

    var body: some View {
        image
            .resizable()
            .frame(width: 20, height: 20)
    }
}
